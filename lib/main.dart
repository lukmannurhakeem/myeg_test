import 'package:flutter/material.dart';
import 'package:myeg_test/provider/product_provider.dart';
import 'package:myeg_test/routes/route.dart';
import 'package:myeg_test/services/navigation_service.dart';
import 'package:myeg_test/services/service_locator.dart';
import 'package:myeg_test/services/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  ServiceLocator().setupRepositories();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final navigationService = NavigationService();

    return MaterialApp(
      title: 'Flutter App',
      // Set the theme mode from our theme service
      themeMode: themeService.themeMode,
      theme: themeService.lightTheme,
      darkTheme: themeService.darkTheme,

      // Set up navigation
      navigatorKey: navigationService.navigatorKey,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,

      // Optional: Track route changes
      navigatorObservers: [
        RouteObserver(),
      ],
    );
  }
}
