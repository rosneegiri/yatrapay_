<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Booking;

class BookingController extends Controller
{
    public function index()
    {
        $bookings = Booking::where('user_id', auth()->id())->latest()->get();

        return response()->json([
            'success' => true,
            'data' => $bookings
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'trip_id' => 'required|exists:trips,id',
            'seats' => 'required|integer|min:1',
            'total_amount' => 'required|numeric'
        ]);

        $booking = Booking::create([
            'user_id' => auth()->id(),
            'trip_id' => $request->trip_id,
            'seats' => $request->seats,
            'total_amount' => $request->total_amount,
            'status' => 'confirmed',
        ]);

        return response()->json([
            'success' => true,
            'data' => $booking
        ]);
    }

    public function show($id)
    {
        $booking = Booking::where('user_id', auth()->id())
            ->findOrFail($id);

        return response()->json([
            'success' => true,
            'data' => $booking
        ]);
    }

    public function destroy($id)
    {
        $booking = Booking::where('user_id', auth()->id())
            ->findOrFail($id);

        $booking->delete();

        return response()->json([
            'success' => true,
            'message' => 'Booking cancelled'
        ]);
    }
}
