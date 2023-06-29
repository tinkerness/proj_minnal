//view status of complaint

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minnalmini/Page10.dart';
import 'package:minnalmini/Page6.dart';
import 'package:minnalmini/consumermodel.dart';
import 'package:minnalmini/complaintmodel.dart';

class Page9 extends StatefulWidget {
  final ConsumerModel consumer;
  const Page9({Key? key, required this.consumer}) : super(key: key);

  @override
  State<Page9> createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  bool isResolved = false;
  ComplaintModel? issueAtFirst;
  CollectionReference<Map<String, dynamic>>? issueCollection;

  @override
  void initState() {
    super.initState();
    issueCollection = FirebaseFirestore.instance.collection('Complaints');
  }

  // Future<void> markAsResolved(ComplaintModel? complaint) async {
  //   try {
  //     if (complaint != null &&
  //         complaint.id != null &&
  //         complaint.status != 'resolved') {
  //       complaint.status == 'resolved';
  //       await issueCollection?.doc(complaint.id).update(complaint.toJson());
  //     }
  //     isResolved = true;
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   setState(() {});
  //   // You can make an API call or update the data source accordingly
  // }

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
                MaterialPageRoute(
                    builder: (context) => Page6(
                          consumer: widget.consumer,
                        )),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'LATEST ISSUE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future:
                  issueCollection?.orderBy('dateTime', descending: true).get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> issues =
                      snapshot.data!.docs;
                  if (issues.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'No Issues to show',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    issueAtFirst = ComplaintModel.fromJson(issues[0].data());
                    issueAtFirst?.id = issues[0].id;
                    final balanceIssues = List.from(issues)..removeAt(0);
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "DATE : ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      issueAtFirst?.dateTime != null
                                          ? "${issueAtFirst?.dateTime?.day} - ${issueAtFirst?.dateTime?.month} - ${issueAtFirst?.dateTime?.year}  ${issueAtFirst?.dateTime?.hour} : ${issueAtFirst?.dateTime?.minute} : ${issueAtFirst?.dateTime?.second}"
                                          : "Nill",
                                      style: const TextStyle(
                                          fontSize: 16,
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
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                Text(
                                  issueAtFirst?.complaintType ?? "Nill",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                Text(
                                  issueAtFirst?.status ?? "Nill",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                Text(
                                  issueAtFirst?.comments ?? "Nill",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'PREVIOUS ISSUES',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: balanceIssues.length,
                            itemBuilder: (context, index) {
                              ComplaintModel issueData =
                                  ComplaintModel.fromJson(
                                      balanceIssues[index].data());
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Page10(
                                              complaint: issueData,
                                            )),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(15),
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      issueData.complaintType ?? "",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Text('Error fetching issues')),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
