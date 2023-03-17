import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendfeeds/singleItem.dart';
import 'package:trendfeeds/singleItemprofile.dart';

class MyItems extends StatelessWidget {
  MyItems({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.purple,
        ),
        body: Container(
          child: Column(children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('contributors')
                    .where('userid', isEqualTo: user!.uid)
                    .snapshots(),
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
                  final List<myItem> contributor = snapshot.data!.docs
                      .map((doc) {
                        return myItem(
                          title: doc['title'],
                          quantity: doc['quantity'],
                          description: doc['description'],
                          pickup: doc['pickup'],
                          days_listed: doc['days_listed'],
                          location: doc['location'],
                          street: doc['street'],
                        );
                      })
                      .cast<myItem>()
                      .toList();
                  return Expanded(
                      child: ListView.builder(
                          itemCount: contributor.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingleItemProfile(
                                            contributor: contributor[index])));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          contributor[index].title,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.purple,
                                          ),
                                        ),
                                        Text(
                                          contributor[index].description,
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
                                              contributor[index].days_listed,
                                            ),
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.purple,
                                            ),
                                            SizedBox(width: 5),
                                            Text(contributor[index].location),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }));
                })
          ]),
        ));
  }
}

class myItem {
  String days_listed;
  String description;
  String pickup;
  String quantity;
  String title;
  String location;
  String street;
  myItem({
    required this.days_listed,
    required this.description,
    required this.pickup,
    required this.quantity,
    required this.title,
    required this.location,
    required this.street,
  });
}
