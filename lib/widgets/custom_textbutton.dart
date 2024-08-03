import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,

      padding: EdgeInsets.all(15),
      child: Center(child: Text(text??"")),
    );
  }
}
