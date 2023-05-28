import 'package:flutter/material.dart';
import 'p21_b_board_menu.dart';

class IssueData {
  final String consumerName;
  final String consumerAddress;
  final String issue;

  IssueData({
    required this.consumerName,
    required this.consumerAddress,
    required this.issue,
  });
}

class SetIssueStatus extends StatefulWidget {
  const SetIssueStatus({Key? key});

  @override
  State<SetIssueStatus> createState() => _SetIssueStatusState();
}

class _SetIssueStatusState extends State<SetIssueStatus> {
  String? status;
  bool isImageExpanded = false;
  String comments = '';

  // Simulating data obtained from the backend
  IssueData issueData = IssueData(
    consumerName: 'John Doe',
    consumerAddress: '123 Main Street',
    issue: 'Line lying low',
  );

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
                  side: BorderSide(color: Colors.black),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Name: ${issueData.consumerName}',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Address: ${issueData.consumerAddress}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Issue: ${issueData.issue}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isImageExpanded = !isImageExpanded;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isImageExpanded ? 400 : 200,
                        // width: double.infinity,
                        child: Image.asset(
                          "images/image1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Resolved?",
                            style: TextStyle(fontSize: 20),
                          ),
                          RadioListTile<String>(
                            title: Text("YES"),
                            value: 'yes',
                            groupValue: status,
                            onChanged: (value) {
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: Text("NO"),
                            value: 'no',
                            groupValue: status,
                            onChanged: (value) {
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: Text("PROCESSING"),
                            value: 'processing',
                            groupValue: status,
                            onChanged: (value) {
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            comments = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Comments',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle save button press
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
