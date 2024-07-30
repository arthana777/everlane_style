import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../productgrid/product_card.dart';
import '../widgets/customfont.dart';
import 'category_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          toolbarHeight: 60.h,
          title: Text("EverlaneStyle", style: CustomFont().appbarText),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 30.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
              child: Text(
                "Categories ",
                style: CustomFont().subtitleText,
              ),
            ),
            SizedBox(
              height: 140.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image:  DecorationImage(
                                  image:
                                      AssetImage("asset/images/womencover.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(height: 15.h, child: Text("categor"))
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),

            ImageSlideshow(
              width: double.infinity,
              height: 500.h,
              initialPage: 0,
              indicatorColor: Colors.black,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Container(
                  width: double.infinity,
                  height: 500.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0, 4))
                    ],
                    image: DecorationImage(
                        image: AssetImage(
                          "asset/images/womencover.jpg",
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage(
                        "asset/images/mencover.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                ),
              ],
              //autoPlayInterval: 3000,
              isLoop: true,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 30),
              child: Text(
                "Trending",
                style: CustomFont().subtitleText,
              ),
            ),

            SizedBox(
              height: 300.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 00),
                  child: ProductCard(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 30),
              child: Text(
                "Title",
                style: CustomFont().subtitleText,
              ),
            ),
            SizedBox(
              height: 500.h,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 4, bottom: 4),
                        child: CategoryBanner(),
                      )),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
            //   child: ProductGrid(),
            // ),
          ]),
        ));
  }
}
