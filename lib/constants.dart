import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color colorMellowApricot = Color(0xFFFFBF74);
const Color colorYankeesBlueDark = Color(0xFF1E213E);
const Color colorYankeesBlue = Color.fromARGB(255, 40, 46, 74);

final TextStyle poppins = GoogleFonts.poppins();

extension Ex on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
}

extension ExPad on Widget {
  Widget get padded => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: this,
      );
}