import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String name;

  final String names;
  final GestureDetector? Icon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;

  CustomTextfield({
    Key? key,
    this.Icon,
    required this.controller,
    required this.name,
    required this.names,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    required this.inputType,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
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
        child: TextFormField(
          enabled: true,
          controller: widget.controller,
          textCapitalization: widget.textCapitalization,
          maxLength: 32,
          maxLines: 1,
          obscureText: widget.obscureText,
          keyboardType: widget.inputType,

          // textAlign: TextAlign.center,
          style: TextStyle(
              color: widget.obscureText ? Colors.black : Colors.black),

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 4).r,
            border: InputBorder.none,
            labelText: widget.names,
            labelStyle: CustomFont().hintText,
            fillColor: Colors.red,
            hintText: widget.name,
            suffixIcon: widget.Icon,
            counterText: '',
            hintStyle: CustomFont().hintText,
          ),
        ),
      ),
    );
  }
}
