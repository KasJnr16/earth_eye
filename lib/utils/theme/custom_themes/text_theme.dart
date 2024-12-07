import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UniTextTheme {
  UniTextTheme._();

  static final lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.lato(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: GoogleFonts.lato(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: GoogleFonts.lato(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: GoogleFonts.lato(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.5)),
    labelLarge: GoogleFonts.lato(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: GoogleFonts.lato(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  static final darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.lato(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: GoogleFonts.lato(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: GoogleFonts.lato(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: GoogleFonts.lato(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: GoogleFonts.lato(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: GoogleFonts.lato(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5)),
    labelLarge: GoogleFonts.lato(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: GoogleFonts.lato(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
