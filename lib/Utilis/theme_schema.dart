import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeSchema {
  static TextStyle quickSandFont(
      {required double fontSize,
      FontWeight fontWeight = FontWeight.w700,
      Color color = const Color(0xff505050)}) {
    return GoogleFonts.quicksand(
        fontSize: fontSize, fontWeight: fontWeight, height: 1.25, color: color);
  }

  static TextStyle jostFont(
      {required double fontSize,
      FontWeight fontWeight = FontWeight.w700,
      Color color = const Color(0xff505050)}) {
    return GoogleFonts.jost(
        fontSize: fontSize, fontWeight: fontWeight, height: 1.25, color: color);
  }
}
