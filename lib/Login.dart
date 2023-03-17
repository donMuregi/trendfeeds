// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trendfeeds/signup.dart';
import 'package:trendfeeds/widgets/bottomBar.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passController.text);

      Navigator.pop(context);
      welcome();

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => bottomWidget(),
      ));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongUser();
      } else if (e.code == 'wrong-password') {
        wrongPass();
      } else {
        ;
      }
    }
  }

  void wrongPass() {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            child: Text('Wrong password'),
          );
        });
  }

  void welcome() {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            child: Text('Welcome'),
          );
        });
  }

  void wrongUser() {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog(
            child: Text('User not found'),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          // padding: const EdgeInsets.all(20),
          // width: 300,
          // height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.5),
          ),
          child: AlertDialog(
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: Text('Email Address'),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                        )),
                        contentPadding:
                            EdgeInsets.only(top: 20.0, bottom: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email address field is empty';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$")
                            .hasMatch(value)) {
                          return 'Enter valid email address';
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          )),
                          contentPadding:
                              EdgeInsets.only(top: 20.0, bottom: 20.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password field is Empty';
                          }
                        }),
                    SizedBox(height: 15.0),
                    Text('forgot password'),
                    SizedBox(height: 25.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState?.validate();
                        signIn();
                      },
                      icon: Icon(Icons.add_to_home_screen_outlined),
                      label: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          minimumSize: const Size.fromHeight(50)),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not yet a Member?'),
                        SizedBox(height: 30.0),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Signup())),
                          child: Text(
                            'Register Now',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
