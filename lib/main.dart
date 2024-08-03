
import 'package:everlane_style/first_page/first_page.dart';
import 'package:everlane_style/navigation_provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/category_bloc.dart';

void main() {
  runApp(MultiProvider(
      providers: [
      
         ChangeNotifierProvider(create:(_)=> NavigationProvider()),
         
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
return MultiProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => CategoryBloc(),
              ),

            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
          
  
              home: FirstPage(),

            ),
          );
        });
  }
}
