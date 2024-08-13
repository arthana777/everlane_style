
import 'package:everlane_style/bloc/product/product_bloc.dart';
import 'package:everlane_style/bloc_signup/bloc/signup_bloc.dart';
import 'package:everlane_style/first_page/first_page.dart';
import 'package:everlane_style/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_bloc.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_event.dart';
import 'package:everlane_style/on_board/questionnaire_service/qst_service.dart';
import 'package:everlane_style/signup_page/signup_repo/signuprepository.dart';
import 'package:everlane_style/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/category_bloc.dart';
import 'bloc/loginn/loginn_bloc.dart';
import 'bloc/whishlist/whishlist_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
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
                create: (context) => RegistrationBloc(SignupRepository()),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    QuestionBloc(QstService()),
              ),
              BlocProvider(
                create: (BuildContext context) => CategoryBloc(),

              ),
              BlocProvider(
                create: (BuildContext context) => ProductBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => WhishlistBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => LoginnBloc(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          );
        });
  }
}
