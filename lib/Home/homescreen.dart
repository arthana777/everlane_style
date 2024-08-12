
import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/product_detail/product_details.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/category_bloc.dart';
import '../cart/cartscreen.dart';
import '../widgets/customcolor.dart';
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
  int? isclicked;


  CustomColor customColor=CustomColor();

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(LoadCategories());
   // BlocProvider.of<CategoryBloc>(context).add(LoadSubCategories(1));
    super.initState();
  }
  void tappingfun(int index) {
    isclicked = index;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
        child: CustomAppBar(
          text: "EverlaneStyle",
          action: [
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
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    },

                    child: Icon(
                      Icons.shopping_cart,
                      size: 30.sp,
                    )),
              ],
            ),
          ),
        ],)),
        body: MultiBlocListener(
          listeners: [
            BlocListener<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryLoaded) {
                  categories = state.categories;
                  context.read<CategoryBloc>().add(
                    LoadSubCategories(categories[0].id??0),

                  );
                  tappingfun(0);
                  setState(() {});
                }
                else {
                   Center(
                    child: Text("Unknown state"),
                  );
                }
              },
            )
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 50.h,
                width: 400.w,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        tappingfun(index);
                        setState(() {

                        });

                      });
                     context.read<CategoryBloc>().add(
                       LoadSubCategories(categories[index].id??0),
                      );
                    },
                    child: Container(
                      width: 360.w/2,
                      decoration: BoxDecoration(
                          color: isclicked == index ? Color(0xFF3BBFC3) : Colors.black12,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                          child: Text(
                           categories[index].name ?? 'text',
                            style: CustomFont().buttontext,
                          )),
                    ),
                  ), separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 5.w,);
                },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
                child: Text(
                  "Categories ",
                  style: CustomFont().subtitleText,
                ),
              ),
              SizedBox(
                height: 110.h,
                child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                  if (state is SubCategoryLoading) {
                    return Center(
                      child: SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          itemCount: 4,
                            itemBuilder: (context,index)=>
                                Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor: Colors.grey.shade100,
                                    child:Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 80.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                )
                        )

                      )
                    );
                  } else if (state is SubCategoryLoaded) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 18),
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
                                    height: 80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                                  .subcategories[index].image ??
                                              'https://media.istockphoto.com/id/1176789549/photo/handsome-gentleman-downtown.jpg?s=1024x1024&w=is&k=20&c=psf6n8f2mWlkiCxZKh4LHJeEjda-4dv4H734xm8MBiA='),                                       fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: 15.h,
                                    child: Text(
                                        state.subcategories[index].name ?? "",style: CustomFont().bodyText,)),
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
                height: 30.h,
              ),

              SizedBox(
                height: 450.h,
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 400.h,
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
                      height: 400.h,
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
                  autoPlayInterval: 3000,
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
                width: 380.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 10, ),
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
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
