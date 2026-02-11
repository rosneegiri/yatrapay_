<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Trip;
use Illuminate\Http\Request;

class TripController extends Controller
{
    public function index(Request $request)
    {
        $query = Trip::with('route');

        // Filter by status
        if ($request->has('status')) {
            $query->where('status', $request->status);
        }

        // Filter by route
        if ($request->has('route_id')) {
            $query->where('route_id', $request->route_id);
        }

        // Filter by date
        if ($request->has('date')) {
            $query->whereDate('start_time', $request->date);
        }

        $trips = $query->get();
        return response()->json($trips);
    }

    public function activeTrips()
    {
        $trips = Trip::with('route')
            ->whereIn('status', ['scheduled', 'active'])
            ->where('start_time', '>=', now())
            ->orderBy('start_time', 'asc')
            ->get();

        return response()->json($trips);
    }

    public function show($id)
    {
        $trip = Trip::with('route')->findOrFail($id);
        return response()->json($trip);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'bus_id' => 'nullable|exists:buses,id',
            'route_id' => 'required|exists:routes,id',
            'bus_number' => 'nullable|string',
            'start_time' => 'required|date',
            'end_time' => 'required|date|after:start_time',
            'fare' => 'required|numeric|min:0',
            'available_seats' => 'required|integer|min:0',
            'status' => 'sometimes|in:scheduled,active,completed,cancelled',
        ]);

        $trip = Trip::create($validated);
        return response()->json($trip->load('route'), 201);
    }

    public function update(Request $request, $id)
    {
        $trip = Trip::findOrFail($id);
        
        $validated = $request->validate([
            'bus_id' => 'sometimes|nullable|exists:buses,id',
            'route_id' => 'sometimes|exists:routes,id',
            'bus_number' => 'sometimes|nullable|string',
            'start_time' => 'sometimes|date',
            'end_time' => 'sometimes|date|after:start_time',
            'fare' => 'sometimes|numeric|min:0',
            'available_seats' => 'sometimes|integer|min:0',
            'status' => 'sometimes|in:scheduled,active,completed,cancelled',
        ]);

        $trip->update($validated);
        return response()->json($trip->load('route'));
    }

    public function destroy($id)
    {
        $trip = Trip::findOrFail($id);
        $trip->delete();
        return response()->json(['message' => 'Trip deleted successfully']);
    }
}
