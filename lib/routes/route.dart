import 'package:flutter/material.dart';
import 'package:myeg_test/screens/home_screen.dart';
import 'package:myeg_test/screens/splash_screen.dart';

/// A class that centralizes application routes and provides route generation.
class AppRoutes {
  // Route names as constants
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String details = '/details';

  // Route generator function
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      default:
        // If the route is not defined, show an error page
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Route not found'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
