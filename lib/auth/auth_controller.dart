import '../core/app_role.dart';

class AuthController {
  static bool isLoggedIn = false;
  static AppRole? role;

static void login(AppRole selectedRole) {
    isLoggedIn = true;
    role = selectedRole;
}

  static void logout() {
    isLoggedIn = false;
    role = null;
  }
}
