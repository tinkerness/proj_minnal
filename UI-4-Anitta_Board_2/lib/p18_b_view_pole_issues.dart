import 'package:flutter/material.dart';
import 'p21_b_board_menu.dart';
import 'p19_b_set_issue_status.dart';

class ViewPoleIssues extends StatefulWidget {
  const ViewPoleIssues({super.key});

  @override
  State<ViewPoleIssues> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ViewPoleIssues> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'POLE STATUS',
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 10),
          children: [
            Text(
              'Pole No.: P1 :',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Card(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('1', style: TextStyle(fontSize: 20)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetIssueStatus()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Name : consumerName \nAddress : consumerAddress \n ................',
                                style: TextStyle(fontSize: 20)),
                            Text(
                              'Issue : Line lying low',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Card(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('2', style: TextStyle(fontSize: 20)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetIssueStatus()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Name : consumerName \nAddress : consumerAddress \n ................',
                                style: TextStyle(fontSize: 20)),
                            Text(
                              'Issue : Pole leaning',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
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
