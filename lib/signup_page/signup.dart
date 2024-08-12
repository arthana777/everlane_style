import 'package:everlane_style/bloc_signup/bloc/signup_bloc.dart';
import 'package:everlane_style/bloc_signup/bloc/signup_event.dart';
import 'package:everlane_style/bloc_signup/bloc/signup_state.dart';
import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/signup_page/signup_repo/signuprepository.dart';
import 'package:everlane_style/signup_page/user_reg_model/userregistration.dart';
import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final SignupRepository signupRepository = SignupRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(signupRepository),
      child: Siginup(),
    );
  }
}

class Siginup extends StatefulWidget {
  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  final confirmpassController = TextEditingController();

  final lastNameController = TextEditingController();

  final userNameController = TextEditingController();

  final _mobileController = TextEditingController();

  // final _formal = GlobalKey<FromState>();
  bool passwordVisible = false;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

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
            padding: const EdgeInsets.only(top: 100).r,
            child: Container(
              height: double.infinity.h,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 10, right: 10).r,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        controller: nameController,
                        names: "firstName",
                        name: 'Enter First Name',
                        inputType: TextInputType.emailAddress,
                        //textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        controller: lastNameController,
                        names: "lastName",
                        name: 'Enter Last Name',
                        inputType: TextInputType.text,
                        //textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        controller: emailController,
                        names: " email",
                        name: 'Enter Your Email',
                        inputType: TextInputType.text,
                       // textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        controller: userNameController,
                        names: "username",
                        name: 'Enter UserName',
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        controller: _mobileController,
                        names: "mobile",
                        name: 'Enter mobile number',
                        inputType: TextInputType.number,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        Icon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        controller: passController,
                        names: "password",
                        name: 'Enter Password',
                        obscureText: _obscureText,
                        inputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.words,
                      ),
                      Center(
                        child: FlutterPwValidator(
                            key: validatorKey,
                            width: 300,
                            height: 100,
                            minLength: 8,
                            successColor: const Color(0xFF3BBFC3),
                            onSuccess: () {
                              print("Match");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Password is matched"),
                                ),
                              );
                            },
                            uppercaseCharCount: 1,
                            specialCharCount: 1,
                            normalCharCount: 2,
                            controller: passController),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextfield(
                        Icon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        controller: confirmpassController,
                        names: "confirmPassword",
                        name: 'Confirm Password',
                        obscureText: _obscureText,
                        inputType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.words,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BlocConsumer<RegistrationBloc, SignupState>(
                          listener: (context, state) {
                        if (state is RegistrationSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiginPage(),
                              ));
                          print("heyy");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("RegistrationSuccessfull"),
                            ),
                          );
                        } else if (state is RegistrationFailed) {
                          print("heylooo!");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("RegistrationFailed:${state.error}"),
                            ),
                          );
                        }
                      }, builder: (context, state) {
                        if (state is RegistrationLoading) {
                          return const CircularProgressIndicator();
                        }
                        return Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3BBFC3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10).w,
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<RegistrationBloc>(context).add(
                                RegisterUser(
                                  Userregistration(
                                    username: userNameController.text,
                                    confirmPassword: passController.text,
                                    email: emailController.text,
                                    mobile: _mobileController.hashCode,
                                    password: passController.text,
                                    firstName: nameController.text,
                                    lastName: lastNameController.text,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Confirm",
                              style: CustomFont().buttontext,
                            ),
                          ),
                        );
                      }),
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
