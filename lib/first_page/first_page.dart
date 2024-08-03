import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/signup_page/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final nameController = TextEditingController();
  final enailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Image.asset(
          "asset/images/login.jpg",
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 500, left: 20, right: 20).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Container(
                    height: 55.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(15).w,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SiginPage()),
                        );
                      },
                      leading: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 50, bottom: 5).r,
                        child: Text(
                          "Sign In Account",
                          style: GoogleFonts.quicksand(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Card(
                  child: Container(
                    height: 55.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3BBFC3),
                      borderRadius: BorderRadius.all(
                        const Radius.circular(10).w,
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Siginup()),
                        );
                      },
                      leading: const Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 5).r,
                        child: Text(
                          "Sign Up Account",
                          style: GoogleFonts.quicksand(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
