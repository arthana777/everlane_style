import 'package:everlane_style/cart/cartscreen.dart';
import 'package:everlane_style/checkout/payment.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widgets/customcolor.dart';
import '../widgets/cutsofield_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen() ,
          )
          );
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: CustomAppBar(text: "Create your Address",)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AdrressCustomField(hinttext: 'House no/Flat no',),
            SizedBox(height: 8.h,),
            AdrressCustomField(hinttext: 'Pin Code',),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdrressCustomField(hinttext: 'City',width: 175.h,),
                AdrressCustomField(hinttext: 'State',width: 175.h,)

              ],
            ),
            SizedBox(height: 8.h,),
            AdrressCustomField(hinttext: 'Landmark',),
            SizedBox(height: 20.h,),
            Text("Save as",style: CustomFont().titleText,),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAdressSelection(text: 'Home',),
                CustomAdressSelection(text: 'Work',),
                CustomAdressSelection(text: 'Friend',),
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
