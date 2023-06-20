import 'package:flutter/material.dart';
import 'package:minnalmini/BPage9.dart';

class BPage4 extends StatelessWidget {
  const BPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NOTIFICATIONS",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {
             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BPage9(),
                              ),
                            );
          }, icon: const Icon(Icons.menu, color: Color.fromARGB(255, 255, 255, 0),
              size: 30,)),
        ],
        
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "P1  \t    Line Lying Low \t  6:30 AM",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "P1  \t    Pole leaning \t    6:35 AM",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "P2  \t  Voltage Fluctuation \t 7:00 AM",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
