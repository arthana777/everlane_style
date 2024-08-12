import 'package:everlane_style/product_detail/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../productgrid/product_card.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.60,
              crossAxisSpacing: 4,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context,index){
              return InkWell(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductDetails()),
                  );
                },
                child:ProductCard());
            }
        ),
      ),
    );

  }
}
