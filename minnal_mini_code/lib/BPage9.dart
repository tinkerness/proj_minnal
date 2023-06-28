import 'package:flutter/material.dart';
import 'package:minnalmini/BPage10.dart';
import 'package:minnalmini/BPage2.dart';
import 'package:minnalmini/BPage3.dart';
import 'package:minnalmini/BPage4.dart';
import 'package:minnalmini/BPage5.dart';
import 'package:minnalmini/BPage8.dart';
import 'package:minnalmini/Page1.dart';

class BPage9 extends StatelessWidget {
  const BPage9({Key? key}) : super(key: key);

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
            icon: const Icon(Icons.arrow_back),
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
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BPage2()),
                  );
                },
              ),
              const Divider(color: Colors.black38),
              ListTile(
                title: const Text(
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
              const Divider(color: Colors.black38),
              ListTile(
                title: const Text(
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
              const Divider(color: Colors.black38),
              ListTile(
                title: const Text(
                  'View Poles',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BPage5()),
                  );
                },
              ),
              const Divider(
                color: Colors.black38,
              ),
              ListTile(
                title: const Text(
                  'Set Status',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BPage8()),
                  );
                },
              ),
              const Divider(color: Colors.black38),
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BPage10()),
                  );
                },
              ),
              const Divider(color: Colors.black38),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFF00),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  "LOG OUT",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}
