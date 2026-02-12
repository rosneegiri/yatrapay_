@extends('layouts.app')
@section('content')
<div class="container"><h2>Users</h2><a href="{{ route('users.create') }}" class="btn btn-primary mb-2">Add User</a><table class="table"><thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr></thead><tbody><!-- User rows here --></tbody></table></div>@endsection