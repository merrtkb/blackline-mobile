import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A0A0A),

    textTheme: GoogleFonts.interTextTheme(),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFD4AF37),
      surface: Color(0xFF111111),
    ),
  );
}