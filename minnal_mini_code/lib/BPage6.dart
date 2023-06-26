import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minnalmini/BPage7.dart';
import 'package:minnalmini/BPage9.dart';

class BPage6 extends StatefulWidget {
  final int poleNumber;

  const BPage6({Key? key, required this.poleNumber}) : super(key: key);

  @override
  State<BPage6> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BPage6> {
  List<Map<String, dynamic>> complaints = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchComplaints();
  }

  Future<void> fetchComplaints() async {
    try {
      QuerySnapshot<Map<String, dynamic>> complaintSnapshot =
          await FirebaseFirestore.instance
              .collection('Complaints')
              .where('poleNumber', isEqualTo: widget.poleNumber.toString())
              .where('status', whereIn: ['processing', 'pending']).get();

      for (DocumentSnapshot<Map<String, dynamic>> complaintDoc
          in complaintSnapshot.docs) {
        Map<String, dynamic>? complaintData = complaintDoc.data();
        if (complaintData != null) {
          String consumerNumber = complaintData['consumerNumber'];
          print('Consumer Number: $consumerNumber');

          QuerySnapshot<Map<String, dynamic>> consumerSnapshot =
              await FirebaseFirestore.instance
                  .collection('consumers')
                  .where('consumerNumber', isEqualTo: consumerNumber)
                  .limit(1)
                  .get();

          if (consumerSnapshot.docs.isNotEmpty) {
            DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
                consumerSnapshot.docs[0];
            Map<String, dynamic>? consumerData = documentSnapshot.data();
            if (consumerData != null) {
              String name = consumerData['name'];
              String address = consumerData['address'];
              String issue = complaintData['complaintType'];

              print('Name: $name, Address: $address, Issue: $issue');

              Map<String, dynamic> complaintDetails = {
                'id': complaintDoc.id,
                'name': name,
                'address': address,
                'issue': issue,
              };
              complaints.add(complaintDetails);
            }
          }
        }
      }

      setState(() {
        loading = false;
      });
    } catch (e) {
      print('Error fetching complaints: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "POLE STATUS",
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
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 10),
          children: [
            Text(
              'Pole No.: P${widget.poleNumber}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            loading
                ? Container(
                    width: 40, // Set the width of the container
                    height: 40, // Set the height of the container
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Color.fromARGB(255, 255, 255, 0),
                      backgroundColor: Colors.grey,
                    ),
                  ) // Show a loading indicator while fetching data
                : complaints.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Text(
                          'No complaints!',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: complaints.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> complaint = complaints[index];
                          String name = complaint['name'];
                          String address = complaint['address'];
                          String issue = complaint['issue'];

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Card(
                              color: Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.black),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${index + 1}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        QuerySnapshot<Map<String, dynamic>>
                                            complaintSnapshot =
                                            await FirebaseFirestore.instance
                                                .collection('Complaints')
                                                .where('poleNumber',
                                                    isEqualTo: widget.poleNumber
                                                        .toString())
                                                .get();

                                        String complaintDocumentId =
                                            complaint['id'];
                                        print(
                                            'Complaint Document ID: $complaintDocumentId');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BPage7(
                                              complaintDocumentId:
                                                  complaintDocumentId,
                                            ),
                                          ),
                                        );
                                      } catch (e) {
                                        print('Error fetching complaint: $e');
                                      }
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: $name\nAddress: $address',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Issue: $issue',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
