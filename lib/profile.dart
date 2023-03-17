import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.dashboard_outlined),
                  Expanded(child: Text('My profile')),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.dashboard_outlined),
                  Expanded(child: Text('My items')),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
