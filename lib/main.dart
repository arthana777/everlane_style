import 'dart:io';

import 'package:everlane_style/bloc/change_password/bloc/change_password_bloc.dart';
import 'package:everlane_style/bloc/editprofile/bloc/editprofile_bloc.dart';
import 'package:everlane_style/bloc/address/address_bloc.dart';
import 'package:everlane_style/bloc/cart/cart_bloc.dart';
import 'package:everlane_style/bloc/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:everlane_style/bloc/notifications/bloc/notification_bloc_bloc.dart';
import 'package:everlane_style/bloc/product/product_bloc.dart';
import 'package:everlane_style/bloc/question_bloc/bloc/question_bloc.dart';
import 'package:everlane_style/bloc/question_result/bloc/question_result_bloc.dart';
import 'package:everlane_style/bloc/userprofile/bloc/profile_bloc.dart';
import 'package:everlane_style/bloc_signup/bloc/signup_bloc.dart';
import 'package:everlane_style/data/datasources/change_password_repo.dart';
import 'package:everlane_style/data/datasources/forgot_password_service.dart';
import 'package:everlane_style/data/datasources/notification_service.dart';
import 'package:everlane_style/data/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/data/datasources/qst_service.dart';
import 'package:everlane_style/data/datasources/editprofileservice.dart';
import 'package:everlane_style/data/datasources/profileservice.dart';
import 'package:everlane_style/data/datasources/signuprepository.dart';
import 'package:everlane_style/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/category_bloc.dart';
import 'bloc/loginn/loginn_bloc.dart';
import 'bloc/whishlist/whishlist_bloc.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}



void main() {
  HttpOverrides.global = MyHttpOverrides();
    
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
                create: (BuildContext context) =>
                    RegistrationBloc(SignupRepository()),
              ),
              BlocProvider(
                create: (BuildContext context) => ProfileBloc(ProfileService()),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    EditprofileBloc(Editprofileservice()),
              ),
              BlocProvider(
                create: (BuildContext context) => ChangePasswordBloc(
                    changePasswordRepo: ChangePasswordRepo()),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    QuestionBloc(QstService()),
              ),
               BlocProvider(
                create: (BuildContext context) =>
                    NotificationBlocBloc(NotificationService()),
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    ForgotPasswordBloc(authRepository:ForgotPasswordService()),
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
              BlocProvider(
                create: (BuildContext context) => CartBloc(),
              ),
              BlocProvider(
                create: (BuildContext context) => AddressBloc(),
              ),
              
              BlocProvider(
                create: (BuildContext context) =>
                    QuestionResultBloc(QstService()),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          );
        });
  }
}
