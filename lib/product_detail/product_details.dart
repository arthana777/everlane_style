
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15.h,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 500.h,
                    width: 600.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.r),topLeft: Radius.circular(30.r),
                      ),
                      image: DecorationImage(
                        image: NetworkImage("https://plus.unsplash.com/premium_photo-1668485966810-cbd0f685f58f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZmFzaGlvbiUyMGdpcmx8ZW58MHx8MHx8fDA%3D"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                      left: 20.w,
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30.r)
                        ),
                          child: Icon(Icons.arrow_back,size: 20.sp,))),
                  Positioned(
                    top: 20.h,
                      right: 20.w,
                      //left: 300.w,
                      child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(30.r)
                          ),
                          child: Icon(Icons.favorite_border,size: 20.sp,))),
                  Positioned(
                    top: 70.h,
                    left: 220.w,
                    right: 30.w,
                    child: Container(
                      height: 400.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        height: 400.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: NetworkImage("https://plus.unsplash.com/premium_photo-1667520043080-53dcca77e2aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmFzaGlvbiUyMG1vZGVsfGVufDB8fDB8fHww"),
                                    fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
          
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dress title",style: CustomFont().subtitleText,),
                    Text("${600}",style: CustomFont().subtitleText,),
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: SizedBox(
                 height: 50.h,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                     itemCount: 5,
                     itemBuilder: (context,index)=>
                         Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Container(
                             height: 20.h,
                             width: 60.w,
                             decoration: BoxDecoration(
                               color: Colors.grey[200],
                               borderRadius: BorderRadius.circular(10)
                             ),
                             child: Center(child: Text("s",style:CustomFont().appbarText)),
                           ),
                         )
                 ),
               ),
             ),

              SizedBox(height: 20.h,),

              Text("Description",style: CustomFont().subtitleText,),
              SizedBox(height: 10.h,),
              SizedBox(
                height: 50.h,
                  width: 550.w,
                  child: Text("dfhjaskdaslcm ckvmeiocj dnkdnsv m kmf lfkc,mcv kfmn fhjaskdaslcm ckvmeiocj dnkdnsv m kmf lfkc,mcv k "))

          
            ],
          ),
        ),
      )
    );
  }
}
