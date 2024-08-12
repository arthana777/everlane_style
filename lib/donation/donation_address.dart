import 'package:everlane_style/cart/cartscreen.dart';
import 'package:everlane_style/checkout/payment.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widgets/customcolor.dart';
import '../widgets/cutsofield_address.dart';

class DisasterRegistration extends StatelessWidget {
  DisasterRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {

        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text("Proceed to Buy", style: CustomFont().buttontext),
          ),
        ),
        icon: Icon(
          Icons.shopping_bag_outlined,
          size: 20.sp,
          color: Colors.white,
        ),
      ),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: CustomAppBar(text: "Register Disaster",)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AdrressCustomField(hinttext: 'Name',),
            SizedBox(height: 8.h,),
            AdrressCustomField(hinttext: 'Place of Disaster',),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdrressCustomField(hinttext: 'Gov id',width: 175.h,),
                AdrressCustomField(hinttext: 'Type of Disaster',width: 175.h,)

              ],
            ),
            SizedBox(height: 8.h,),
            AdrressCustomField(hinttext: 'Landmark',),
            SizedBox(height: 20.h,),
            Text("Type of Disaster",style: CustomFont().subtitleText,),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAdressSelection(text: 'Flood',),
                CustomAdressSelection(text: 'Earthquake',),
                CustomAdressSelection(text: 'LandSlide',),
              ],
            ),
            SizedBox(height: 20.h,),
            AdrressCustomField(hinttext: 'Recievers Name',),
            SizedBox(height: 8.h,),
            AdrressCustomField(hinttext: 'Recievers Phone number',),


          ],
        ),
      ),
    );
  }
}
