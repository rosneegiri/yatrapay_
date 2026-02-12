<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokhara Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .sidebar { background: #fff; border-right: 1px solid #e0e0e0; min-height: 100vh; }
        .sidebar .nav-link.active, .sidebar .nav-link:focus { background: #e6f9ed; color: #1b8c3b; }
        .sidebar .nav-link { color: #1b8c3b; font-weight: 500; }
        .sidebar .nav-link:hover { background: #e6f9ed; color: #157a2a; }
        .navbar { background: #fff; border-bottom: 1px solid #e0e0e0; }
        .dashboard-card { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px #e0e0e0; }
        .stat-green { color: #1b8c3b; }
        .btn-green { background: #1b8c3b; color: #fff; border: none; }
        .btn-green:hover { background: #157a2a; color: #fff; }
        @media (max-width: 991px) {
            .sidebar { min-height: auto; }
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 sidebar">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/admin" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-decoration-none">
                    <span class="fs-4 fw-bold stat-green">POKHARA ADMIN</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li><a href="/admin" class="nav-link px-0">Dashboard</a></li>
                    <li><a href="/admin/vendors" class="nav-link px-0">Vendor Management</a></li>
                    <li><a href="/admin/users" class="nav-link px-0">User Management</a></li>
                    <li><a href="/admin/settings" class="nav-link px-0">Settings</a></li>
                    <li><a href="/admin/roles" class="nav-link px-0">Roles</a></li>
                    <li><a href="/admin/logs" class="nav-link px-0">System Reports</a></li>
                </ul>
            </div>
        </div>
        <div class="col py-3">
            <nav class="navbar navbar-expand navbar-light mb-4">
                <div class="container-fluid">
                    <form class="d-flex ms-auto">
                        <input class="form-control me-2" type="search" placeholder="Search data..." aria-label="Search">
                    </form>
                    <div class="d-flex align-items-center ms-3">
                        <span class="me-2">Pokhara Admin</span>
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Admin" width="36" height="36" class="rounded-circle">
                    </div>
                </div>
            </nav>
            @yield('content')
        </div>
    </div>
</div>
</body>
</html>
