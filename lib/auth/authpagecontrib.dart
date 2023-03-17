import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trendfeeds/Contributors.dart';
import 'package:trendfeeds/HomePage.dart';
import 'package:trendfeeds/Login.dart';
import 'package:trendfeeds/loggedinhome.dart';

class AuthContrib extends StatefulWidget {
  const AuthContrib({super.key});
  @override
  State<AuthContrib> createState() => _AuthContribState();
}

class _AuthContribState extends State<AuthContrib> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (user != null) {
            return Contributors();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
