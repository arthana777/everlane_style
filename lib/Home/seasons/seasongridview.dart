import 'package:everlane_style/product_detail/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/product/product_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../productgrid/product_card.dart';


class Seasongridview extends StatefulWidget {
  Seasongridview({super.key});

  @override
  State<Seasongridview> createState() => _SeasongridviewState();
}

class _SeasongridviewState extends State<Seasongridview> {
  List<ProductEntity> seasons = [];

  @override
  void initState() {
    // BlocProvider.of<ProductBloc>(context).add((Loadfiltercategories(1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Choose Your Outfit"),
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: MultiBlocListener(
          listeners: [

            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                print(state);
                if (state is SeasonsLoaded) {
                  seasons = state.seasons;
                  setState(() {

                  });
                  print("ssss${seasons.length}");
                  for (var i = 0; i < seasons.length; i++) {
                    print("GGGGG${seasons[i].id}");
                  }
                }
                // if (state is ProductLoaded) {
                //   products = state.products;
                //   print("kkkkk${products.length}");
                //   for (var i = 0; i < products.length; i++) {
                //     print("GGGGG${products[i].id}");
                //   }
                // }
                else {
                  Center(
                    child: Text("Unknown state"),
                  );
                }
              },
            ),
          ],
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                ),
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, index) {
                  print("object${seasons[index].name}");
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(productdetails: seasons[index],)),
                        );
                      },
                      child: ProductCard(
                        title: seasons[index].name??"no name",
                        subtitle: seasons[index].brand,
                        image: seasons[index].image??"",
                        price: seasons[index].price??'',
                      ));
                }),
          ),
        ));
  }
}
