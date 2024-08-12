import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductCard extends StatelessWidget {
  ProductCard({super.key,  required this.image,  required this.title, required this.subtitle, required this.price, this.ontap, });
  final String image;
  final String title;
  final String subtitle;
  final String price;
final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 175.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 5),
            )
          ]

      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 210.h,
              width: 210.h,
              child: Stack(
                children: [
                  Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image:NetworkImage(
                           image,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                        right: 10,
                      child: Container(
                        height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                         color: Colors.white70,
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                        child: InkWell(
                          onTap: ontap,
                            child: Center(child: Icon(Icons.favorite_border,size: 20.sp,))),
                  )),
                  Positioned(
                      top: 245,
                      right: 10,
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: InkWell(
                            onTap: (){

                            },
                            child: Center(child: Icon(Icons.shopping_cart,size: 20.sp,))),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    child: Text( title,style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,
                        fontWeight: FontWeight.w300,color: Colors.grey)),),
                  ),
                  SizedBox(height: 4,),
                  Text( subtitle,
                    style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500)),
                    maxLines: 1,
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.star_outlined,color: Colors.yellow,),
                      // SizedBox(width: 5.w,),
                      Text( '5',style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp))),
                      SizedBox(width: 65.h,),
                      Text(price,style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 15.sp,color: Colors.green)))
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
