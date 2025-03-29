import 'package:flutter/material.dart';

/// A class that defines the color schemes for the application.

class AppColorTheme {
  AppColorTheme._();

  // Default application colors (light theme)
  static const Color primaryLight = Color(0xFF2196F3); // Blue
  static const Color primaryVariantLight = Color(0xFF1976D2); // Dark Blue
  static const Color secondaryLight = Color(0xFFFF9800); // Orange
  static const Color secondaryVariantLight = Color(0xFFF57C00); // Dark Orange
  static const Color backgroundLight = Color(0xFFF5F5F5); // Almost White
  static const Color surfaceLight = Colors.white;
  static const Color errorLight = Color(0xFFB00020); // Red
  static const Color onPrimaryLight = Colors.white;
  static const Color onSecondaryLight = Colors.black;
  static const Color onBackgroundLight = Color(0xFF212121); // Almost Black
  static const Color onSurfaceLight = Color(0xFF212121); // Almost Black
  static const Color onErrorLight = Colors.white;

  // Default application colors (dark theme)
  static const Color primaryDark = Color(0xFF90CAF9); // Light Blue
  static const Color primaryVariantDark = Color(0xFF64B5F6); // Lighter Blue
  static const Color secondaryDark = Color(0xFFFFB74D); // Light Orange
  static const Color secondaryVariantDark = Color(0xFFFFCC80); // Lighter Orange
  static const Color backgroundDark = Color(0xFF121212); // Dark Grey
  static const Color surfaceDark = Color(0xFF1E1E1E); // Slightly Lighter Dark Grey
  static const Color errorDark = Color(0xFFCF6679); // Light Red
  static const Color onPrimaryDark = Color(0xFF000000); // Black
  static const Color onSecondaryDark = Color(0xFF000000); // Black
  static const Color onBackgroundDark = Colors.white;
  static const Color onSurfaceDark = Colors.white;
  static const Color onErrorDark = Colors.black;

  // Brand accent colors (shared between light and dark themes)
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color info = Color(0xFF2196F3); // Blue
  static const Color warning = Color(0xFFFFC107); // Amber
  static const Color danger = Color(0xFFF44336); // Red

