import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kinetic_kanvas/main.dart';

class CustomFont {
  final TextStyle primaryheader = GoogleFonts.rubik(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  final TextStyle secondaryheader = GoogleFonts.rubik(
    color: darkColor.lightPink,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  CustomFont();
}
