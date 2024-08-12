import 'package:everlane_style/checkout/address_creation.dart';
import 'package:everlane_style/whishlist/whishlistitem.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/whishlist/whishlist_bloc.dart';
import '../bloc/whishlist/whishlist_state.dart';
import '../data/models/product_model.dart';
import '../domain/entities/product_entity.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  @override
  Widget build(BuildContext context) {
    List<dynamic>whishlist = [];
    print("mkmkmk${whishlist}");
    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: CustomColor.primaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddressScreen()));
          },
          label: Container(
            height: 30.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: CustomColor.primaryColor,
            ),
            child: Center(
              child: Text("Checkout", style: CustomFont().subtitleText),
            ),
          ),
          icon: Icon(
            Icons.shopping_bag_outlined,
            size: 20.sp,
            color: CustomColor.buttonColor,
          ),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(
              text: 'You Shopping Cart',
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<WhishlistBloc, WishlistState>(
                listener: (context, state) {
              print(state);
              if (state is WishlistLoading) {
                // Show loading indicator
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is WishlistSuccess) {
                // Dismiss loading indicator and show success message
                whishlist = state.whishlists;
                setState(() {

                });

              } else if (state is WishlistFailure) {
                // Dismiss loading indicator and show error message
                Navigator.pop(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text(state.error)),
                // );
              }
            }),
          ],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: whishlist.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WhishlistItem(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ));
  }
}
