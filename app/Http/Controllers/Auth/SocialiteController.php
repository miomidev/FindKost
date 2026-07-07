<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class SocialiteController extends Controller
{
    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        try {
            $googleUser = Socialite::driver('google')->user();

            // Cek apakah user dengan google_id tersebut sudah ada
            $user = User::where('google_id', $googleUser->getId())->first();

            if (! $user) {
                // Jika tidak ada google_id, cek apakah emailnya sudah terdaftar secara manual
                $user = User::where('email', $googleUser->getEmail())->first();

                if ($user) {
                    // Update user tersebut dengan google_id
                    $user->update(['google_id' => $googleUser->getId()]);
                } else {
                    // Jika benar-benar user baru, daftarkan sebagai penyewa
                    $user = User::create([
                        'name' => $googleUser->getName(),
                        'email' => $googleUser->getEmail(),
                        'google_id' => $googleUser->getId(),
                        'password' => bcrypt(Str::random(16)), // Password acak karena login via google
                        'role' => 'penyewa', // Role default yang disepakati
                        'status' => 'aktif'
                    ]);
                }
            }

            // Jika user belum punya foto, coba download dari Google
            if (empty($user->photo) && $googleUser->getAvatar()) {
                try {
                    $avatarContents = file_get_contents($googleUser->getAvatar());
                    $avatarName = 'google_avatar_' . time() . '_' . Str::random(5) . '.jpg';
                    
                    // Sesuaikan path berdasar role karena perbedaan format folder di blade
                    $avatarPath = ($user->role === 'penyewa') ? 'profile/' . $avatarName : $avatarName;
                    
                    Storage::disk('public')->put('profile/' . $avatarName, $avatarContents);
                    $user->update(['photo' => $avatarPath]);
                } catch (\Exception $e) {
                    // Abaikan jika gagal
                }
            }

            // Login user
            Auth::login($user);

            // Redirect ke dashboard (middleware yang sudah ada akan mengurus redirect berdasarkan role)
            return redirect()->route('dashboard');

        } catch (\Exception $e) {
            return redirect('/login')->with('error', 'Terjadi kesalahan saat login menggunakan Google. Silakan coba lagi.');
        }
    }
}
