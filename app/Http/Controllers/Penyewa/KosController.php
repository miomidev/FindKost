<?php

namespace App\Http\Controllers\Penyewa;

use App\Http\Controllers\Controller;
use App\Models\Kos;
use App\Services\RecommendationScoringService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class KosController extends Controller
{
    public function __construct(private RecommendationScoringService $recommendationScoring) {}

    public function index()
    {
        $user = Auth::user();
        $rekomendasi = $this->recommendationScoring->rankForUser($user, 3);

        return view('penyewa.dashboard', compact('rekomendasi'));
    }

    public function search(Request $request)
    {
        $search = $request->search;

        $kos = Kos::with('kamars')
            ->where('status', 'disetujui')
            ->whereHas('user', function ($q) {
                $q->where('status', 'aktif');
            })
            // Filter Search (Nama & Lokasi)
            ->when($search, function ($query) use ($search) {
                $query->where(function ($q) use ($search) {

                    // 1. Full phrase selalu dicoba (prioritas utama)
                    $q->where('nama_kos', 'like', "%$search%")
                        ->orWhere('lokasi', 'like', "%$search%");

                    // 2. Strip kata umum kos/kost/kostel, ambil sisa kata bermakna
                    $stopWords = ['kos', 'kost', 'kostel', 'kontrakan'];
                    $keywords = array_filter(explode(' ', trim(strtolower($search))));
                    $meaningful = array_filter($keywords, function ($word) use ($stopWords) {
                        return strlen($word) >= 3 && !in_array($word, $stopWords);
                    });

                    // 3. Fallback per-kata HANYA dari kata bermakna
                    if (count($meaningful) > 0) {
                        foreach ($meaningful as $word) {
                            $q->orWhere('nama_kos', 'like', "%$word%")
                                ->orWhere('lokasi', 'like', "%$word%");
                        }
                    }

                    // 4. Tanpa spasi (untuk typo spasi)
                    $noSpace = str_replace(' ', '', $search);
                    if (strlen($noSpace) >= 3) {
                        $q->orWhereRaw("REPLACE(nama_kos, ' ', '') LIKE ?", ["%$noSpace%"])
                            ->orWhereRaw("REPLACE(lokasi, ' ', '') LIKE ?", ["%$noSpace%"]);
                    }
                });
            })
            // Filter Kamar: gabungkan fasilitas + harga + tipe_harga dalam 1 whereHas
            // agar semua kondisi harus terpenuhi di KAMAR YANG SAMA
            ->when(
                $request->filled('fasilitas') || $request->filled('min_harga') || $request->filled('max_harga') || $request->filled('tipe_harga'),
                function ($query) use ($request) {
                    $query->whereHas('kamars', function ($q) use ($request) {
                        $q->where('status', 'tersedia');

                        if ($request->filled('fasilitas')) {
                            foreach ($request->fasilitas as $fasilitas) {
                                $q->whereRaw('JSON_CONTAINS(fasilitas, ?)', [json_encode($fasilitas)]);
                            }
                        }
                        if ($request->filled('min_harga')) {
                            $q->where('harga', '>=', $request->min_harga);
                        }
                        if ($request->filled('max_harga')) {
                            $q->where('harga', '<=', $request->max_harga);
                        }
                        if ($request->filled('tipe_harga')) {
                            $q->where('tipe_harga', $request->tipe_harga);
                        }
                    });
                }
            )
            // Filter Tipe Kos (level kos, bukan kamar)
            ->when($request->filled('tipe_kos'), function ($query) use ($request) {
                $query->where('tipe_kos', $request->tipe_kos);
            })
            // Relevance ordering: exact name match muncul duluan
            ->when($search, function ($query) use ($search) {
                $query->orderByRaw("CASE WHEN nama_kos LIKE ? THEN 0 ELSE 1 END", ["%$search%"]);
            })
            ->latest()
            ->paginate(6)
            ->withQueryString();

        // Belajar dari hasil pencarian agar preferensi makin adaptif.
        if ($search && $kos->isNotEmpty()) {
            $this->recommendationScoring->learnFromSearchResult(Auth::user(), $kos->first());
        }

        // Pass SEMUA filter params ke view untuk menampilkan harga yg sesuai
        $filterMinHarga = $request->min_harga;
        $filterMaxHarga = $request->max_harga;
        $filterTipeHarga = $request->tipe_harga;
        $filterFasilitas = $request->fasilitas;

        return view('penyewa.cari', compact('kos', 'search', 'filterMinHarga', 'filterMaxHarga', 'filterTipeHarga', 'filterFasilitas'));
    }

    // fungsi untuk menyimpan preferensi user berdasarkan kos yang dilihat
    public function show($id)
    {
        $kos = Kos::with(['kamars' => function ($query) {
            $query->where('status', 'tersedia');
        }])
            ->where('status', 'disetujui')
            ->whereHas('user', function ($q) {
                $q->where('status', 'aktif');
            })
            ->findOrFail($id);
        $kamars = $kos->kamars()
            ->where('status', 'tersedia')
            ->paginate(6);
        $this->recommendationScoring->learnFromKosView(Auth::user(), $kos);

        return view('penyewa.detail', compact('kos','kamars'));
    }
}
