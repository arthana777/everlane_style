import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cartitem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,)),
        title: Text("Your Shopping Cart",style: CustomFont().appbarText,),
        surfaceTintColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 3,
          itemBuilder: (context,index)=>
          CartItem(),
      ),
    );
  }
}
