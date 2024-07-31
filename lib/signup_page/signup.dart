import 'package:everlane_style/custom_textfield/custom_textfield.dart';
import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final nameController = TextEditingController();
  final enailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "asset/images/login.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 250).r,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(60).w,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 100).r,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        controller: nameController,
                        name: 'Enter Yor Name',
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextfield(
                        controller: nameController,
                        name: 'Enter Yor Phone Number',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextfield(
                        controller: nameController,
                        name: 'Enter Username',
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextfield(
                        controller: nameController,
                        name: 'Enter Yor Password',
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
                                builder: (context) => SiginPage()),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                  child: Text(
                                "Create",
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
          ),
        ),
      ],
    );
  }
}
