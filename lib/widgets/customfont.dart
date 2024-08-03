import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomFont {
  CustomFont();
  final TextStyle appbarText = GoogleFonts.questrial(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w600));
  final TextStyle bodyText = GoogleFonts.questrial(
      textStyle: TextStyle(color: Colors.black, fontSize: 16.sp));
  final TextStyle subtitleText = GoogleFonts.questrial(
      textStyle: TextStyle(
    color: Colors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  ));
  final TextStyle buttontext = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500));
  final TextStyle appBarText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 25.sp));
  final TextStyle hintText =
      GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white));
  final TextStyle titleText = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20.sp));
  final TextStyle subText = GoogleFonts.questrial(
      textStyle: const TextStyle(color: Colors.black, fontSize: 15));
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
