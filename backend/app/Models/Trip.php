<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    use HasFactory;

    protected $fillable = [
        'bus_id',
        'route_id',
        'bus_number',
        'start_time',
        'end_time',
        'fare',
        'available_seats',
        'status',
    ];

    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
        'fare' => 'decimal:2',
    ];

    protected $appends = ['route_name', 'start_location', 'end_location'];

    public function route()
    {
        return $this->belongsTo(Route::class);
    }

    public function bus()
    {
        return $this->belongsTo(Bus::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    // Accessors for route details
    public function getRouteNameAttribute()
    {
        return $this->route ? $this->route->route_name : null;
    }

    public function getStartLocationAttribute()
    {
        return $this->route ? $this->route->start_location : null;
    }

    public function getEndLocationAttribute()
    {
        return $this->route ? $this->route->end_location : null;
    }
}
