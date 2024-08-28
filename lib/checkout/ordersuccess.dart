import 'package:everlane_style/widgets/customcolor.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderSuccessScreen extends StatelessWidget {
  final String invoiceUrl = "http://18.143.206.136/media/invoices/invoice_D83A32A692.pdf";
  Future<void> _launchURL() async {
    final Uri url = Uri.parse("http://18.143.206.136/media/invoices/invoice_D83A32A692.pdf");
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100.sp,
              ),
              SizedBox(height: 20.h),
              Text(
                'Order Placed Successfully!',
                style: GoogleFonts.questrial(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              InkWell(
                onTap:
                  _launchURL,
                child: Container(
                  height: 50.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color:CustomColor.primaryColor,),
                  ),
                  child: Center(
                    child: Text('Download Invoice', style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),



              InkWell(
                onTap: (){

                    Navigator.of(context).popUntil((route) => route.isFirst);

                },
                child: Container(
                  height: 50.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(child: Text('Continue Shopping',style: CustomFont().buttontext,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
