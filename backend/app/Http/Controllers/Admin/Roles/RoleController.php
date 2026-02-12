<?php

namespace App\Http\Controllers\Admin\Roles;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index() { return view('admin.roles.index'); }
    public function create() { return view('admin.roles.create'); }
    public function store(Request $request) { /* Store logic */ }
    public function edit($id) { return view('admin.roles.edit', compact('id')); }
    public function update(Request $request, $id) { /* Update logic */ }
    public function destroy($id) { /* Delete logic */ }
}
