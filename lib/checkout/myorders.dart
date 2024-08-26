import 'package:everlane_style/checkout/orderitem.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/profile/profile.dart';
import 'package:everlane_style/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: PreferredSize(preferredSize: Size.fromHeight(80.h), child: CustomAppBar(
        text: 'MyOrders',
        leading: InkWell(
          onTap: () {
            final navigationProvider =
            Provider.of<NavigationProvider>(context, listen: false);
            navigationProvider.updateScreenIndex(0);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      )),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        itemCount: 7,
          itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: OrderItem(),
           );
      }),
    );
  }
}
