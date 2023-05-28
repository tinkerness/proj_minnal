import 'package:flutter/material.dart';
import 'p21_b_board_menu.dart';

class SetIssueStatus extends StatefulWidget {
  const SetIssueStatus({super.key});

  @override
  State<SetIssueStatus> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SetIssueStatus> {
  String? status;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SET STATUS',
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
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 10),
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
                      Container(
                        width: 35,
                        child: Text('1', style: TextStyle(fontSize: 20)),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Name : consumerName \nAddress : consumerAddress \n\t\t................\nIssue : Line lying low',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            // alignment: Alignment.centerLeft,
                            child: Text(
                              '\nImage:',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.black26)),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(context, route)
                              },
                              child: Image(
                                image: AssetImage("images/image1.png"),
                                height: 60,
                                width: 60,
                              ),
                            ),
                            // child: PhotoView(
                            //   imageProvider: AssetImage("images/image1.png"),
                            // ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Resolved ?",
                                      style: TextStyle(fontSize: 20)),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'yes',
                                        groupValue: status,
                                        onChanged: (value) {
                                          setState(() {
                                            status = value;
                                          });
                                        },
                                      ),
                                      Text("YES")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'no',
                                        groupValue: status,
                                        onChanged: (String? value) {
                                          setState(() {
                                            status = value;
                                          });
                                        },
                                      ),
                                      Text("NO")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'processing',
                                        groupValue: status,
                                        onChanged: (String? value) {
                                          setState(() {
                                            status = value;
                                          });
                                        },
                                      ),
                                      Text("PROCESSING")
                                    ],
                                  )
                                ],
                              )),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Add comments:\n_______________________',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                              style: BorderStyle.solid))),
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                )),
                          ),
                        ],
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
