@extends('layouts.app')
@section('content')
<div class="container"><h2>Roles</h2><a href="{{ route('roles.create') }}" class="btn btn-primary mb-2">Add Role</a><table class="table"><thead><tr><th>ID</th><th>Name</th><th>Actions</th></tr></thead><tbody><!-- Role rows here --></tbody></table></div>@endsection