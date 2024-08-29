import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/signup_page/signup.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
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
      Positioned.fill(
        child: Image.network(
          "https://images.unsplash.com/photo-1532453288672-3a27e9be9efd?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  "You Want\nAuthentic,here\nyou go!",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500),
                ),
                 SizedBox(
                  height: 350.h,
                ),
                Card(
                  child: Container(
                    height: 55.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(8).w,
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
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 50, bottom: 5).r,
                        child: Text(
                          "Sign In Account",
                          style: CustomFont().hintText,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Card(
                  child: Container(
                    height: 55.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(8).w,
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
                          style: CustomFont().labelText,
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
