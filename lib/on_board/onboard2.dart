import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboard2 extends StatelessWidget {
  const Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 10).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Help us  know you better",
              style: CustomFont().titleText,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Fill your details so that we can provide\nyou with more accurate results  ",
              style: CustomFont().subText,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              height: 90.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Male",
                    style: CustomFont().titleText,
                  ),
                  CircleAvatar(
                    radius: 35.w,
                    backgroundImage: const AssetImage(
                      "asset/images/1.jpg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              height: 90.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Female",
                    style: CustomFont().titleText,
                  ),
                  CircleAvatar(
                    radius: 35.w,
                    backgroundImage: const AssetImage(
                      "asset/images/2.jpg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              height: 90.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Others's",
                    style: CustomFont().titleText,
                  ),
                  CircleAvatar(
                    radius: 35.w,
                    backgroundImage: const AssetImage(
                      "asset/images/3.jpg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              height: 90.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Others's",
                    style: CustomFont().titleText,
                  ),
                  CircleAvatar(
                    radius: 35.w,
                    backgroundImage: const AssetImage(
                      "asset/images/3.jpg",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20).r,
              height: 90.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(1, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Others's",
                    style: CustomFont().titleText,
                  ),
                  CircleAvatar(
                    radius: 35.w,
                    backgroundImage: const AssetImage(
                      "asset/images/3.jpg",
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3BBFC3),
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                  child: Center(
                    child: Text(
                      "Get Strated",
                      style: CustomFont().buttontext,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
