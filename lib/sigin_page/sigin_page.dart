import 'package:everlane_style/bloc/loginn/loginn_bloc.dart';
import 'package:everlane_style/on_board/onboard2.dart';
import 'package:everlane_style/signup_page/signup.dart';
import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SiginPage extends StatefulWidget {
  SiginPage({super.key});

  @override
  State<SiginPage> createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color colorWithOpacity;
    return Stack(
      children: [
        SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Image.asset(
            "asset/images/bg0.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocListener<LoginnBloc, LoginnState>(
            listener: (context, state) {
              if (state is LoginnFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login failed, please try again."),
                  ),
                );
              } else if (state is LoginnSuccess) {
                //sp.saveToken(state.token);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login Successful!'),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboard2()),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 250).r,
              child: Container(
                height: double.infinity.h,
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: colorWithOpacity =
                      const Color(0xFFF7F7F7).withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 70, left: 10, right: 10).r,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextfield(
                          names: 'Enter your Username',
                          controller: _usernameController,
                          name: 'Enter Your Username',
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextfield(
                          names: 'Enter Your Password',
                          controller: _passwordController,
                          name: 'Enter Your Password',
                          inputType: TextInputType.text,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Siginup()),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Onboard2()),
                            );
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(350, 48),
                                  backgroundColor: CustomColor.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10).w,
                                  ),
                                ),
                                onPressed: () {
                                  BlocProvider.of<LoginnBloc>(context).add(
                                    LoginButtonEvent(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: CustomFont().buttontext,
                                ),
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
        ),
      ],
    );
  }
}
