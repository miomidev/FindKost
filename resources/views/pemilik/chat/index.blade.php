@extends('layouts.app')

@section('content')
    <style>
        .chat-list-container {
            border-radius: 16px;
            background: white;
        }

        .chat-list-item:first-child {
            border-top-left-radius: 16px;
            border-top-right-radius: 16px;
        }

        .chat-list-item:last-child {
            border-bottom-left-radius: 16px;
            border-bottom-right-radius: 16px;
            border-bottom: none;
        }

        .chat-list-item {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 20px;
            border-bottom: 1px solid #f0f1f3;
            text-decoration: none;
            color: inherit;
            transition: background 0.15s;
            cursor: pointer;
        }

        .chat-list-item:hover {
            background: #f0f4ff;
            color: inherit;
        }

        .chat-list-item.has-unread {
            background: #f8f9ff;
        }

        .chat-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0d6efd, #6610f2);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
            flex-shrink: 0;
        }

        .chat-info {
            flex: 1;
            min-width: 0;
        }

        .chat-name {
            font-weight: 600;
            font-size: 15px;
            margin-bottom: 2px;
        }

        .chat-kos-label {
            font-size: 12px;
            margin-bottom: 2px;
        }

        .chat-kos-label .label-tanya {
            color: #6b7280;
        }

        .chat-kos-label .label-penyewa {
            color: #059669;
            font-weight: 600;
        }

        .chat-last-msg {
            font-size: 13px;
            color: #9ca3af;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .chat-meta {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 6px;
            flex-shrink: 0;
        }

        .chat-time {
            font-size: 11px;
            color: #9ca3af;
        }

        .chat-badge {
            background: #0d6efd;
            color: white;
            font-size: 11px;
            padding: 2px 8px;
            border-radius: 12px;
            font-weight: 600;
            min-width: 22px;
            text-align: center;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #9ca3af;
        }

        .empty-state i {
            font-size: 60px;
            margin-bottom: 16px;
            display: block;
        }
    </style>

    <div class="d-flex">
        @include('components.sidebar-pemilik')

        <div class="flex-grow-1">
            <div class="topbar d-flex justify-content-end align-items-center px-4 gap-1">
                @include('components.notif-pemilik')
                @include('components.chat-icon-pemilik')
                <button type="button" class="btn text-white d-flex align-items-center" data-bs-toggle="modal"
                    data-bs-target="#profileModal">
                    <span class="me-2">{{ Auth::user()->name }}</span>
                    @if (Auth::user()->photo)
                        <img src="{{ asset('storage/' . Auth::user()->photo) }}"
                            style="width:40px;height:40px;border-radius:50%;object-fit:cover;border:2px solid white;">
                    @else
                        <i class="bi bi-person-circle fs-3"></i>
                    @endif
                </button>
            </div>

            <div class="p-4" style="background:#f5f7fb;min-height:100vh;">
                <h3 class="fw-bold mb-1" style="font-size: 28px;">
                    <i class="bi bi-chat-dots me-2"></i>Chat
                </h3>
                <small class="text-muted d-block mb-4">Percakapan dengan penyewa</small>

                <div class="card shadow-sm border-0 chat-list-container" id="chatListContainer">
                    @forelse($chats as $chat)
                        @php
                            $unread = $chat->unreadCountFor(Auth::id());
                            $latest = $chat->latestMessage;

                            // Cek booking status
                            $booking = \App\Models\PengajuanSewa::with('kamar')
                                ->where('user_id', $chat->penyewa_id)
                                ->whereHas('kos', function ($q) {
                                    $q->where('user_id', Auth::id());
                                })
                                ->whereIn('status', ['disetujui', 'aktif'])
                                ->latest()
                                ->first();

                            $bookingLabel = $booking && $booking->kamar
                                ? 'Penyewa di ' . ($booking->kos->nama_kos ?? '-') . ' - ' . $booking->kamar->nama_kamar
                                : 'Tanya tentang ' . ($chat->kos->nama_kos ?? '-');
                            $isBooked = $booking && $booking->kamar;
                        @endphp
                        <div class="chat-list-item {{ $unread > 0 ? 'has-unread' : '' }}" data-chat-id="{{ $chat->id }}">
                            <a href="{{ route('chat.show', $chat->id) }}" class="d-flex flex-grow-1 align-items-center text-decoration-none text-dark" style="gap: 14px; min-width: 0;">
                                <div class="chat-avatar">
                                    {{ strtoupper(substr($chat->penyewa->name, 0, 1)) }}
                                </div>

                                <div class="chat-info">
                                    <div class="chat-name">{{ $chat->penyewa->name }}</div>
                                    <div class="chat-kos-label">
                                        @if ($isBooked)
                                            <span class="label-penyewa">
                                                <i class="bi bi-check-circle-fill me-1"></i>{{ $bookingLabel }}
                                            </span>
                                        @else
                                            <span class="label-tanya">
                                                <i class="bi bi-house me-1"></i>{{ $bookingLabel }}
                                            </span>
                                        @endif
                                    </div>
                                    <div class="chat-last-msg">
                                        @if ($latest)
                                            @if ($latest->sender_id === Auth::id())
                                                <span class="text-muted">Anda: </span>
                                            @endif
                                            {{ Str::limit($latest->message, 50) }}
                                        @else
                                            Belum ada pesan
                                        @endif
                                    </div>
                                </div>

                                <div class="chat-meta">
                                    @if ($latest)
                                        <span class="chat-time">
                                            {{ $latest->created_at->isToday() ? $latest->created_at->format('H:i') : $latest->created_at->format('d/m') }}
                                        </span>
                                    @endif
                                    @if ($unread > 0)
                                        <span class="chat-badge">{{ $unread }}</span>
                                    @endif
                                </div>
                            </a>
                            <div class="dropdown ms-2">
                                <button class="btn btn-sm text-muted border-0 bg-transparent" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-three-dots-vertical"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0">
                                    <li>
                                        <form action="{{ route('chat.destroy', $chat->id) }}" method="POST" class="delete-chat-form">
                                            @csrf
                                            @method('DELETE')
                                            <button type="button" class="dropdown-item text-danger btn-delete-chat">
                                                <i class="bi bi-trash me-2"></i> Hapus Obrolan
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    @empty
                        <div class="empty-state">
                            <i class="bi bi-chat-square-text"></i>
                            <h5 class="text-muted">Belum ada percakapan</h5>
                            <p class="text-muted">Penyewa akan menghubungi Anda melalui halaman detail kos.</p>
                        </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>

    {{-- Profile Modal --}}
    <div class="modal fade" id="profileModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content p-3 text-center" style="border-radius:20px;">
                <div class="mb-3">
                    <div class="fw-bold">{{ Auth::user()->name }}</div>
                    <small class="text-muted">{{ Auth::user()->email }}</small>
                </div>
                <a href="{{ route('pemilik.profile') }}" class="btn btn-primary w-100 mb-2">Profil</a>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button class="btn btn-danger w-100">Logout</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('chatListContainer');

            function renderChatList(chats) {
                if (chats.length === 0) {
                    container.innerHTML = `
                        <div class="empty-state">
                            <i class="bi bi-chat-square-text"></i>
                            <h5 class="text-muted">Belum ada percakapan</h5>
                            <p class="text-muted">Penyewa akan menghubungi Anda melalui halaman detail kos.</p>
                        </div>
                    `;
                    return;
                }

                let html = '';
                const csrfToken = '{{ csrf_token() }}';
                chats.forEach(chat => {
                    const unreadClass = chat.unread > 0 ? 'has-unread' : '';
                    const lastMsgHtml = chat.last_message
                        ? `${chat.last_message_is_mine ? '<span class="text-muted">Anda: </span>' : ''}${escapeHtml(chat.last_message)}`
                        : 'Belum ada pesan';

                    // Booking label dengan icon dan warna
                    let labelHtml = '';
                    if (chat.booking_label) {
                        const isBooked = chat.booking_label.startsWith('Penyewa di');
                        if (isBooked) {
                            labelHtml = `<span class="label-penyewa"><i class="bi bi-check-circle-fill me-1"></i>${escapeHtml(chat.booking_label)}</span>`;
                        } else {
                            labelHtml = `<span class="label-tanya"><i class="bi bi-house me-1"></i>${escapeHtml(chat.booking_label)}</span>`;
                        }
                    }

                    html += `
                        <div class="chat-list-item ${unreadClass}" data-chat-id="${chat.id}">
                            <a href="/chat/${chat.id}" class="d-flex flex-grow-1 align-items-center text-decoration-none text-dark" style="gap: 14px; min-width: 0;">
                                <div class="chat-avatar">${chat.partner_initial}</div>
                                <div class="chat-info">
                                    <div class="chat-name">${escapeHtml(chat.partner_name)}</div>
                                    <div class="chat-kos-label">${labelHtml}</div>
                                    <div class="chat-last-msg">${lastMsgHtml}</div>
                                </div>
                                <div class="chat-meta">
                                    ${chat.last_message_time ? `<span class="chat-time">${chat.last_message_time}</span>` : ''}
                                    ${chat.unread > 0 ? `<span class="chat-badge">${chat.unread}</span>` : ''}
                                </div>
                            </a>
                            <div class="dropdown ms-2">
                                <button class="btn btn-sm text-muted border-0 bg-transparent" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-three-dots-vertical"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0">
                                    <li>
                                        <form action="/chat/${chat.id}" method="POST" class="delete-chat-form">
                                            <input type="hidden" name="_token" value="${csrfToken}">
                                            <input type="hidden" name="_method" value="DELETE">
                                            <button type="button" class="dropdown-item text-danger btn-delete-chat">
                                                <i class="bi bi-trash me-2"></i> Hapus Obrolan
                                            </button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    `;
                });
                container.innerHTML = html;
            }

            function escapeHtml(text) {
                const el = document.createElement('span');
                el.textContent = text;
                return el.innerHTML;
            }

            function pollChatList() {
                fetch('/chat-list-json', {
                    headers: { 'Accept': 'application/json' },
                })
                .then(res => res.json())
                .then(data => {
                    if (data.chats) {
                        renderChatList(data.chats);
                    }
                })
                .catch(err => console.error('Poll chat list error:', err));
            }

            // Delegated click event for SweetAlert2 on delete buttons
            container.addEventListener('click', function(e) {
                const btnDelete = e.target.closest('.btn-delete-chat');
                if (btnDelete) {
                    e.preventDefault();
                    let form = btnDelete.closest('form');
                    Swal.fire({
                        title: 'Yakin hapus obrolan?',
                        text: "Riwayat obrolan ini akan dihapus permanen!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#6c757d',
                        confirmButtonText: 'Ya, hapus',
                        cancelButtonText: 'Batal'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            fetch(form.action, {
                                method: 'POST',
                                body: new FormData(form),
                                headers: {
                                    'X-Requested-With': 'XMLHttpRequest'
                                }
                            }).then(res => res.json()).then(data => {
                                if(data.success) {
                                    pollChatList();
                                    Swal.fire({
                                        title: 'Terhapus!',
                                        text: data.message,
                                        icon: 'success',
                                        timer: 1500,
                                        showConfirmButton: false
                                    });
                                }
                            });
                        }
                    });
                }
            });

            // Poll setiap 3 detik
            setInterval(pollChatList, 3000);
        });
    </script>
@endsection
