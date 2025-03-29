import 'package:flutter/material.dart';
import 'package:myeg_test/services/theme_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final isDark = themeService.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeService.toggleThemeMode();
            },
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Theme: ${isDark ? 'Dark' : 'Light'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeService.setThemeMode(ThemeMode.system);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('System theme applied')),
                );
              },
              child: const Text('Use System Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                themeService.setThemeMode(ThemeMode.light);
              },
              child: const Text('Use Light Theme'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                themeService.setThemeMode(ThemeMode.dark);
              },
              child: const Text('Use Dark Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
