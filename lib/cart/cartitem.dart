import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_textbutton.dart';
import '../widgets/customfont.dart';

class CartItem extends StatelessWidget {
   CartItem({super.key, this.ontap});

   final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200.w,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: NetworkImage("https://plus.unsplash.com/premium_photo-1658506787944-7939ed84aaf8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVuJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D"),
                          fit: BoxFit.cover
                      ),
                  ),
                ),
                SizedBox(width: 15.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Apple fifteen pro max",style: CustomFont().titleText,),

                    Row(
                      children: [
                        Icon(Icons.currency_rupee),
                        Text("700",style: CustomFont().subtitleText,),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Row(
                        children: [
                          Text("1",style: CustomFont().bodyText,),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(text: "Save for later",),
              CustomTextButton(text: "Remove",),


            ],
          ),
        ],
      ),
    );
  }
}
