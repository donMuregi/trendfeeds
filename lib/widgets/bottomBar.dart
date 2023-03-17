// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:trendfeeds/HomePage.dart';
import 'package:trendfeeds/auth/authpagecontrib.dart';
import 'package:trendfeeds/profile.dart';
import 'package:trendfeeds/signup.dart';
import 'package:trendfeeds/widgets/postFood1.dart';
import 'package:trendfeeds/Contributors.dart';

import '../auth/authpage1.dart';

class bottomWidget extends StatefulWidget {
  const bottomWidget({super.key});

  @override
  State<bottomWidget> createState() => _bottomWidgetState();
}

class _bottomWidgetState extends State<bottomWidget> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          const AuthHome(),
          const postFood1(),
          const AuthContrib(),
          const profilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            backgroundColor: Colors.white,
            tabBackgroundColor: Colors.purple,
            activeColor: Colors.white,
            padding: EdgeInsets.all(12),
            gap: 3,
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.shopping_basket,
                text: 'Food',
              ),
              const GButton(
                icon: Icons.add_circle_outlined,
                iconColor: Colors.purple,
                text: 'Give',
              ),
              const GButton(
                icon: Icons.fastfood,
                text: 'Request',
              ),
            ],
            onTabChange: onTapped,
          ),
        ),
      ),
    );
  }
}
