import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/btm_navigation/btm_navigation.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard2 extends StatefulWidget {
  Onboard2({super.key});

  @override
  State<Onboard2> createState() => _Onboard2State();
}

class _Onboard2State extends State<Onboard2> {
  String dropedownvalue = 'Height';
  var item1 = [
    "Height",
    'Short',
    'Medium',
    'High',
  ];
  String dropedownvalue2 = 'skin';
  var item2 = ["black", "brown", "", "purple", "Usages"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Help us  know you better",
                  style: CustomFont().titleText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Fill your details so that we can provide\nyou with more accurate results  ",
                  style: CustomFont().subText,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 80.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 1.0,
                      ),
                    ],
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(10).w,
                    ),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Text("Height", style: CustomFont().titleText),
                      trailing: DropdownButton(
                        value: dropedownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10.h),
                // Container(
                //   height: 80.h,
                //   width: double.infinity.w,
                //   decoration: BoxDecoration(
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.black26,
                //         offset: Offset(0, 1),
                //         blurRadius: 1.0,
                //       ),
                //     ],
                //     color: const Color(0xFFFFFFFF),
                //     borderRadius: BorderRadius.all(
                //       const Radius.circular(10).w,
                //     ),
                //   ),
                //   child: Center(
                //     child: ListTile(
                //       leading: Text("Skin", style: CustomFont().titleText),
                //       trailing: DropdownButton(
                //         value: dropedownvalue2,
                //         icon: const Icon(Icons.keyboard_arrow_down),
                //         items: item2.map((String items) {
                //           return DropdownMenuItem(
                //             value: items,
                //             child: Text(items),
                //           );
                //         }).toList(),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             dropedownvalue = newValue!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.h),
                // Container(
                //   height: 80.h,
                //   width: double.infinity.w,
                //   decoration: BoxDecoration(
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.black26,
                //         offset: Offset(0, 1),
                //         blurRadius: 1.0,
                //       ),
                //     ],
                //     color: const Color(0xFFFFFFFF),
                //     borderRadius: BorderRadius.all(
                //       const Radius.circular(10).w,
                //     ),
                //   ),
                //   child: Center(
                //     child: ListTile(
                //       leading: Text("Height", style: CustomFont().titleText),
                //       trailing: DropdownButton(
                //         // Initial Value
                //         value: dropedownvalue,

                //         // Down Arrow Icon
                //         icon: const Icon(Icons.keyboard_arrow_down),

                //         // Array list of items
                //         items: item1.map((String items) {
                //           return DropdownMenuItem(
                //             value: items,
                //             child: Text(items),
                //           );
                //         }).toList(),
                //         // After selecting the desired option,it will
                //         // change button value to selected value
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             dropedownvalue = newValue!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.h),
                // Container(
                //   height: 80.h,
                //   width: double.infinity.w,
                //   decoration: BoxDecoration(
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.black26,
                //         offset: Offset(0, 1),
                //         blurRadius: 1.0,
                //       ),
                //     ],
                //     color: const Color(0xFFFFFFFF),
                //     borderRadius: BorderRadius.all(
                //       const Radius.circular(10).w,
                //     ),
                //   ),
                //   child: Center(
                //     child: ListTile(
                //       leading: Text("Height", style: CustomFont().titleText),
                //       trailing: DropdownButton(
                //         // Initial Value
                //         value: dropedownvalue,

                //         // Down Arrow Icon
                //         icon: const Icon(Icons.keyboard_arrow_down),

                //         // Array list of items
                //         items: item1.map((String items) {
                //           return DropdownMenuItem(
                //             value: items,
                //             child: Text(items),
                //           );
                //         }).toList(),
                //         // After selecting the desired option,it will
                //         // change button value to selected value
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             dropedownvalue = newValue!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3BBFC3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).w,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BtmNavigation(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: CustomFont().buttontext,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
