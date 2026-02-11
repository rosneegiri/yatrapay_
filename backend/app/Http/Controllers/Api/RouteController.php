<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Route;
use Illuminate\Http\Request;

class RouteController extends Controller
{
    public function index()
    {
        $routes = Route::where('status', 'active')->get();
        return response()->json($routes);
    }

    public function show($id)
    {
        $route = Route::findOrFail($id);
        return response()->json($route);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'route_name' => 'required|string|max:255',
            'start_location' => 'required|string|max:255',
            'end_location' => 'required|string|max:255',
            'distance' => 'required|numeric|min:0',
            'fare' => 'required|numeric|min:0',
            'status' => 'sometimes|in:active,inactive',
        ]);

        $route = Route::create($validated);
        return response()->json($route, 201);
    }

    public function update(Request $request, $id)
    {
        $route = Route::findOrFail($id);
        
        $validated = $request->validate([
            'route_name' => 'sometimes|string|max:255',
            'start_location' => 'sometimes|string|max:255',
            'end_location' => 'sometimes|string|max:255',
            'distance' => 'sometimes|numeric|min:0',
            'fare' => 'sometimes|numeric|min:0',
            'status' => 'sometimes|in:active,inactive',
        ]);

        $route->update($validated);
        return response()->json($route);
    }

    public function destroy($id)
    {
        $route = Route::findOrFail($id);
        $route->delete();
        return response()->json(['message' => 'Route deleted successfully']);
    }
}
