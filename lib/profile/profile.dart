import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/bloc/change_password/bloc/change_password_bloc.dart';
import 'package:everlane_style/bloc/change_password/bloc/change_password_event.dart';
import 'package:everlane_style/bloc/change_password/bloc/change_password_state.dart';
import 'package:everlane_style/btm_navigation/btm_navigation.dart';
import 'package:everlane_style/data/datasources/change_password_repo.dart';
import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:everlane_style/bloc/userprofile/bloc/profile_bloc.dart';
import 'package:everlane_style/bloc/userprofile/bloc/profile_event.dart';
import 'package:everlane_style/bloc/userprofile/bloc/profile_state.dart';
import 'package:everlane_style/data/datasources/profileservice.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/first_page/first_page.dart';
import 'package:everlane_style/profile/edit_profile.dart';
import 'package:everlane_style/data/models/userprofile.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:everlane_style/widgets/profile_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BtmNavigation()),
                );
              },
              icon: const Icon(Icons.arrow_back)),
          text: "Profile",
          color: const Color(0xFFF7F7F7),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProfileBloc(ProfileService())..add(FetchUserProfile()),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoaded) {
                return ProfileDetails(userProfile: state.userProfile);
              } else if (state is ProfileError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(
                  child: Text('Please log in to view your profile.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final Userprofile userProfile;

  final new_PassController = TextEditingController();
  final old_passwordController = TextEditingController();

  ProfileDetails({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: const NetworkImage(
                  'https://i.pinimg.com/474x/8e/0c/fa/8e0cfaf58709f7e626973f0b00d033d0.jpg',
                ),
                backgroundColor: Colors.white,
                maxRadius: 60.r,
              ),
              SizedBox(height: 10.h),
              Text('${userProfile.username}', style: CustomFont().titleText),
              SizedBox(height: 4.h),
              Text('${userProfile.email}', style: GoogleFonts.poppins()),
              SizedBox(height: 4.h),
              Text("${userProfile.mobile}", style: CustomFont().subText),
              SizedBox(height: 10.h),
              ProfileTextfield(
                icon: Icons.favorite,
                title: "Wish List",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditProfile(),
                  //   ),
                  // );
                },
              ),
              SizedBox(height: 5.h),
              ProfileTextfield(
                icon: Icons.shopping_cart,
                title: "My Orders",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditProfile(),
                  //   ),
                  // );
                },
              ),
              SizedBox(height: 5.h),
              ProfileTextfield(
                icon: Icons.settings,
                title: "Settings",
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => EditProfile(),
                  //   ),
                  // );
                },
              ),
              SizedBox(height: 5.h),
              ProfileTextfield(
                icon: Icons.person_2_sharp,
                title: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
              ),
              SizedBox(height: 5.h),
              ProfileTextfield(
                icon: Icons.person_2_sharp,
                title: "Change password",
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: const Color(0xFFEBEBEB),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => ChangePasswordBloc(
                          changePasswordRepo: ChangePasswordRepo(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SizedBox(
                            height: 250.h,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 10, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomTextfield(
                                    controller: old_passwordController,
                                    hintText: 'Old Password',
                                    inputType: TextInputType.name,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextfield(
                                    controller: new_PassController,
                                    hintText: 'New Password',
                                    inputType: TextInputType.name,
                                  ),
                                  SizedBox(height: 10.h),
                                  BlocConsumer<ChangePasswordBloc,
                                      ChangePasswordState>(
                                    listener: (context, state) {
                                      print("State 1000= ${state}");
                                      if (state is ChangePasswordSucces) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                " Change Password Success :- ${state.message}"),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pop(context);
                                        print("State00= ${state}");
                                      } else if (state
                                          is ChangePasswordFailure) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Error:${state.error}"),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    },
                                    builder: (context, state) {
                                      print("State6= ${state}");
                                      if (state is ChangePasswordLoading) {
                                        return const CircularProgressIndicator();
                                      }
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              CustomColor.primaryColor,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10).w,
                                          ),
                                        ),
                                        onPressed: () {
                                          print("State 10= ${state}");
                                          if (new_PassController.text.isEmpty ||
                                              old_passwordController
                                                  .text.isEmpty) {
                                            Fluttertoast.showToast(
                                                backgroundColor: Colors.white,
                                                gravity: ToastGravity.SNACKBAR,
                                                textColor: Colors.red,
                                                msg:
                                                    "Please fill in all fields");
                                          } else {
                                            context
                                                .read<ChangePasswordBloc>()
                                                .add(ChangePasswordSubmitted(
                                                    old_passwordController.text,
                                                    new_PassController.text));
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Confirm",
                                          style: CustomFont().buttontext,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 8.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage()),
                  );
                },
                child: Text("Logout", style: CustomFont().buttontext),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
