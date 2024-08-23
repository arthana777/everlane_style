
import 'package:everlane_style/checkout/payment.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../bloc/address/address_bloc.dart';
import '../widgets/customcolor.dart';
import '../widgets/cutsofield_address.dart';

class DisasterRegistration extends StatelessWidget {
  DisasterRegistration({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController adharController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController requiredWomenDressesController = TextEditingController();
  final TextEditingController requiredMenDressesController = TextEditingController();
  final TextEditingController requiredKidsDressesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        onPressed: () {
          context.read<AddressBloc>().add(DisasterReg(
            name: nameController.text,
            location: locationController.text,
            adhar: adharController.text,
            description: descriptionController.text,
            landmark: landmarkController.text,
            requiredMenDresses: int.tryParse(requiredMenDressesController.text) ?? 0,
            requiredWomenDresses: int.tryParse(requiredWomenDressesController.text) ?? 0,
            requiredKidsDresses: int.tryParse(requiredKidsDressesController.text) ?? 0,



          ));
        },
        label: Container(
          height: 30.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: CustomColor.primaryColor,
          ),
          child: Center(
            child: Text("Register", style: CustomFont().buttontext),
          ),
        ),

      ),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: CustomAppBar(text: "Register Disaster",)),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdrressCustomField(hinttext: 'Name',),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'Place of Disaster',controller: nameController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'location',controller: locationController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'Gov id',controller: adharController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'Landmark',controller: landmarkController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'Description',heigth: 100.h,controller: descriptionController,),
              SizedBox(height: 20.h,),
              Text("Type of Disaster",style: CustomFont().subtitleText,),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomAdressSelection(text: 'Flood',),
                  CustomAdressSelection(text: 'Earthquake',),
                  CustomAdressSelection(text: 'LandSlide',),
                  CustomAdressSelection(text: 'other',),
                ],
              ),
              SizedBox(height: 20.h,),
              AdrressCustomField(hinttext: ' No of women clothes',inputType: TextInputType.number,controller: requiredWomenDressesController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'No of men clothes',inputType: TextInputType.number,controller: requiredMenDressesController,),
              SizedBox(height: 8.h,),
              AdrressCustomField(hinttext: 'No of kidd clothes',inputType: TextInputType.number,controller: requiredKidsDressesController,),
            ],
          ),
        ),
      ),
    );
  }
}
