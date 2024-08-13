import 'package:everlane_style/cart/cartitem.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/customcolor.dart';

class PaymentScreen extends StatefulWidget {
   PaymentScreen({super.key,});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
   bool isSelected=false;

   bool _isVisible=false;

   void _toggleVisibility() {
     setState(() {
       _isVisible = !_isVisible;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {
         // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text("Place Order", style: CustomFont().subtitleText),
          ),
        ),
        icon: Icon(
          Icons.shopping_bag_outlined,
          size: 20.sp,
          color: CustomColor.buttoniconColor,
        ),
      ),
      backgroundColor:  Color(0xFFEFEFEF),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar(text: "Confirm Order",)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 400.w,
                  child: CartItem()),
              if (_isVisible)
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  //padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CartItem(),
                      );
                    }),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 150.w),
                child: TextButton(
                  onPressed: _toggleVisibility,
                  child: Text(_isVisible ? 'View Less' : 'View More'),
                ),
              ),

          SizedBox(height: 8.h,),


          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
            padding: EdgeInsets.all(10),
            height: 50.h,
            //width: 380.w,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cash on delivery",style: CustomFont().bodyText,),
                Icon(isSelected?Icons.circle_outlined:Icons.check_circle),
              ],
            ),

                ),
          ),
              SizedBox(height: 15.h,),

              Padding(
                padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Address",style: CustomFont().subtitleText,),
                    InkWell(
                      onTap: (){},
                        child: Text("Change",style: CustomFont().bodyText,)),
                  ],
                ),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 150.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text("Tessa"),
                        Text("flat no"),
                        Text("phone number"),
                        Text("Pincode"),
                        Text("City"),
                        Text("State")
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 150.h,
                  width: 450.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
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
