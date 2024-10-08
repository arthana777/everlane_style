import 'package:everlane_style/Home/homescreen.dart';
import 'package:everlane_style/profile/profile.dart';
import 'package:everlane_style/widgets/customcolor.dart';
import 'package:flutter/material.dart';

import '../cartscreen/cartscreen.dart';

class BtmNavigation extends StatefulWidget {
  const BtmNavigation({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<BtmNavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    Profile(),
     CartScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26.0,
        backgroundColor: const Color(0xFFF7F7F7),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFFF7F7F7),
            icon: Icon(
              shadows: const [
                Shadow(
                    blurRadius: 2, color: Colors.grey, offset: Offset(0.6, 0.5))
              ],
              _currentIndex == 0 ? Icons.home : Icons.home_outlined,
              color: CustomColor.primaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              shadows: const [
                Shadow(
                    blurRadius: 2, color: Colors.grey, offset: Offset(0.6, 0.8))
              ],
              _currentIndex == 1 ? Icons.person : Icons.person_outline_outlined,
              color: CustomColor.primaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              shadows: const [
                Shadow(
                    blurRadius: 2, color: Colors.grey, offset: Offset(0.6, 0.8))
              ],
              _currentIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
              color: CustomColor.primaryColor,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
