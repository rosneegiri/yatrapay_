<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(\Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\User;

// Create test user
$user = User::create([
    'name' => 'Test User',
    'email' => 'user@test.com',
    'password' => bcrypt('password123'),
    'role' => 'user',
]);

echo "✅ Test user created successfully!\n";
echo "Email: user@test.com\n";
echo "Password: password123\n";
