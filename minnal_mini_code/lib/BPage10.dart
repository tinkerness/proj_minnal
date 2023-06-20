import 'package:flutter/material.dart';

class BPage10 extends StatefulWidget {
  const BPage10({Key? key});

  @override
  State<BPage10> createState() => _BPage10State();
}

class _BPage10State extends State<BPage10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETTINGS',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/minnalicon.png'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Userid',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                height: 200,
                width: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Userid             :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('XXXXXXXXX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Row(
                      children: [
                        Text('Section           :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('XXXXX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Row(
                      children: [
                        Text('No. of Poles   :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('XXXX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Row(
                      children: [
                        Text('No. of Trans   :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('XXXXXX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                   
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                height: 160,
                width: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Phone No.   :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('XXXXXXXXXX', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Row(
                      children: [
                        Text('Mail              :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('------@---.com', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                    Row(
                      children: [
                        Text('Password    :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('********', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(25, 50),
                  backgroundColor:  Color.fromARGB(255, 255, 255, 0),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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
