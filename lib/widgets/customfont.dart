import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomFont{
  CustomFont();
  final TextStyle appbarText = GoogleFonts.questrial(textStyle:TextStyle(color: Colors.black,fontSize: 25,
  fontWeight: FontWeight.w600));
   final TextStyle bodyText = GoogleFonts.poppins(textStyle:TextStyle(color: Colors.black,fontSize: 15));
   final TextStyle subtitleText = GoogleFonts.questrial(textStyle:TextStyle(color: Colors.black,fontSize: 20,
     fontWeight: FontWeight.w400,
   ));
  final TextStyle buttontext = GoogleFonts.poppins(textStyle:TextStyle(color: Colors.white));
final TextStyle hintText = GoogleFonts.poppins(textStyle:TextStyle(color: Colors.white));


}

class CustomColor{
  CustomColor();
  static final Color iconColor=Colors.black;
  static final Color buttonColor=Colors.black;

}


class CustomSize{
  CustomSize();
  static const double iconSize = 20.0;


}

