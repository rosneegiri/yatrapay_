<?php

namespace App\Http\Controllers\Admin\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index() { return view('admin.users.index'); }
    public function create() { return view('admin.users.create'); }
    public function store(Request $request) { /* Store logic */ }
    public function edit($id) { return view('admin.users.edit', compact('id')); }
    public function update(Request $request, $id) { /* Update logic */ }
    public function destroy($id) { /* Delete logic */ }
}
