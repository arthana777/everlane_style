import 'package:everlane_style/categories/category_bloc.dart';
import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/product_detail/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cart/cartscreen.dart';
import 'category_gridview.dart';
import '../productgrid/product_card.dart';
import '../widgets/customfont.dart';
import 'category_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryEntity> categories = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
          toolbarHeight: 70.h,
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
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 30.sp,
                      )),
                ],
              ),
            ),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryLoaded) {
                  categories = state.categories;
                  setState(() {});
                }
              },
            )
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 30.h,
                width: 500.w,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      context.read<CategoryBloc>().add(
                        LoadSubCategories(categories[index].id??0),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                            child: Text(
                              categories[index].name ?? '',
                              style: CustomFont().buttontext,
                            )),
                      ),
                    ),
                  ),
                )
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
                child: Text(
                  "Categories ",
                  style: CustomFont().subtitleText,
                ),
              ),
              SizedBox(
                height: 140.h,
                child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                  if (state is SubCategoryLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.pink,
                      ),
                    );
                  } else if (state is SubCategoryLoaded) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.subcategories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryGridview(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                                  .subcategories[index].image ??
                                              ''),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 15.h,
                                    child: Text(
                                        state.subcategories[index].name ?? "")),
                              ],
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("Unknown state"),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 600.h,
                child: ImageSlideshow(
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
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(),
                            ),
                          );
                        },
                        child: ProductCard()),
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
                height: 950.h,
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
          ),
        ));
  }
}
