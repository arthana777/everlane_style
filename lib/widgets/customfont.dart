import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomFont {
  CustomFont();
  final TextStyle appbarText = GoogleFonts.questrial(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600));
  final TextStyle bodyText = GoogleFonts.poppins(
      textStyle: TextStyle(color: Colors.black, fontSize: 15.sp));
  final TextStyle subtitleText = GoogleFonts.questrial(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  ));
  final TextStyle buttontext = GoogleFonts.quicksand(
      textStyle: TextStyle(color: Colors.white, fontSize: 20.sp));
  final TextStyle hintText =
      GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white));
  final TextStyle titleText = GoogleFonts.questrial(
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25.sp));
  final TextStyle subText = GoogleFonts.questrial(
      textStyle: const TextStyle(color: Colors.black, fontSize: 18));
}

class CustomColor {
  CustomColor();
  static final Color iconColor = Colors.black;
  static final Color buttonColor = Colors.black;
}

class CustomSize {
  CustomSize();
  static double iconSize = 20.0.sp;
}
