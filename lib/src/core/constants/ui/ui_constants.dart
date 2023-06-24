import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppTheme {
  CustomAppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFF939393);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static TextStyle kText = GoogleFonts.modak(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: 0.5,
    color: darkerText,
  );
  static TextStyle kHeading = GoogleFonts.modak(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    letterSpacing: 0.5,
    color: darkerText,
  );
}
