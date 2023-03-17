// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trendfeeds/HomePage.dart';

class Contributors extends StatefulWidget {
  const Contributors({super.key});

  @override
  State<Contributors> createState() => ContributorsState();
}

class ContributorsState extends State<Contributors> {
  final TextEditingController _description = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _pickup = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _street = TextEditingController();

  final _listDays = [
    "1 day",
    "2 days",
    "3 days",
    "4 days",
    "5 days",
    "6 days",
    "1 week ",
    "2 weeks",
    "3 weeks",
    " 1 month"
  ];
  final _pickupDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String? _selectedDay = "Monday";
  String? _selectedVal = "1 day";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            //Food Category

            TextFormField(
              controller: _title,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.title,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                label: Text('Food Title'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(
                hintText: 'e.g Unga Best Before Dec 2023',
                prefixIcon: Icon(
                  Icons.list,
                  color: Colors.purple,
                ),
                label: Text('Description'),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            TextFormField(
              controller: _quantity,
              decoration: InputDecoration(
                hintText: 'e.g 2kg, 10 litres, 3 packets',
                prefixIcon: Icon(
                  Icons.shopping_basket,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                label: Text('Quantity'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160,
                  height: 50,
                  child: DropdownButtonFormField(
                    items: _pickupDays.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedDay = val as String;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.purple,
                      size: 20,
                    ),
                    decoration: InputDecoration(
                      labelText: "Pick up Day",
                      labelStyle: TextStyle(fontSize: 12),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        size: 17,
                        color: Colors.purple,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextFormField(
                    controller: _pickup,
                    decoration: InputDecoration(
                      hintText: 'e.g  11 - 2pm',
                      hintStyle: TextStyle(fontSize: 12),
                      prefixIcon: Icon(
                        Icons.access_time,
                        color: Colors.purple,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      label: Text('Pick up time'),
                      labelStyle: TextStyle(fontSize: 12),
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _contact,
              decoration: InputDecoration(
                hintText: 'e.g 0712 345 678',
                prefixIcon: Icon(
                  Icons.contact_phone,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                label: Text('Contact'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //location
            TextFormField(
              controller: _location,
              decoration: InputDecoration(
                hintText: 'e.g Nairobi, Rongai',
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                label: Text('Location'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _street,
              decoration: InputDecoration(
                hintText: 'e.g Gataka Road, near Quickmart',
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.purple,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                label: Text('Street'),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
              items: _listDays.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectedVal = val as String;
                });
              },
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.purple,
              ),
              decoration: InputDecoration(
                labelText: "List for",
                prefixIcon: Icon(
                  Icons.food_bank,
                  color: Colors.purple,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Map<String, String> contributors = {
                  'title': _title.text,
                  'quantity': _quantity.text,
                  'pickup_time': _pickup.text,
                  'description': _description.text,
                  'days_listed': _selectedVal.toString(),
                  'pickup_day': _selectedDay.toString(),
                  'contact': _contact.text,
                  'location': _location.text,
                  'street': _street.text,
                };
                FirebaseFirestore.instance
                    .collection('contributors')
                    .add(contributors);
              },
              icon: Icon(Icons.food_bank),
              label: Text('Give'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size.fromHeight(50)),
            )
          ]),
        ),
      ),
    );
  }
}
