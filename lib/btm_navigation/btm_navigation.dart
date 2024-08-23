import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Home/homescreen.dart';
import '../cartscreen/cartscreen.dart';
import '../navigation_provider/navigation_provider.dart';
import '../profile/profile.dart';
import '../widgets/customcolor.dart';

class BtmNavigation extends StatelessWidget {
  final List<dynamic> screens = [
    const HomeScreen(),
    const Profile(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenindexprovider = Provider.of<NavigationProvider>(context);
    int currentScreenIndex = screenindexprovider.fetchCurrentScreenIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF7F7F7),
        showSelectedLabels: false,
        elevation: 1.5,
        currentIndex: currentScreenIndex,
        onTap: (value) => screenindexprovider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined,
              color: CustomColor.primaryColor,
              size: 30.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 1) ? Icons.person : Icons.person_outline,
              color: CustomColor.primaryColor,
              size: 30.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 2) ? Icons.shopping_cart : Icons.shopping_cart_outlined,
              color: CustomColor.primaryColor,
              size: 30.sp,
            ),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
