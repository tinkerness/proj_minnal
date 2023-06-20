import 'package:flutter/material.dart';
import 'package:minnalmini/BPage3.dart';
import 'package:minnalmini/BPage4.dart';
import 'package:minnalmini/BPage5.dart';
import 'package:minnalmini/BPage8.dart';
import 'package:minnalmini/BPage9.dart';

class BPage2 extends StatelessWidget {
  const BPage2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 103,
        title: Column(
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 255, 255, 0),
              ),
            ),
            const Text(
              'KSEB Pala',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 255, 255, 0),
              ),
            ),
          ],
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
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BPage4(),
                              ),
                            );

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(258, 100),
                backgroundColor: Color.fromARGB(255, 255, 255, 0),
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Notification",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BPage3(),
                              ),
                            );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(258, 100),
                backgroundColor: Color.fromARGB(255, 255, 255, 0),
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Send Alert Messages",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BPage5(),
                              ),
                            );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(258, 100),
                backgroundColor: Color.fromARGB(255, 255, 255, 0),
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Poles",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BPage8(),
                              ),
                            );

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(258, 100),
                backgroundColor: Color.fromARGB(255, 255, 255, 0),
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Set Status",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
