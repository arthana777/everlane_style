import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductCard extends StatelessWidget {
  ProductCard({super.key, });


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 300.h,
        width: 200.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
                height: 200.h,
                width: 220.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image:NetworkImage('https://plus.unsplash.com/premium_photo-1668485966810-cbd0f685f58f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZmFzaGluJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: Text( 'title',style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,
                          fontWeight: FontWeight.w300,color: Colors.grey)),),
                    ),
                    SizedBox(height: 4,),
                    Text( 'subtitle',
                      style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500)),
                      maxLines: 2,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.star_outlined,color: Colors.yellow,),
                        SizedBox(width: 10,),
                        Text( '4',style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 12.sp))),
                        SizedBox(width: 90.h,),
                        Text('${700}',style: GoogleFonts.poppins(textStyle:TextStyle(fontSize: 15.sp,color: Colors.green)))
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
