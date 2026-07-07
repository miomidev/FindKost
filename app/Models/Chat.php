<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    protected $fillable = [
        'penyewa_id',
        'pemilik_id',
        'kos_id',
        'penyewa_cleared_at',
        'pemilik_cleared_at',
    ];

    public function penyewa()
    {
        return $this->belongsTo(User::class, 'penyewa_id');
    }

    public function pemilik()
    {
        return $this->belongsTo(User::class, 'pemilik_id');
    }

    public function kos()
    {
        return $this->belongsTo(Kos::class);
    }

    public function messages()
    {
        return $this->hasMany(ChatMessage::class)->orderBy('created_at', 'asc');
    }

    public function latestMessage()
    {
        return $this->hasOne(ChatMessage::class)->latestOfMany();
    }

    public function unreadCountFor(int $userId): int
    {
        $clearedAt = null;
        if ($this->penyewa_id === $userId) {
            $clearedAt = $this->penyewa_cleared_at;
        } elseif ($this->pemilik_id === $userId) {
            $clearedAt = $this->pemilik_cleared_at;
        }

        return $this->messages()
            ->where('sender_id', '!=', $userId)
            ->where('is_read', false)
            ->when($clearedAt, function ($q) use ($clearedAt) {
                $q->where('created_at', '>', $clearedAt);
            })
            ->count();
    }

    public static function totalUnreadFor(int $userId): int
    {
        return static::where(function ($q) use ($userId) {
            $q->where('penyewa_id', $userId)
              ->orWhere('pemilik_id', $userId);
        })
        ->whereHas('messages', function ($q) use ($userId) {
            $q->where('sender_id', '!=', $userId)
              ->where('is_read', false)
              ->whereRaw('(
                  (chats.penyewa_id = ? AND (chats.penyewa_cleared_at IS NULL OR chat_messages.created_at > chats.penyewa_cleared_at)) OR
                  (chats.pemilik_id = ? AND (chats.pemilik_cleared_at IS NULL OR chat_messages.created_at > chats.pemilik_cleared_at))
              )', [$userId, $userId]);
        })
        ->count();
    }
}
