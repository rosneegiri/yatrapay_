<?php

namespace App\Http\Controllers\Admin\Vendors;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class VendorController extends Controller
{
    public function index() { return view('admin.vendors.index'); }
    public function create() { return view('admin.vendors.create'); }
    public function store(Request $request) { /* Store logic */ }
    public function edit($id) { return view('admin.vendors.edit', compact('id')); }
    public function update(Request $request, $id) { /* Update logic */ }
    public function destroy($id) { /* Delete logic */ }
}
