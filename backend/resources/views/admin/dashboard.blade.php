@extends('layouts.admin')
@section('content')
<div class="container-fluid">
    <h2 class="mb-4">Admin Overview</h2>
    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="dashboard-card p-3 text-center">
                <div class="stat-green fs-5">Total Revenue</div>
                <div class="fw-bold fs-3">₨128,430.50</div>
                <div class="text-success small">+12.5%</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="dashboard-card p-3 text-center">
                <div class="stat-green fs-5">Total Trips</div>
                <div class="fw-bold fs-3">1,240</div>
                <div class="text-success small">+8.2%</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="dashboard-card p-3 text-center">
                <div class="stat-green fs-5">Active Vendors</div>
                <div class="fw-bold fs-3">48</div>
                <div class="text-secondary small">Stable</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="dashboard-card p-3 text-center">
                <div class="stat-green fs-5">Total Users</div>
                <div class="fw-bold fs-3">12,892</div>
                <div class="text-success small">+24%</div>
            </div>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-lg-8">
            <div class="dashboard-card p-3 mb-3">
                <h5>Recent Trips</h5>
                <table class="table table-sm align-middle mb-0">
                    <thead class="table-light">
                        <tr><th>TRIP ID</th><th>USER</th><th>BUS ID</th><th>ROUTE</th><th>STATUS</th><th>FARE</th></tr>
                    </thead>
                    <tbody>
                        <tr><td>TRIP-882</td><td>John Doe</td><td>BUS-42-A</td><td>Central Hub → Airport</td><td><span class="badge bg-success">COMPLETED</span></td><td>₨12.50</td></tr>
                        <tr><td>TRIP-881</td><td>Sarah Miller</td><td>BUS-19-B</td><td>West Side → Downtown</td><td><span class="badge bg-info">ONGOING</span></td><td>₨8.00</td></tr>
                        <tr><td>TRIP-889</td><td>Mike Knight</td><td>BUS-05-C</td><td>University → East Mall</td><td><span class="badge bg-success">COMPLETED</span></td><td>₨15.75</td></tr>
                        <tr><td>TRIP-879</td><td>Linda Chen</td><td>BUS-12-D</td><td>North Harbor → Station</td><td><span class="badge bg-danger">CANCELLED</span></td><td>₨0.00</td></tr>
                        <tr><td>TRIP-878</td><td>Robert Tims</td><td>BUS-33-A</td><td>Central Hub → Airport</td><td><span class="badge bg-success">COMPLETED</span></td><td>₨12.50</td></tr>
                    </tbody>
                </table>
            </div>
            <div class="dashboard-card p-3">
                <h5>Route Efficiency</h5>
                <div class="mb-2">Route A-102 (Airport Express) <span class="float-end">94%</span></div>
                <div class="progress mb-3" style="height: 8px;"><div class="progress-bar bg-success" style="width: 94%"></div></div>
                <div class="mb-2">Route B-205 (Downtown Loop) <span class="float-end">78%</span></div>
                <div class="progress mb-3" style="height: 8px;"><div class="progress-bar bg-success" style="width: 78%"></div></div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="dashboard-card p-3 mb-3">
                <h5>Quick Actions</h5>
                <a href="#" class="btn btn-green w-100 mb-2">New Route</a>
                <a href="#" class="btn btn-green w-100">Add Vendor</a>
            </div>
            <div class="dashboard-card p-3">
                <h5>System Status</h5>
                <div class="text-success">● All services operational</div>
            </div>
        </div>
    </div>
</div>
@endsection
