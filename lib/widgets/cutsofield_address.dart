import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdrressCustomField extends StatelessWidget {
  const AdrressCustomField({super.key,  this.hinttext, this.width});
  final String? hinttext;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50.h,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
      border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child:TextField(
        enabled: true,
        controller: TextEditingController(),
        maxLines: 1,
        keyboardType: TextInputType.text,
        // textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5,),
          border: InputBorder.none,
          hintText: hinttext,
          counterText: '',
          // prefixIcon: Icon(
          //   prefixIcon,
          // ),
          hintStyle:
          GoogleFonts.quicksand(color: Colors.grey, fontSize: 12.sp),
        ),
      ),
    );
  }
}




class CustomAdressSelection extends StatelessWidget {
   CustomAdressSelection({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30.h,
      width: 80.w,
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(text??"")),
    );
  }
}


