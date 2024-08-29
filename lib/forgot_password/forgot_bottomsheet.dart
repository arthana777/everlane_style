import 'package:everlane_style/forgot_password/forgot_pasword_screen.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotBottomsheet {
  static void moreModalBottomSheet(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0).w,
        ),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: size.height * 0.7.h,
              decoration: BoxDecoration(
                color: CustomColor.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(20.0),
                ).w,
              ),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: const [ForgotPaswordScreen()],
              ),
            ),
          );
        });
  }
}
