import 'package:everlane_style/product_detail/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/product/product_bloc.dart';
import '../data/models/product_model.dart';
import '../domain/entities/product_entity.dart';
import '../productgrid/product_card.dart';

class CategoryGridview extends StatefulWidget {
  CategoryGridview({super.key});

  @override
  State<CategoryGridview> createState() => _CategoryGridviewState();
}

class _CategoryGridviewState extends State<CategoryGridview> {
  List<ProductEntity> filtercategories = [];
  @override
  void initState() {
   // BlocProvider.of<ProductBloc>(context).add((Loadfiltercategories(1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: MultiBlocListener(
          listeners: [

            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                print(state);
                // if (state is ProductLoaded) {
                //   products = state.products;
                //   print("FFFF${state.products.length}");
                //   setState(() {});
                // }
                 if (state is filtercategoryLoaded) {
                  filtercategories = state.filtercategories;
                  setState(() {

                  });

                  print("ssss${filtercategories.length}");
                  for (var i = 0; i < filtercategories.length; i++) {
                    print("GGGGG${filtercategories[i].id}");
                  }
                }
                else {
                  Center(
                    child: Text("Unknown state"),
                  );
                }
              },
            ),
          ],
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                ),
                itemCount: filtercategories.length,
                itemBuilder: (BuildContext context, index) {
                  print("object${filtercategories[index].name}");
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(productdetails: filtercategories[index],)),
                        );
                        context.read<ProductBloc>().add(
                          LoadDetails(filtercategories[0].id??0),
                        );
                      },
                      child: ProductCard(
                        title: filtercategories[index].name??"no name",
                        subtitle: filtercategories[index].brand,
                        image: filtercategories[index].image??"",
                        price: filtercategories[index].price??'',
                      ));
                }),
          ),
        ));
  }
}
