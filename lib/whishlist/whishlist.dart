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
import '../bloc/whishlist/whishlist_event.dart';
import '../bloc/whishlist/whishlist_state.dart';
import '../data/models/product_model.dart';
import '../domain/entities/product_entity.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  List<dynamic>whishlist = [];
  @override
  void initState() {
    BlocProvider.of<WhishlistBloc>(context).add(RetrieveWhishlist());
    super.initState();
  }
  bool loading=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(
              text: 'You Whishlist',
            )),
        body: MultiBlocListener(
          listeners: [
            BlocListener<WhishlistBloc, WishlistState>(
                listener: (context, state) {
              print("pppppppppp$state");
              if (state is WishlistLoading) {
                loading=true;
                setState(() {

                });
                // Show loading indicator

              } else if (state is WishlistSuccess) {
                loading=false;
                // Dismiss loading indicator and show success message
                whishlist = state.whishlists;
                print(whishlist.length);
                print("oooooooooooooooo");
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
                loading==true?Center(child: CircularProgressIndicator()):SizedBox(
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
