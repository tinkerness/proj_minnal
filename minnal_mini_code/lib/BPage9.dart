import 'package:flutter/material.dart';
import 'package:minnalmini/BPage1.dart';
import 'package:minnalmini/BPage10.dart';
import 'package:minnalmini/BPage2.dart';
import 'package:minnalmini/BPage3.dart';
import 'package:minnalmini/BPage4.dart';
import 'package:minnalmini/BPage5.dart';
import 'package:minnalmini/BPage8.dart';
import 'package:minnalmini/Page1.dart';

class BPage9 extends StatelessWidget {
  const BPage9({Key? key});

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
          centerTitle: true, // Center the title
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BPage2()),
                  );
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'View Notifications',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BPage4()),
                  );
                },
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: Text(
                  'Send Alerts',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BPage3()),
                  );
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
                    MaterialPageRoute(builder: (context) => BPage5()),
                  );
                },
              ),
              Divider(
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
                    MaterialPageRoute(builder: (context) => BPage8()),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BPage10()),
                  );
                },
              ),
              Divider(color: Colors.black38),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFFFFF00),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "LOG OUT",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}
