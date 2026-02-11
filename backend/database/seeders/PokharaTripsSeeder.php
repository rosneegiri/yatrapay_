<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Route;
use App\Models\Trip;
use Carbon\Carbon;

class PokharaTripsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create routes to Pokhara from different cities
        $routes = [
            [
                'route_name' => 'Kathmandu - Pokhara',
                'start_location' => 'Kathmandu',
                'end_location' => 'Pokhara',
                'distance' => 200.00,
                'fare' => 30.00,
                'status' => 'active',
            ],
            [
                'route_name' => 'Butwal - Pokhara',
                'start_location' => 'Butwal',
                'end_location' => 'Pokhara',
                'distance' => 120.00,
                'fare' => 30.00,
                'status' => 'active',
            ],
            [
                'route_name' => 'Chitwan - Pokhara',
                'start_location' => 'Chitwan',
                'end_location' => 'Pokhara',
                'distance' => 145.00,
                'fare' => 30.00,
                'status' => 'active',
            ],
            [
                'route_name' => 'Pokhara - Kathmandu',
                'start_location' => 'Pokhara',
                'end_location' => 'Kathmandu',
                'distance' => 200.00,
                'fare' => 30.00,
                'status' => 'active',
            ],
        ];

        $createdRoutes = [];
        foreach ($routes as $routeData) {
            $createdRoutes[] = Route::create($routeData);
        }

        // Create trips for the next 7 days
        $busNumbers = ['BA 1 KHA 1234', 'BA 2 GA 5678', 'BA 3 KHA 9012', 'BA 1 PA 3456'];
        
        foreach ($createdRoutes as $route) {
            // Create multiple trips per day for the next 7 days
            for ($day = 0; $day < 7; $day++) {
                $tripDate = Carbon::now()->addDays($day);
                
                // Morning trip (6:00 AM)
                Trip::create([
                    'route_id' => $route->id,
                    'bus_number' => $busNumbers[array_rand($busNumbers)],
                    'start_time' => $tripDate->copy()->setTime(6, 0, 0),
                    'end_time' => $tripDate->copy()->setTime(12, 0, 0),
                    'fare' => $route->fare,
                    'available_seats' => 45,
                    'status' => 'scheduled',
                ]);

                // Mid-day trip (11:00 AM)
                Trip::create([
                    'route_id' => $route->id,
                    'bus_number' => $busNumbers[array_rand($busNumbers)],
                    'start_time' => $tripDate->copy()->setTime(11, 0, 0),
                    'end_time' => $tripDate->copy()->setTime(17, 0, 0),
                    'fare' => $route->fare,
                    'available_seats' => 45,
                    'status' => 'scheduled',
                ]);

                // Evening trip (4:00 PM)
                Trip::create([
                    'route_id' => $route->id,
                    'bus_number' => $busNumbers[array_rand($busNumbers)],
                    'start_time' => $tripDate->copy()->setTime(16, 0, 0),
                    'end_time' => $tripDate->copy()->setTime(22, 0, 0),
                    'fare' => $route->fare,
                    'available_seats' => 45,
                    'status' => 'scheduled',
                ]);
            }
        }

        $this->command->info('Pokhara routes and trips have been seeded successfully!');
    }
}
