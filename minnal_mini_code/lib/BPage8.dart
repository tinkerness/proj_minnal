import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minnalmini/BPage9.dart';

class BPage8 extends StatefulWidget {
  const BPage8({Key? key}) : super(key: key);

  @override
  State<BPage8> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BPage8> {
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SELECT POLE',
            style: TextStyle(
              color: Color(0xFFFFFF00),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xFFFFFF00),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BPage9()),
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
                            child: Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (Set<MaterialState> states) {
                                  return const BorderSide(
                                    color: Color.fromARGB(0, 244, 67, 54),
                                  );
                                },
                              ),
                              activeColor: Color(0x00FFFF00),
                              checkColor: Colors.black,
                              value: isChecked1,
                              onChanged: (val) {
                                setState(() {
                                  isChecked1 = val;
                                });
                              },
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
                            child: Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (Set<MaterialState> states) {
                                  return const BorderSide(
                                    color: Color.fromARGB(0, 244, 67, 54),
                                  );
                                },
                              ),
                              activeColor: Color(0x00FFFF00),
                              checkColor: Colors.black,
                              value: isChecked2,
                              onChanged: (val) {
                                setState(() {
                                  isChecked2 = val;
                                });
                              },
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
                            child: Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (Set<MaterialState> states) {
                                  return const BorderSide(
                                    color: Color.fromARGB(0, 244, 67, 54),
                                  );
                                },
                              ),
                              activeColor: Color(0x00FFFF00),
                              checkColor: Colors.black,
                              value: isChecked3,
                              onChanged: (val) {
                                setState(() {
                                  isChecked3 = val;
                                });
                              },
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
                            child: Checkbox(
                              side: MaterialStateBorderSide.resolveWith(
                                (Set<MaterialState> states) {
                                  return const BorderSide(
                                    color: Color.fromARGB(0, 244, 67, 54),
                                  );
                                },
                              ),
                              activeColor: Color(0x00FFFF00),
                              checkColor: Colors.black,
                              value: isChecked4,
                              onChanged: (val) {
                                setState(() {
                                  isChecked4 = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFFFF00),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      ),
                      onPressed: () {
                        List<String> selectedPoles = [];

                        if (isChecked1!) {
                          selectedPoles.add('1');
                        }
                        if (isChecked2!) {
                          selectedPoles.add('2');
                        }
                        if (isChecked3!) {
                          selectedPoles.add('3');
                        }
                        if (isChecked4!) {
                          selectedPoles.add('4');
                        }

                        if (selectedPoles.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('No Poles Selected'),
                                content: Text(
                                  'Please select at least one pole.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          print(selectedPoles);
                          if (selectedPoles.isNotEmpty) {
                            FirebaseFirestore.instance
                                .collection('Complaints')
                                .get()
                                .then(
                              (QuerySnapshot snapshot) {
                                snapshot.docs.forEach(
                                  (DocumentSnapshot document) {
                                    String poleNumber = document['poleNumber'];
                                    if (selectedPoles.contains(poleNumber)) {
                                      FirebaseFirestore.instance
                                          .collection('Complaints')
                                          .doc(document.id)
                                          .update({
                                        'status': 'resolved',
                                      });
                                    }
                                  },
                                );
                              },
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Resolved'),
                                  content: Text(
                                    'Selected poles resolved successfully.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            setState(() {
                              isChecked1 = false;
                              isChecked2 = false;
                              isChecked3 = false;
                              isChecked4 = false;
                            });
                          }
                          // Save the selected poles to Firestore or perform any other desired actions
                          // You can use the 'selectedPoles' list here
                        }
                      },
                      child: Text(
                        'RESOLVE',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const BPage8());
}
