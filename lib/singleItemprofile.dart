// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trendfeeds/Contributors.dart';
import 'package:trendfeeds/myitems.dart';
import 'package:trendfeeds/widgets/postFood1.dart';

class SingleItemProfile extends StatelessWidget {
  final myItem contributor;
  SingleItemProfile({required this.contributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/single.png',
                  height: 300,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: Colors.grey.withOpacity(0.2)),
                  child: Column(
                    children: [
                      Text(
                        contributor.title,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'open sans',
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'By Kimani Kinuthia',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'open sans',
                            fontWeight: FontWeight.w400),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(children: [
                          Icon(Icons.location_on),
                          Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'open sans',
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          contributor.location,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'open sans',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'open sans',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'open sans',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          contributor.description,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'open sans',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
