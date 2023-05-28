import 'package:flutter/material.dart';
import 'p18_b_view_pole_issues.dart';
import 'p21_b_board_menu.dart';

class ViewPoles extends StatefulWidget {
  const ViewPoles({super.key});

  @override
  State<ViewPoles> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ViewPoles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'POLES',
            style: TextStyle(
              color: Color(0xFFFFFF00),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xFFFFFF00),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoardMenu()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Pole :',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.only(top: 100.0, bottom: 10.0)),
                  Container(
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'P1',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFFF00),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Navigate to the next page.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPoleIssues()),
                                );
                              },
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'P2',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFFF00),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Navigate to the next page.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPoleIssues()),
                                );
                              },
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.only(top: 50.0, bottom: 10.0)),
                  Container(
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'P3',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFFF00),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Navigate to the next page.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPoleIssues()),
                                );
                              },
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      color: Color(0xFFD9D9D9),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'P4',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFFF00),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Navigate to the next page.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPoleIssues()),
                                );
                              },
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
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
