/// Application user roles
enum AppRole {
  admin,
  vendor,
}

extension AppRoleExtension on AppRole {
  String get name {
    switch (this) {
      case AppRole.admin:
        return 'Admin';
      case AppRole.vendor:
        return 'Vendor';
    }
  }
}
