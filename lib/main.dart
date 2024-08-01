import 'package:device_preview/device_preview.dart';
import 'package:everlane_style/Home/button_toggle_provider.dart';
import 'package:everlane_style/categories/category_bloc.dart';
import 'package:everlane_style/first_page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      DevicePreview(
    enabled: true,
    builder: (context) =>  ChangeNotifierProvider<ButtonToggleProvider>(
        create: (_) => ButtonToggleProvider(),
      child: const MyApp(),),
  ),

  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: FirstPage(),
            ),
          );
        });
  }
}
