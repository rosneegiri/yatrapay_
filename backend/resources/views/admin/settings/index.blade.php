@extends('layouts.app')
@section('content')
<div class="container"><h2>Settings</h2><form method="POST" action="{{ route('admin.settings.update') }}">@csrf<!-- Settings fields here --><button type="submit" class="btn btn-success">Save</button></form></div>@endsection