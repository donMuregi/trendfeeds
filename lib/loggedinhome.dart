// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:trendfeeds/signup.dart';
import 'package:searchfield/searchfield.dart';
import 'package:trendfeeds/Login.dart';

class loggedInHome extends StatefulWidget {
  const loggedInHome({super.key});

  @override
  State<loggedInHome> createState() => _loggedInHomeState();
}

class _loggedInHomeState extends State<loggedInHome> {
  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: RPSCustomPainter(),
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pickup Location',
                            style: TextStyle(
                              fontFamily: 'open sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlineSearchBar(
                          borderColor: Colors.black,
                          hintText: 'Pickup Location',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Food Category',
                            style: TextStyle(
                              fontFamily: 'open sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlineSearchBar(
                          borderColor: Colors.black,
                          hintText: 'Pickup Location',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Quantity',
                            style: TextStyle(
                              fontFamily: 'open sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OutlineSearchBar(
                          borderColor: Colors.black,
                          hintText: 'Pickup Location',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            signOutUser();
                          },
                          icon: Icon(Icons.add_to_home_screen_outlined),
                          label: Text('Search'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              minimumSize: const Size.fromHeight(50)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 153, 39, 204)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * -0.6917328, size.height * -0.3611265);
    path0.lineTo(size.width * 1.6651293, size.height * -0.3652469);
    path0.quadraticBezierTo(size.width * 1.6651293, size.height * 0.1071296,
        size.width * 1.6651293, size.height * 0.2645525);
    path0.cubicTo(
        size.width * 1.0484655,
        size.height * 0.5274074,
        size.width * -0.1297069,
        size.height * 0.5087346,
        size.width * -0.6965172,
        size.height * 0.2645525);
    path0.quadraticBezierTo(size.width * -0.6952759, size.height * 0.1082253,
        size.width * -0.6917328, size.height * -0.3611265);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
