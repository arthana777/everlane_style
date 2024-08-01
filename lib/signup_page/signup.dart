import 'package:everlane_style/widgets/custom_textfield.dart';
import 'package:everlane_style/sigin_page/sigin_page.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';

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
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
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
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextfield(
                        controller: nameController,
                        name: 'Enter Yor Phone Number',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextfield(
                        controller: nameController,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SiginPage()),
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
                              "Create",
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
          ),
        ),
      ],
    );
  }
}
