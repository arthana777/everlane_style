import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Siginup extends StatelessWidget {
  Siginup({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

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
            padding: const EdgeInsets.only(top: 190).r,
            child: Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))
                      .r
                      .r),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10).r,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        controller: nameController,
                        names: "Enter First Name",
                        name: 'Enter First Name',
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextfield(
                        controller: lastNameController,
                        names: "Enter Last Name",
                        name: 'Enter Last Name',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextfield(
                        controller: emailController,
                        names: "Enter Your Email",
                        name: 'Enter Your Email',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextfield(
                        controller: userNameController,
                        names: "Enter Username",
                        name: 'Enter Username',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextfield(
                        controller: passController,
                        names: "Enter Password",
                        name: 'Enter Password',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextfield(
                        controller: phoneNumberController,
                        names: "Enter Your Phone number",
                        name: 'Enter Your Phone number',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SiginPage()),
                          );
                        },
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3BBFC3),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10).w,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SiginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Confirm",
                              style: CustomFont().buttontext,
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
        )
      ],
    );
  }
}
