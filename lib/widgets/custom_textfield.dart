import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  // final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;

  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.name,
    // required this.prefixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 55.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(1, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            const Radius.circular(10).r,
          ),
        ),
        margin: const EdgeInsets.only(),
        child: TextField(
          enabled: true,
          controller: controller,
          textCapitalization: textCapitalization,
          maxLength: 32,
          maxLines: 1,
          obscureText: obscureText,
          keyboardType: inputType,
          // textAlign: TextAlign.center,
          style: CustomFont().buttontext,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 4).r,
            border: InputBorder.none,
            hintText: name,
            counterText: '',
            hintStyle: GoogleFonts.quicksand(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
