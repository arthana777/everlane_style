import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPaswordScreen extends StatefulWidget {
  const ForgotPaswordScreen({super.key});

  @override
  State<ForgotPaswordScreen> createState() => _ForgotPaswordScreenState();
}

class _ForgotPaswordScreenState extends State<ForgotPaswordScreen> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                    color: CustomColor.primaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      BoxShadow(
                        color: Colors.white30,
                        offset: Offset(0, 1),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  "Enter your email in it and click the confirm button and the new password will be sent to the email",
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextfield(
                controller: emailController,
                hintText: 'Enter Your Valid Email',
                inputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid email Address";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email Address';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 48),
                  backgroundColor: CustomColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10).w,
                  ),
                ),
                onPressed: () {
                  // BlocProvider.of<LoginnBloc>(context).add(
                  //   LoginButtonEvent(

                  //     email: emailController.text,
                  //   ),
                  // );
                  if (_formKey.currentState!.validate()) {}
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
    );
  }
}
