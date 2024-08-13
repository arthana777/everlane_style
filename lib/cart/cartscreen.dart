import 'package:everlane_style/checkout/address_creation.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cartitem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: CustomAppBar(text: 'You Shopping Cart',)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartItem(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                height: 150.h,
                width: 450.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildRow(context, "Delivery", "0.0"),
                      SizedBox(height: 10.h),
                      _buildRow(context, "Discount", "00"),
                      SizedBox(height: 10.h),
                      _buildRow(context, "Total", "00.0"),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
