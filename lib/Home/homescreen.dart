import 'package:carousel_slider/carousel_slider.dart';
import 'package:everlane_style/Home/seasons/seasongridview.dart';
import 'package:everlane_style/bloc/product/product_bloc.dart';
import 'package:everlane_style/domain/entities/category_entity.dart';
import 'package:everlane_style/domain/entities/product_entity.dart';
import 'package:everlane_style/product_detail/product_details.dart';
import 'package:everlane_style/sharedprefrence/sharedprefs_login.dart';
import 'package:everlane_style/whishlist/whishlist.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/category_bloc.dart';
import '../bloc/whishlist/whishlist_bloc.dart';
import '../bloc/whishlist/whishlist_event.dart';
import '../bloc/whishlist/whishlist_state.dart';
import '../cart/cartscreen.dart';
import '../donation/donationscreen.dart';
import '../widgets/customcolor.dart';
import 'category_gridview.dart';
import '../productgrid/product_card.dart';
import '../widgets/customfont.dart';
import 'seasons/category_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryEntity> categories = [];
  List<CategoryEntity> banners = [];
  List<ProductEntity> products = [];
  List<ProductEntity> seasons = [];
  List<ProductEntity> filtercategories = [];
  List<CategoryEntity> subcategories = [];
  int? isclicked;

  SharedPrefeService sp = SharedPrefeService();

  CustomColor customColor = CustomColor();

  final List<Map<String, String>> seasonbanner = [
    {
      'title': 'winter',
      'image':
          'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2ludGVyJTIwZmFzaGlvbiUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D'
    },
    {
      'title': 'summer',
      'image':
          'https://media.istockphoto.com/id/1493715911/photo/beach-walk-of-young-adult-woman-during-vacation-in-sri-lanka.jpg?s=1024x1024&w=is&k=20&c=CpKczf_6U5N1qcYfy-beRHW2SY_9Bcgr90yKZ8SnlFQ='
    },
    {
      'title': 'rainy',
      'image':
          'https://plus.unsplash.com/premium_photo-1676762448146-de8a34fbfb88?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnklMjBmYXNoaW9uJTIwYmFubmVyfGVufDB8fDB8fHww'
    },
    {
      'title': 'autumn',
      'image':
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXV0dW1uJTIwZmFzaGlvbiUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D'
    },
  ];

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(LoadCategories());
    BlocProvider.of<CategoryBloc>(context).add(LoadBanners(1));
    BlocProvider.of<ProductBloc>(context).add(LoadProducts());
    BlocProvider.of<CategoryBloc>(context).add(LoadSubCategories(1));

    sp.getToken();

    //BlocProvider.of<ProductBloc>(context).add(LoadSeasons(seasonbanner[1]['title']??""));
    // context.read<CategoryBloc>().add(
    //     LoadBanners()
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
        appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
          text: "Everlanestyle",
          action: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                      child: Icon(Icons.search_rounded,size: 30.sp,)),
                  SizedBox(width: 10.w,),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DonationHomeScreen(),
                        ),);
                      },
                      child: Icon(Icons.drag_handle_outlined,size: 25.sp,))
                ],
              ),
            )

          ],
        )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryLoaded) {
                  categories = state.categories;
                  context.read<CategoryBloc>().add(
                        LoadSubCategories(categories[0].id ?? 0),
                      );
                  //context.read<ProductBloc>().add(LoadProducts());
                  // context.read<CategoryBloc>().add(
                  //   LoadBanners(categories[0].id ?? 0),
                  // );
                  tappingfun(0);
                }
                if (state is BannerLoaded) {
                  banners = state.banners;
                  setState(() {});
                }
                if (state is SubCategoryLoaded) {
                  subcategories = state.subcategories;
                  setState(() {});
                }
                if (state is SubCategoryLoading) {}
              },
            ),
            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                print(state);
                if (state is ProductLoaded) {
                  products = state.products;
                  setState(() {});
                } else if (state is SeasonsLoaded) {
                  seasons = state.seasons;
                  setState(() {});
                } else if (state is filtercategoryLoaded) {
                  filtercategories = state.filtercategories;
                  setState(() {});
                }
              },
            ),
            BlocListener<WhishlistBloc, WishlistState>(
                listener: (context, state) {
              print(state);
              if (state is addtoWishlistLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is addtoWishlistSuccess) {
                print("adding to whislisttt");
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Product added to wishlist successfully!')),
                );
              } else if (state is addtoWishlistFailure) {
                // Dismiss loading indicator and show error message
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            }),
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 50.h,
                width: 400.w,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        tappingfun(index);

                        context.read<CategoryBloc>().add(
                          LoadSubCategories(categories[index].id??0),
                        );
                        context.read<CategoryBloc>().add(
                              LoadBanners(categories[index].id ?? 0),
                            );
                      });
                    },
                    child: Container(
                      // height: 40.h,
                      width: 360.w / 2,
                      decoration: BoxDecoration(
                          color: isclicked == index
                              ? Color(0xFF973d93)
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                          child: Text(
                        categories[index].name ?? 'text',
                        style: CustomFont().buttontext,
                      )),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 5.w,
                    );
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
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: subcategories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<ProductBloc>().add(
                                    Loadfiltercategories(
                                        subcategories[index].id ?? 0));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryGridview(),
                                  ),
                                );

                                //context.read<ProductBloc>().add(LoadProducts());
                              },
                              child: Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image: DecorationImage(
                                      image: NetworkImage(subcategories[index]
                                              .image ??
                                          'https://media.istockphoto.com/id/1176789549/photo/handsome-gentleman-downtown.jpg?s=1024x1024&w=is&k=20&c=psf6n8f2mWlkiCxZKh4LHJeEjda-4dv4H734xm8MBiA='),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 15.h,
                                child: Text(
                                  subcategories[index].name ?? "",
                                  style: CustomFont().bodyText,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 30.h,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 600.0.h,
                    aspectRatio: 5.0,
                    viewportFraction: 1,
                    autoPlay: true),
                items: banners.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            image: DecorationImage(
                                image: NetworkImage(i.image ?? ''),
                                fit: BoxFit.cover)),
                      );
                    },
                  );
                }).toList(),
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
                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 20, right: 00),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                productdetails: products[index],
                              ),
                            ),
                          );
                        },
                        child: ProductCard(
                            ontap: () {
                              BlocProvider.of<WhishlistBloc>(context)
                                  .add(AddToWishlist(products[index]?.id ?? 0));
                              print(products[index]?.id ?? 0);
                            },
                            title: products[index].name ?? '',
                            subtitle: products[index].description ?? '',
                            image: products[index].image ??
                                'https://plus.unsplash.com/premium_photo-1706727290668-f6b805ea48da?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
                            price: products[index].price ?? "")),
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
                    itemCount: seasonbanner.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 4, bottom: 4),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Seasongridview(),
                                  ),
                                );
                                context.read<ProductBloc>().add(
                                      LoadSeasons(
                                          seasonbanner[index]['title'] ?? ''),
                                    );
                                // context.read<ProductBloc>().add(LoadProducts());
                              },
                              child: CategoryBanner(
                                title: seasonbanner[index]['title'],
                                image: seasonbanner[index]['image'],
                              )),
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
