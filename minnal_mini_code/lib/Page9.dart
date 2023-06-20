import 'package:flutter/material.dart';

import 'Page10.dart';
import 'Page6.dart';

class Page9 extends StatefulWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  State<Page9> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STATUS",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page6()),);
            },
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 0),
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'LATEST ISSUE',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        "DATE :",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 90),
                      Text(
                        " 12/05/23",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 3,
                    thickness: 2,
                    indent: 0,
                    endIndent: 250,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "DETAILS:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 3,
                    thickness: 2,
                    indent: 0,
                    endIndent: 250,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Line low lying",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "STATUS:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 3,
                    thickness: 2,
                    indent: 0,
                    endIndent: 240,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Not Resolved",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "COMMENT:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 3,
                    thickness: 2,
                    indent: 0,
                    endIndent: 220,
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Processing",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'PREVIOUS ISSUES',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page10()),);
              // Handle pole leaning container tap
              
            },
            child: Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "Pole leaning",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page10()),);
              // Handle voltage fluctuation container tap
              
            },
            child: Container(
              height: 70,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "Voltage Fluctuation",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
