import 'package:everlane_style/profile/profile.dart';
import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Your Profile",
            style: CustomFont().titleText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    maxRadius: 70,
                    backgroundImage:  AssetImage(
                      "asset/images/tessa.jpg",
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 120, left: 60).r,
                      child: Icon(
                        Icons.edit_document,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 1),
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextfield(
                  controller: nameController,
                  name: 'Change Your Firstname',
                  inputType: TextInputType.emailAddress,
                  //textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 5.h),
                CustomTextfield(
                  controller: lastNameController,
                  name: 'Change Second name',
                  inputType: TextInputType.emailAddress,
                  //textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextfield(
                  controller: emailController,
                  name: 'Change your Email',
                  inputType: TextInputType.emailAddress,
                  //textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextfield(
                  controller: userNameController,
                  name: 'Change your Username',
                  inputType: TextInputType.emailAddress,
                  //textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextfield(
                  controller: passController,
                  name: 'Change Password',
                  inputType: TextInputType.emailAddress,
                 // textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextfield(
                  controller: phoneNumberController,
                  name: 'Chane Your Phone Number',
                  inputType: TextInputType.emailAddress,
                  //textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton(
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
                        builder: (context) => const Profile(),
                      ),
                    );
                  },
                  child: Text(
                    "Confirm",
                    style: CustomFont().buttontext,
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
