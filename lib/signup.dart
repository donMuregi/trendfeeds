// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void dbUpdate() {
    Map<String, String> users = {
      'full_name': _nameController.text,
      'email_address': _emailController.text,
      'phone_no': _phoneController.text,
    };
    FirebaseFirestore.instance.collection('users').add(users);
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/signup.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white.withOpacity(0.7),
                child: Column(
                  children: [
                    Text(
                      'Join Trendfeeds',
                      style: TextStyle(
                          fontFamily: 'open sans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          label: Text('Name'),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                          )),
                          contentPadding:
                              EdgeInsets.only(top: 20.0, bottom: 20.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name field is empty';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.0),
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
                      controller: _phoneController,
                      decoration: InputDecoration(
                        label: Text('Phone Number'),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                        )),
                        contentPadding:
                            EdgeInsets.only(top: 20.0, bottom: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number field is empty';
                        } else if (!RegExp(r"[(0|+?254)7(\d){8}]")
                            .hasMatch(value)) {
                          return 'Enter a valid phone number';
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
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _confirmController,
                      decoration: InputDecoration(
                        label: Text('Confirm your password'),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                        )),
                        contentPadding:
                            EdgeInsets.only(top: 20.0, bottom: 20.0),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'confirm your password';
                        } else if (_confirmController.text ==
                            _passController.text) {
                          return null;
                        } else {
                          return 'passwords do not match';
                        }
                      },
                    ),
                    SizedBox(height: 25.0),
                    ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState?.validate();
                        signUp();
                        dbUpdate();
                      },
                      icon: Icon(Icons.add_to_home_screen_outlined),
                      label: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size.fromHeight(50)),
                    ),
                    SizedBox(height: 10.0),
                    Text('Already Have an Account?'),
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
