import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minnalmini/BPage6.dart';
import 'package:minnalmini/BPage9.dart';

class BPage5 extends StatefulWidget {
  const BPage5({Key? key}) : super(key: key);

  @override
  State<BPage5> createState() => _BPage5State();
}

class _BPage5State extends State<BPage5> {
  int? pole1Count;
  int? pole2Count;
  int? pole3Count;
  int? pole4Count;

  @override
  void initState() {
    super.initState();
    fetchComplaintCounts();
  }

  Future<void> fetchComplaintCounts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Complaints').get();

      // Calculate the count for each pole
      int? countPole1 = 0;
      int? countPole2 = 0;
      int? countPole3 = 0;
      int? countPole4 = 0;

      snapshot.docs.forEach((DocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data()!;
        String? status = data['status'];

        if (status != 'resolved') {
          int? poleNumberField = int.tryParse(data['poleNumber'] ?? '');

          if (poleNumberField == 1) {
            countPole1 = (countPole1 ?? 0) + 1;
          } else if (poleNumberField == 2) {
            countPole2 = (countPole2 ?? 0) + 1;
          } else if (poleNumberField == 3) {
            countPole3 = (countPole3 ?? 0) + 1;
          } else if (poleNumberField == 4) {
            countPole4 = (countPole4 ?? 0) + 1;
          }
        }
      });

      // Update the state with the counts
      setState(() {
        pole1Count = countPole1;
        pole2Count = countPole2;
        pole3Count = countPole3;
        pole4Count = countPole4;
      });
    } catch (e) {
      // Handle any errors that occur during fetching
      print('Error fetching complaint counts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "POLES",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BPage9()),
              );
            },
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 0),
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Pole:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PoleCard(
                  poleText: 'P1',
                  count: pole1Count ?? 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BPage6(poleNumber: 1)),
                    );
                  },
                ),
                PoleCard(
                  poleText: 'P2',
                  count: pole2Count ?? 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BPage6(poleNumber: 2)),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PoleCard(
                  poleText: 'P3',
                  count: pole3Count ?? 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BPage6(poleNumber: 3)),
                    );
                  },
                ),
                PoleCard(
                  poleText: 'P4',
                  count: pole4Count ?? 0,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BPage6(poleNumber: 4)),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PoleCard extends StatelessWidget {
  final String poleText;
  final int count;
  final VoidCallback onTap;

  const PoleCard({
    Key? key,
    required this.poleText,
    required this.count,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              poleText,
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
                onTap: onTap,
                child: Text(
                  count.toString(),
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
    );
  }
}
