@extends('layouts.app')
@section('content')
<div class="container"><h2>Vendors</h2><a href="{{ route('vendors.create') }}" class="btn btn-primary mb-2">Add Vendor</a><table class="table"><thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr></thead><tbody><!-- Vendor rows here --></tbody></table></div>@endsection