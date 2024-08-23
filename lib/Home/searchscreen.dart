import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/product/product_bloc.dart';
import '../data/models/product_model.dart';
import '../data/models/whishlistmodel.dart';
import '../product_detail/product_details.dart';
import '../productgrid/product_card.dart';
import '../widgets/cutsofield_address.dart';

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});
  final TextEditingController searchController = TextEditingController();
  //List<Product> products = [];
  List<Product> keyword = [];

  List<WhislistProduct> whishlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          children: [
            AdrressCustomField(
              hinttext: 'Search here',
              controller: searchController,
              onchanged: (value) {
                if (value.isNotEmpty) {
                  context.read<ProductBloc>().add(Searchproducts(value));

                }

              },
            ),
           // SizedBox(height: 5.h),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                // if (state is SearchLoading) {
                //   return Center(child: CircularProgressIndicator());
                // }
                 if (state is SearchLoaded) {
                  return Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.60,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          mainAxisSpacing: 9,
                        ),
                        itemCount: state.keyword.length,
                        itemBuilder: (BuildContext context, index) {
                          print("object${state.keyword[index].name}");
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(productId: state.keyword[index].id??0 ,)),
                                );
                                context.read<ProductBloc>().add(
                                  LoadDetails(state.keyword[0].id??0),
                                );
                              },
                              child: ProductCard(
                                title: state.keyword[index].name??"no name",
                                subtitle: state.keyword[index].brand,
                                image: state.keyword[index].image??"",
                                price: state.keyword[index].price??'',
                                isInWishlist: whishlist.any((item) => item.id == keyword[index].id),
                              ));
                        }),
                    // child: ListView.builder(
                    //   itemCount: state.keyword.length,
                    //   itemBuilder: (context, index) {
                    //     final product = state.keyword[index];
                    //     return ListTile(
                    //       title: Text(product.name),
                    //       subtitle: Text(product.description),
                    //     );
                    //   },
                    // ),
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Search for products'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
