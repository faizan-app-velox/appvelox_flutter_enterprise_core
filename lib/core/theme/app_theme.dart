import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // CORE PALETTE
  static const Color brandNavy = Color(0xFF0F172A);
  static const Color brandTeal = Color(0xFF14B8A6);
  static const Color errorRed = Color(0xFFEF4444);

  // Light Mode Colors
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Colors.white;
  static const Color lightBorder = Color(0xFFE2E8F0);

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkBorder = Color(0xFF334155);

  // LIGHT THEME CONFIGURATION
  static ThemeData get lightTheme {
    final baseTextTheme = const TextTheme(
      headlineMedium: TextStyle(
        color: brandNavy,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.0,
      ),
      titleLarge: TextStyle(
        color: brandNavy,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: brandNavy,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(color: brandNavy, fontSize: 16),
      bodyMedium: TextStyle(
        color: Color(0xFF64748B), // Slate 500
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF94A3B8), // Slate 400
        fontSize: 12,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,

      colorScheme: const ColorScheme.light(
        primary: brandNavy,
        secondary: brandTeal,
        surface: lightSurface,
        error: errorRed,
        onPrimary: Colors.white,
        onSurface: brandNavy,
        outlineVariant: lightBorder,
      ),

      // Typography
      textTheme: GoogleFonts.interTextTheme(baseTextTheme),

      // Component Themes
      cardTheme: CardThemeData(
        color: lightSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: lightBorder),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: lightBackground,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: brandNavy),
        actionsPadding: EdgeInsets.only(right: 12),
        titleTextStyle: TextStyle(
          color: brandNavy,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // DARK THEME CONFIGURATION
  static ThemeData get darkTheme {
    final baseTextTheme = const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.0,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
      bodySmall: TextStyle(color: Color(0xFF64748B), fontSize: 12),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,

      colorScheme: const ColorScheme.dark(
        primary: brandTeal,
        secondary: brandTeal,
        surface: darkSurface,
        error: errorRed,
        onPrimary: Colors.white,
        onSurface: Colors.white,
        outlineVariant: darkBorder,
      ),

      // Typography
      textTheme: GoogleFonts.interTextTheme(baseTextTheme),

      // Component Themes
      cardTheme: CardThemeData(
        color: darkSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: darkBorder),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actionsPadding: EdgeInsets.only(right: 12),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandTeal,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
