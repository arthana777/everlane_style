import 'package:everlane_style/data/models/disastermodel.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/donation/imagepickerscreen.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../bloc/address/address_bloc.dart';
import '../btm_navigation/btm_navigation.dart';

class DisasterList extends StatefulWidget {
  const DisasterList({super.key});

  @override
  State<DisasterList> createState() => _DisasterListState();
}

class _DisasterListState extends State<DisasterList> {
  List<Disaster>disaster=[];
  @override
  void initState() {
    BlocProvider.of<AddressBloc>(context).add(FetchDisaster());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: CustomAppBar(
          text: "Disasters",
          leading: InkWell(
              onTap: (){
                final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
                navigationProvider.updateScreenIndex(0);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BtmNavigation()),
                      (Route<dynamic> route) => false,
                );
              },
              child: Icon(Icons.arrow_back)),
        ),
      ),
      backgroundColor: Color(0xFFEFEFEF),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddressBloc, AddressState>(
            listener: (context, state) {
              print(state);
              if (state is AddressLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
              } else if (state is DisasterLoaded) {
                setState(() {

                });
                disaster = state.disaster;
                print(disaster);
                print("Disaster List Length: ${disaster.length}");
                print("Disaster List: $disaster");
                //final useraddress = state.userAddresses;
                print("adding to disaster");
              }
              else if (state is AddressError) {
                // Dismiss loading indicator and show error message
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }

            },
          ),
        ],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: disaster.length,
                itemBuilder: (context, index) {
                  print(disaster[index].location);
                  print(disaster.length,);

                  return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePickerScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: 200.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(disaster[index].name,style: CustomFont().subtitleText,),
                          Text(disaster[index].location,style: CustomFont().bodyText,),
                          SizedBox(height: 15.h,),
                          Text("Requirements"),
                          Divider(thickness: 2,color: Colors.black12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Men: ",style: CustomFont().subtitleText,),
                              Text(disaster[index].requiredMenDresses.toString()),
                              Text("/"),
                              Text(disaster[index].fulfilledMenDresses.toString()),
                              SizedBox(
                                  height:75.h,
                                  child: VerticalDivider(thickness: 2,color: Colors.black12,)),

                              Text("Women: ",style: CustomFont().subtitleText,),
                              Text(disaster[index].requiredWomenDresses.toString()),
                              Text("/"),
                              Text(disaster[index].fulfilledWomenDresses.toString()),
                              SizedBox(
                                  height:75.h,
                                  child: VerticalDivider(thickness: 2,color: Colors.black26,)),
                              Text("Kidds: ",style: CustomFont().subtitleText,),
                              Text(disaster[index].requiredKidsDresses.toString()),
                              Text("/"),
                              Text(disaster[index].fulfilledKidsDresses.toString()),

                            ],
                          )
                        ],
                      ),
                    ),
                  )
                );
  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
