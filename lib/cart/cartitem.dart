import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/customfont.dart';

class CartItem extends StatelessWidget {
   CartItem({super.key, this.ontap});

   final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 15.w,right: 10.w,top: 8.h,bottom: 5.h),
      child: Card(
        elevation: 1,
        child: Container(
          height: 150.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),

          ),
          child: Padding(
            padding:  EdgeInsets.only(left: 10.w,top: 10.h,right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 120.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: NetworkImage("https://plus.unsplash.com/premium_photo-1658506787944-7939ed84aaf8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bWVuJTIwZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D"),
                    fit: BoxFit.cover
                    )
                  ),
                ),
                SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 100.w,
                        child: Text("dress title "
                          ,style: CustomFont().bodyText,),
                      ),
                      SizedBox(
                        height: 20.h,
                        width: 100.w,
                        child: Text("dress title "
                          ,style: CustomFont().bodyText,),
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.remove),
                          Text("1",style: CustomFont().subtitleText,),
                          Icon(Icons.add)
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: ontap,
                    child: Icon(Icons.remove_circle_outline,size: 20.sp,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
