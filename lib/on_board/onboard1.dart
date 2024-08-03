import 'package:everlane_style/on_board/onboard2.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboard1 extends StatelessWidget {
  final List<String> items = [
    'Male',
    'Female',
  ];
  final List<String> imageUrls = [
    "asset/images/1.jpg",
    "asset/images/2.jpg",
  ];
  Onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "",
          style: CustomFont().titleText,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chose Your Gender",
                style: CustomFont().titleText,
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 200.h,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboard2(),
                      ),
                    );
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 10, right: 10).r,
                        height: 80.h,
                        width: double.infinity.w,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10).w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(
                              items[index],
                              style: CustomFont().titleText,
                            ),
                            CircleAvatar(
                              radius: 35.w,
                              backgroundImage: AssetImage(
                                imageUrls[index],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Health-related insights and personalized\nrecommendations are built based on\nyour gender. ",
                style: CustomFont().subText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
