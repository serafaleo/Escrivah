import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(Brightness brightness) {
  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.cyan,
    brightness: brightness,
  );
  final ThemeData baseTheme = ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.primary,
      selectedItemColor: colorScheme.onPrimary,
      unselectedItemColor: colorScheme.onPrimary.withValues(alpha: 0.7),
      type: BottomNavigationBarType.fixed,
    ),
  );
  return baseTheme.copyWith(textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme));
}
