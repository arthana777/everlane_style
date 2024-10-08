import 'package:everlane_style/checkout/address_list.dart';
import 'package:everlane_style/checkout/payment.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/product_detail/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../bloc/cart/cart_bloc.dart';
import '../bloc/whishlist/whishlist_bloc.dart';
import '../bloc/whishlist/whishlist_event.dart';
import '../bloc/whishlist/whishlist_state.dart';
import '../btm_navigation/btm_navigation.dart';
import '../checkout/address_creation.dart';
import '../data/models/cartmodel.dart';
import '../data/models/whishlistmodel.dart';
import '../donation/donationscreen.dart';

import '../widgets/customappbar.dart';
import '../widgets/customcircularindicator.dart';
import '../widgets/customcolor.dart';
import '../widgets/customfont.dart';
import 'cartitem.dart';

class CartScreen extends StatefulWidget {
   CartScreen({super.key,});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Cart> carts = [];
  List<int> wishlistProductIds = [];
  List<WhislistProduct> whishlist = [];
  int? isclicked;
  bool isLoading = true;

  @override
  void initState() {
    context.read<CartBloc>().add(FetchCartData());
    super.initState();
  }
  void tappingfun(int index) {
    isclicked = index;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEFEFEF),
      floatingActionButton:  FloatingActionButton.extended(
        elevation: 0,
        backgroundColor:  carts.any((cart) => cart.items.isNotEmpty)?CustomColor.primaryColor:Colors.grey,
        onPressed:
          carts.any((cart) => cart.items.isNotEmpty)
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentScreen()),
            );
          } : null,
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color:  carts.any((cart) => cart.items.isNotEmpty)?CustomColor.primaryColor:Colors.grey,
          ),
          child: Center(
            child: Text("Checkout", style: CustomFont().buttontext),
          ),
        ),
        icon: Icon(
          Icons.shopping_cart_outlined,
          size: 20.sp,
          color: CustomColor.buttoniconColor,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          text: 'Your Shopping Cart',
          leading: InkWell(
            onTap: () {
              final navigationProvider =
              Provider.of<NavigationProvider>(context, listen: false);
              navigationProvider.updateScreenIndex(0);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BtmNavigation()),
                (Route<dynamic> route) => false,
              );
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              print(state);
              if (state is CartLoading) {
                setState(() {
                  isLoading = true;
                });
              } else if (state is CartLoaded) {
                carts = state.carts;
                print("Cart Loaded: ${carts.length} carts loaded.");
                setState(() {
                  isLoading = false;
                });
              }
              else if (state is CartError) {
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
              else if(state is RemoveCartSuccess){
                setState(() {
                  carts.forEach((cart) {
                    cart.items.removeWhere((item) => item.productitem == state.removedProductId);
                  });
                 // carts.removeWhere((item) => item.product == state.removedProductId);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item deleted successfully')),
                );
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
                      content:
                      Text('Product added to wishlist successfully!')),
                );
                //BlocProvider.of<WhishlistBloc>(context).add(RetrieveWhishlist());
              } else if (state is addtoWishlistFailure) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              } else if (state is WishlistSuccess) {
                // loading=false;
                whishlist = state.whishlists;
                for (var i = 0; i <= whishlist.length; i++) {
                  wishlistProductIds.add(whishlist[i].product);
                }

                setState(() {});
              } else if (state is RemoveWishlistSuccess) {
                setState(() {
                  whishlist.removeWhere(
                          (item) => item.id == state.removedProductId);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item deleted successfully')),
                );
              } else if (state is RemoveWishlistFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: isLoading
              ? Padding(
                padding:  EdgeInsets.symmetric(vertical: 300.h),
                child: CustomCircularProgressIndicator(),
              ):Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: carts.isEmpty ? 0 : carts.length,
                itemBuilder: (context, cartIndex) {
                  final cart = carts[cartIndex];
                  print(carts.length);
                  if (cart.items.isEmpty) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 100.h,horizontal: 110.w),
                      child: Text("YOUR CART IS EMPTY",style: CustomFont().bodyText,),
                    );
                  }
                  return Column(
                    children: carts[cartIndex].items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartItemCard(
                          ontapremove: (){
                            setState(() {
                            });
                            BlocProvider.of<CartBloc>(context)
                                .add(RemovefromCart(item.id),
                            );
                          },
                          movetowish: (){
                            BlocProvider.of<WhishlistBloc>(context).add(
                                AddToWishlist(item?.id ?? 0));
                            BlocProvider.of<CartBloc>(context)
                                .add(RemovefromCart(item.id),
                            );
                          },
                          title: item.productName,
                          price: item.productPrice,
                          image: item.productImage,
                          itemcount: item.quantity.toString(),
                          decreased: (){
                            BlocProvider.of<CartBloc>(context).add(IncreaseCartItemQuantity(item.id,'increase'));
                          },
                          increased: (){
                            if (item.quantity > 1) {
                              BlocProvider.of<CartBloc>(context).add(DecreaseCartItemQuantity(item.id,'decrease'));
                            }
                          },

                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child:  carts.any((cart) => cart.items.isNotEmpty)?Container(
                  height: 150.h,
                  width: 450.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    Column(
                      children: [
                        _buildRow(context, "Delivery", "0.0"),
                        SizedBox(height: 10.h),
                        _buildRow(context, "Discount", "00"),
                        SizedBox(height: 10.h),
                        _buildRow(context, "Total", carts.isNotEmpty ? carts[0].totalPrice ?? '' : '0.0',),
                      ],
                    ),
                  ),
                ):null
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: CustomFont().bodyText,
          ),
        ),
        SizedBox(
          width: 20.w,
          child: Text(
            ":",
            style: CustomFont().subtitleText,
          ),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          width: 100.w,
          child: Text(
            value,
            style: CustomFont().bodyText,
          ),
        ),
      ],
    );
  }


}