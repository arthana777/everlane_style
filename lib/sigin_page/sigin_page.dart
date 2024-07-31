import 'package:everlane_style/custom_textfield/custom_textfield.dart';
import 'package:everlane_style/on_board/onboard1.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiginPage extends StatelessWidget {
  SiginPage({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
          body: Padding(
            padding: const EdgeInsets.only(top: 350).r,
            child: Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.all(Radius.circular(25)).r),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfield(
                      controller: emailController,
                      name: 'Enter Your Username',
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextfield(
                      controller: nameController,
                      name: 'Enter Your Password',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Onboard1()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10).r,
                        child: Card(
                          child: Container(
                            height: 45.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFF3BBFC3),
                                borderRadius: BorderRadius.all(
                                        const Radius.circular(10).w)
                                    .r),
                            child: Center(
                                child: Text(
                              "Login",
                              style: CustomFont().buttontext,
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
