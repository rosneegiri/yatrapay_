<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['web'])->group(function () {
    Route::get('/admin', [\App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('admin.dashboard');

    // User management
    Route::resource('/admin/users', App\Http\Controllers\Admin\Users\UserController::class);

    // Vendor management
    Route::resource('/admin/vendors', App\Http\Controllers\Admin\Vendors\VendorController::class);

    // Settings
    Route::get('/admin/settings', [App\Http\Controllers\Admin\Settings\SettingController::class, 'index'])->name('admin.settings.index');
    Route::post('/admin/settings', [App\Http\Controllers\Admin\Settings\SettingController::class, 'update'])->name('admin.settings.update');

    // Roles & permissions
    Route::resource('/admin/roles', App\Http\Controllers\Admin\Roles\RoleController::class);

    // Activity log
    Route::get('/admin/logs', [App\Http\Controllers\Admin\Logs\LogController::class, 'index'])->name('admin.logs.index');
});