  // Neutral colors
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // Create light theme ColorScheme
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: primaryLight,
        onPrimary: onPrimaryLight,
        primaryContainer: primaryVariantLight,
        onPrimaryContainer: onPrimaryLight,
        secondary: secondaryLight,
        onSecondary: onSecondaryLight,
        secondaryContainer: secondaryVariantLight,
        onSecondaryContainer: onSecondaryLight,
        error: errorLight,
        onError: onErrorLight,
        background: backgroundLight,
        onBackground: onBackgroundLight,
        surface: surfaceLight,
        onSurface: onSurfaceLight,
        surfaceTint: primaryLight,
      );

  // Create dark theme ColorScheme
  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryDark,
        onPrimary: onPrimaryDark,
        primaryContainer: primaryVariantDark,
        onPrimaryContainer: onPrimaryDark,
        secondary: secondaryDark,
        onSecondary: onSecondaryDark,
        secondaryContainer: secondaryVariantDark,
        onSecondaryContainer: onSecondaryDark,
        error: errorDark,
        onError: onErrorDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceTint: primaryDark,
      );

  // Additional color schemes - Blue theme
  static ColorScheme get blueColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF1976D2),
        onPrimary: Colors.white,
        primaryContainer: Color(0xFF2196F3),
        onPrimaryContainer: Colors.white,
        secondary: Color(0xFF26A69A),
        onSecondary: Colors.white,
        secondaryContainer: Color(0xFF80CBC4),
        onSecondaryContainer: Colors.black,
        error: errorLight,
        onError: onErrorLight,
        background: backgroundLight,
        onBackground: onBackgroundLight,
        surface: surfaceLight,
        onSurface: onSurfaceLight,
        surfaceTint: Color(0xFF1976D2),
      );

  // Additional color schemes - Green theme
  static ColorScheme get greenColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF388E3C),
        onPrimary: Colors.white,
        primaryContainer: Color(0xFF4CAF50),
        onPrimaryContainer: Colors.white,
        secondary: Color(0xFF7CB342),
        onSecondary: Colors.white,
        secondaryContainer: Color(0xFFAED581),
        onSecondaryContainer: Colors.black,
        error: errorLight,
        onError: onErrorLight,
        background: backgroundLight,
        onBackground: onBackgroundLight,
        surface: surfaceLight,
        onSurface: onSurfaceLight,
        surfaceTint: Color(0xFF388E3C),
      );

  // Additional color schemes - Purple theme
  static ColorScheme get purpleColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF7B1FA2),
        onPrimary: Colors.white,
        primaryContainer: Color(0xFF9C27B0),
        onPrimaryContainer: Colors.white,
        secondary: Color(0xFF673AB7),
        onSecondary: Colors.white,
        secondaryContainer: Color(0xFFD1C4E9),
        onSecondaryContainer: Colors.black,
        error: errorLight,
        onError: onErrorLight,
        background: backgroundLight,
        onBackground: onBackgroundLight,
        surface: surfaceLight,
        onSurface: onSurfaceLight,
        surfaceTint: Color(0xFF7B1FA2),
      );

  // Dark versions of additional themes
  static ColorScheme get blueDarkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF90CAF9),
        onPrimary: Colors.black,
        primaryContainer: Color(0xFF64B5F6),
        onPrimaryContainer: Colors.black,
        secondary: Color(0xFF80CBC4),
        onSecondary: Colors.black,
        secondaryContainer: Color(0xFF26A69A),
        onSecondaryContainer: Colors.white,
        error: errorDark,
        onError: onErrorDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceTint: Color(0xFF90CAF9),
      );

  // Dark version of green theme
  static ColorScheme get greenDarkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFA5D6A7),
        onPrimary: Colors.black,
        primaryContainer: Color(0xFF81C784),
        onPrimaryContainer: Colors.black,
        secondary: Color(0xFFCCFF90),
        onSecondary: Colors.black,
        secondaryContainer: Color(0xFF8BC34A),
        onSecondaryContainer: Colors.white,
        error: errorDark,
        onError: onErrorDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceTint: Color(0xFFA5D6A7),
      );

  // Dark version of purple theme
  static ColorScheme get purpleDarkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFCE93D8),
        onPrimary: Colors.black,
        primaryContainer: Color(0xFFBA68C8),
        onPrimaryContainer: Colors.black,
        secondary: Color(0xFFB39DDB),
        onSecondary: Colors.black,
        secondaryContainer: Color(0xFF9575CD),
        onSecondaryContainer: Colors.white,
        error: errorDark,
        onError: onErrorDark,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        surfaceTint: Color(0xFFCE93D8),
      );

  // Helper method to create a custom color theme
  static ColorScheme customColorScheme({
    required Color primary,
    required Color secondary,
    Brightness brightness = Brightness.light,
  }) {
    final bool isLight = brightness == Brightness.light;

    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: isLight ? Colors.white : Colors.black,
      primaryContainer: primary.withOpacity(0.8),
      onPrimaryContainer: isLight ? Colors.white : Colors.black,
      secondary: secondary,
      onSecondary: isLight ? Colors.black : Colors.white,
      secondaryContainer: secondary.withOpacity(0.8),
      onSecondaryContainer: isLight ? Colors.black : Colors.white,
      error: isLight ? errorLight : errorDark,
      onError: isLight ? onErrorLight : onErrorDark,
      background: isLight ? backgroundLight : backgroundDark,
      onBackground: isLight ? onBackgroundLight : onBackgroundDark,
      surface: isLight ? surfaceLight : surfaceDark,
      onSurface: isLight ? onSurfaceLight : onSurfaceDark,
      surfaceTint: primary,
    );
  }
}
