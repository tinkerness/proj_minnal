import 'package:flutter/material.dart';
import 'p17_b_view_poles.dart';
import 'p20_b_set_pole_status.dart';

class BoardMenu extends StatelessWidget {
  const BoardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MENU',
            style: TextStyle(
              color: Color(0xFFFFFF00),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.black,
          // actions: [
          //   IconButton(
          //     icon: Icon(
          //       Icons.menu,
          //       color: Color(0xFFFFFF00),
          //     ),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Do something when the user taps on Option 1.
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'View Notifications',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Do something when the user taps on Option 2.
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'Send Alerts',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Do something when the user taps on Option 1.
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'View Poles',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewPoles()),
                  );
                },
              ),
              Divider(
                // thickness: 1,
                color: Colors.black38,
              ),
              ListTile(
                title: Text(
                  'Set Status',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetPoleStatus()),
                  );
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  // Do something when the user taps on Option 2.
                },
              ),
              Divider(color: Colors.black38),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFFFFF00),
                    foregroundColor: Colors.black),
                onPressed: () {
                  // Do something when the button is tapped.
                },
                child: Text(
                  "LOG OUT",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // ),
              Divider(color: Colors.black38),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFFFFFF00),
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
