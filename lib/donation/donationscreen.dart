import 'package:carousel_slider/carousel_slider.dart';
import 'package:everlane_style/checkout/address_creation.dart';
import 'package:everlane_style/donation/upload_clothes.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'donation_address.dart';

class DonationHomeScreen extends StatelessWidget {
   DonationHomeScreen({super.key});

  final List<Map<String,String>>seasonbanner=[
    {'title':'winter','image':'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8d2ludGVyJTIwZmFzaGlvbiUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D'},
    {'title':'summer','image':'https://media.istockphoto.com/id/1493715911/photo/beach-walk-of-young-adult-woman-during-vacation-in-sri-lanka.jpg?s=1024x1024&w=is&k=20&c=CpKczf_6U5N1qcYfy-beRHW2SY_9Bcgr90yKZ8SnlFQ='},
    {'title':'rainy','image':'https://plus.unsplash.com/premium_photo-1676762448146-de8a34fbfb88?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnklMjBmYXNoaW9uJTIwYmFubmVyfGVufDB8fDB8fHww'},
    {'title':'autumn','image':'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXV0dW1uJTIwZmFzaGlvbiUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
        text: "Donate here",
      )),
      body: SingleChildScrollView(
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 500.0.h,
                  aspectRatio: 5.0,
                  viewportFraction: 1,
                  autoPlay: true),
              items: seasonbanner.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(seasonbanner[0]['image']!),fit: BoxFit.cover)
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisasterRegistration(),
                  ),
                );
              },
              child: Padding(
                padding:  EdgeInsets.only(right: 50.w,left: 00,top: 20.h),
                child: Container(
                 // padding: EdgeInsets.,
                  height: 50.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/OIP (2).jpg"),fit: BoxFit.cover),
                      color: Color(0xFF973d93)
                    ,
                      border: Border.all(color: Colors.black26,),
                      borderRadius: BorderRadius.circular(10.r),
                      ),

                  child: Center(child: Text("Disaster Registration",style: CustomFont().buttontext,)),
                        ),
              ),
            ),
        
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadClothes(),
                  ),
                );
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 80.w,right:00,top: 50.h),
                child: Container(
                 // padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 50.h,
                  width: 300.w,
        
                  decoration: BoxDecoration(
                    color: Color(0xFF973d93),
                    border: Border.all(color: Colors.black26,),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Center(child: Text("Donate ",style: CustomFont().buttontext,)),
                ),
              ),
            ),
            SizedBox(height: 80.h,),


          ],
        ),
      ),
    );
  }
}
