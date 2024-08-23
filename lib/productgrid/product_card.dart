import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({super.key,  required this.image,  required this.title, required this.subtitle, required this.price, this.ontap, this.cartOntap, required this.isInWishlist, });
  final String image;
  final String title;
  final String subtitle;
  final String price;
final VoidCallback? ontap;
final VoidCallback? cartOntap;
   final bool isInWishlist;

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
                            child: Center(
                                child:
                                Icon(isInWishlist?Icons.favorite:Icons.favorite_border,size: 20.sp,
                                  color: isInWishlist ? Colors.red : Colors.grey,))),
                  )),

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
                    child: Text( subtitle,
                      style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500)),
                      maxLines: 1,
                    ),
                  ),
                  //SizedBox(height: 4,),
                  Text( title,style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,

                      fontWeight: FontWeight.w300,color: Colors.grey)), maxLines: 1,),

                 // SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Text(price,style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,color: Colors.green))),
                      SizedBox(width: 55.w,),
                      Text( '5',style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp))),
                      Icon(Icons.star_outlined,color: Colors.yellow,),
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
