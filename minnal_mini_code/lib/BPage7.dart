import 'package:flutter/material.dart';
import 'package:minnalmini/BPage9.dart';

class BPage7 extends StatefulWidget {
  const BPage7({Key? key}) : super(key: key);

  @override
  _BPage7State createState() => _BPage7State();
}

class _BPage7State extends State<BPage7> {
  int? selectedRadioValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 103,
        title: Column(
          children: const [
            Text(
              'SET STATUS',
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BPage9(),
                ),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 0),
              size: 30,
            ),
          ),
        ],
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Pole No.  : P1',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 299,
                        color: Color.fromARGB(255, 194, 190, 190),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Name: Sita',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 299,
                        color: Color.fromARGB(255, 194, 190,
                            190), // Set the color for the padding
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Address :',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 299,
                        color: Color.fromARGB(255, 194, 190,
                            190), // Set the color for the padding
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Issue :',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      Text(
                        "Image:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow,
                              width: 2.0,
                            ),
                          ),
                          child: Image.asset(
                            'images/pic.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text('Yes'),
                            value: 1,
                            groupValue: selectedRadioValue,
                            onChanged: (value) {
                              setState(() {
                                selectedRadioValue = value as int?;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('No'),
                            value: 2,
                            groupValue: selectedRadioValue,
                            onChanged: (value) {
                              setState(() {
                                selectedRadioValue = value as int?;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Processing'),
                            value: 3,
                            groupValue: selectedRadioValue,
                            onChanged: (value) {
                              setState(() {
                                selectedRadioValue = value as int?;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add Comments',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 0),
                                side: BorderSide(
                                    color: Colors.black,
                                    width:
                                        2.0), // Set the desired background color
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
