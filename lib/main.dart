import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/vendor_provider.dart';
import 'providers/bus_provider.dart';
import 'providers/route_provider.dart';
import 'providers/user_provider.dart';
import 'providers/trip_provider.dart';
import 'providers/payment_provider.dart';
import 'providers/booking_provider.dart';
import 'screens/web/splash/splash_screen.dart' as web;
import 'screens/mobile/splash/splash_screen.dart' as mobile;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => VendorProvider()),
        ChangeNotifierProvider(create: (_) => BusProvider()),
        ChangeNotifierProvider(create: (_) => RouteProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TripProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kIsWeb ? 'YatraPay - Admin & Vendor' : 'YatraPay - User App',
        theme: kIsWeb ? WebTheme.lightTheme : MobileTheme.lightTheme,
        home: kIsWeb ? const web.SplashScreen() : const mobile.SplashScreen(),
      ),
    );
  }
}
