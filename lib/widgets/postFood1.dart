// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trendfeeds/Contributors.dart';

import '../singleItem.dart';

class postFood1 extends StatefulWidget {
  const postFood1({super.key});

  @override
  State<postFood1> createState() => _postFood1();
}

class _postFood1 extends State<postFood1> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('contributors').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text('Sorry we encountered an error'),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
                backgroundColor: Colors.white,
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('No contributors at the moment'),
            );
          }
          final List<Item> contributors = snapshot.data!.docs
              .map((doc) {
                return Item(
                  title: doc['title'],
                  quantity: doc['quantity'],
                  description: doc['description'],
                  pickup: doc['pickup'],
                  days_listed: doc['days_listed'],
                  location: doc['location'],
                  street: doc['street'],
                );
              })
              .cast<Item>()
              .toList();
          return Expanded(
              child: ListView.builder(
                  itemCount: contributors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => singleItem(
                                    contributors: contributors[index])));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            height: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                  offset: Offset(
                                    1.0, // Move to right 5  horizontally
                                    1.0, // Move to bottom 5 Vertically
                                  ),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  contributors[index].title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple,
                                  ),
                                ),
                                Text(
                                  contributors[index].description,
                                  maxLines: 2,
                                  style: TextStyle(),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      contributors[index].days_listed,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 5),
                                    Text(contributors[index].location),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  }));
        });
  }
}

class Item {
  String days_listed;
  String description;
  String pickup;
  String quantity;
  String title;
  String location;
  String street;
  Item({
    required this.days_listed,
    required this.description,
    required this.pickup,
    required this.quantity,
    required this.title,
    required this.location,
    required this.street,
  });
}
