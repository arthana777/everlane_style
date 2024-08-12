import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/cart/cartitem.dart';
import 'package:everlane_style/cart/cartscreen.dart';
import 'package:everlane_style/navigation_provider/navigation_provider.dart';
import 'package:everlane_style/profile/profile.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 2) ? Icons.person : Icons.person_outline,
              color: CustomColor.primaryColor,
              size: 30.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              (currentScreenIndex == 3)
                  ? Icons.shopping_cart
                  : Icons.shopping_cart,
              color: CustomColor.primaryColor,
            ),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
