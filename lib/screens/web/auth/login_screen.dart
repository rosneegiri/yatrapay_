import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/core/app_role.dart';
import '../../../providers/auth_provider.dart';
import '../../web/admin/admin_dashboard.dart';
import '../../web/vendor/vendor_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  AppRole _selectedRole = AppRole.vendor;
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
      final success = await authProvider.loginWeb(
        _emailController.text,
        _passwordController.text,
      );

      if (success && mounted) {
        // Navigate to appropriate dashboard
        Widget dashboard = _selectedRole == AppRole.admin
            ? const AdminDashboard()
            : const VendorDashboard();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => dashboard),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 800;

    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Row(
            children: [
              // Left Panel - Marketing/Branding
              if (!isSmallScreen)
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1976D2),
                          Color(0xFF1565C0),
                          Color(0xFF0D47A1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.directions_bus,
                            size: 80,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'YatraPay',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Bus Payment Management System',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 60),
                          _buildFeature(Icons.speed, 'Fast & Efficient'),
                          const SizedBox(height: 24),
                          _buildFeature(Icons.security, 'Secure Payments'),
                          const SizedBox(height: 24),
                          _buildFeature(Icons.analytics, 'Real-time Analytics'),
                        ],
                      ),
                    ),
                  ),
                ),

              // Right Panel - Login Form
              Expanded(
                flex: isSmallScreen ? 1 : 4,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(isSmallScreen ? 24.0 : 48.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Welcome Back',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1976D2),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Admin & Vendor Portal',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 40),

                              // Role Selection Tabs
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildRoleTab(AppRole.vendor, 'Vendor'),
                                    ),
                                    Expanded(
                                      child: _buildRoleTab(AppRole.admin, 'Admin'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Email Field
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),

                              // Password Field
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Remember Me
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text('Remember me'),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Login Button
                              ElevatedButton(
                                onPressed: authProvider.isLoading ? null : _handleLogin,
                                child: authProvider.isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Text('Login'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRoleTab(AppRole role, String label) {
    final isSelected = _selectedRole == role;
    return GestureDetector(
      onTap: () => setState(() => _selectedRole = role),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1976D2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0x33FFFFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
