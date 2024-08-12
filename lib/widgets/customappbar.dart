import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customfont.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key,  this.text,   this.action, this.color});

 final String? text;
 final Color? color;
   final List<Widget> ?action;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      titleSpacing:0 ,
      backgroundColor: color??Colors.white,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
          child: Icon(Icons.arrow_back)),
      surfaceTintColor: Colors.white,
      toolbarHeight: 70.h,
     //leadingWidth: 20,
      title: Text(text??"", style: CustomFont().appbarText),
      actions:action,
    );
  }
}
