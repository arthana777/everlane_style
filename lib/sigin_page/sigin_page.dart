

import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categories/category_bloc.dart';

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
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "asset/images/login.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 70, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextfield(
                            controller: emailController,
                            name: 'Enter Yor Email',
                            inputType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextfield(
                            controller: nameController,
                            name: 'Enter Yor Password',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<CategoryBloc>().add(LoadCategories());
                              //context.read<CategoryBloc>().add(LoadSubCategories());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            child: Card(
                              child: Container(
                                height: 45,
                                width: 130,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF3BBFC3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: CustomFont().buttontext,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
