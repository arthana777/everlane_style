import 'package:everlane_style/questionnaire/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Qstmodalbottomsheet {
  static void moreModalBottomSheet(context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0).w,
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * 0.7.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ).w,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: const [Questions()],
              ),
            ),
          );
        });
  }
}
