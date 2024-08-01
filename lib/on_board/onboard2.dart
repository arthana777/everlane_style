import 'package:everlane_style/btm_navigation/btm_navigation.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboard2 extends StatelessWidget {
  final List<String> items = ['Height', 'skin color', "Weather", "Usages"];

  Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 470.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5).r,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10).r,
                        height: 100.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10).w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index],
                              style: CustomFont().titleText,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                        builder: (context) =>  BtmNavigation(),
                      ),
                    );
                  },
                  child: Text(
                    "Confirm",
                    style: CustomFont().buttontext,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
