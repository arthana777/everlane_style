import 'package:everlane_style/widgets/customfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBanner extends StatelessWidget {
  const CategoryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          child: Container(
            height: 215.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage("https://images.unsplash.com/photo-1628573543788-0c745a2b93e8?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover,
              )
            ),
          ),
        ),
        Container(
          height: 215.h,
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30,top: 30),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Summer",style: CustomFont().appbarText,),

            ],),
          ),
        )

      ],
    );
  }
}
