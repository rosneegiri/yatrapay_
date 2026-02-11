<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Route extends Model
{
    use HasFactory;

    protected $fillable = [
        'route_name',
        'start_location',
        'end_location',
        'distance',
        'fare',
        'status',
    ];

    protected $casts = [
        'distance' => 'decimal:2',
        'fare' => 'decimal:2',
    ];

    public function trips()
    {
        return $this->hasMany(Trip::class);
    }
}
