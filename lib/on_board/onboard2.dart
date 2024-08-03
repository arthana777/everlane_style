import 'package:everlane_style/btm_navigation/btm_navigation.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboard2 extends StatefulWidget {
  const Onboard2({super.key});

  @override
  State<Onboard2> createState() => _Onboard2State();
}

class _Onboard2State extends State<Onboard2> {
  String dropedownvalue1 = 'Height';
  String dropedownvalue2 = 'Skin Color';
  String dropedownvalue3 = 'Weather(seosons)';
  String dropedownvalue4 = "Casual";

  final List<String> item1 = [
    "Height",
    'Short',
    'Medium',
    'High',
  ];

  final List<String> item2 = [
    "Skin Color",
    "black",
    "brown",
    "purple",
    "white"
  ];
  final List<String> item3 = [
    "Weather(seosons)",
    'Summer',
    'winter',
    'monsoon',
  ];
  final List<String> item4 = [
    "Casual",
    "Party weare",
    "Formal",
    "Spot",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
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
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10).w,
                        value: dropedownvalue1,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item1.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue1 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                      leading: Text("black", style: CustomFont().titleText),
                      trailing: DropdownButton(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10).w,
                        value: dropedownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item2.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue2 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                      leading: Text("Weather", style: CustomFont().titleText),
                      trailing: DropdownButton(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10).w,
                        value: dropedownvalue3,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item3.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue3 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                      leading: Text("Usages", style: CustomFont().titleText),
                      trailing: DropdownButton(
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(10).w,
                        value: dropedownvalue4,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: item4.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropedownvalue4 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: ElevatedButton(
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
                      "Created",
                      style: CustomFont().buttontext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
