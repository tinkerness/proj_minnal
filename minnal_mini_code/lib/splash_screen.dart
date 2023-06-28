import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minnalmini/Page1.dart';
import 'firebasenotificationservice.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseNotificationService().onMessage();
    FirebaseNotificationService().onMessageOpened();
    FirebaseNotificationService().initialize();
    Timer(Duration(seconds: 3), () {
      // Replace "HomeScreen" with your desired screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            color: Colors.black,
            child: Image.asset(
              'images/minnalicon.png',
            ),
          )
        ],
      ),
    ));
  }
}
