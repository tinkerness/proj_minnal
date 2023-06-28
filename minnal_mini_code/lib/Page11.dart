import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minnalmini/Page6.dart';
import 'package:minnalmini/consumermodel.dart';

class Page11 extends StatefulWidget {
  final ConsumerModel consumer;
  const Page11({Key? key, required this.consumer}) : super(key: key);

  @override
  State<Page11> createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  CollectionReference<Map<String, dynamic>>? notificationCollection;
  late DateTime today;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    today = DateTime(now.year, now.month, now.day);
    log(today.toString());
    notificationCollection = FirebaseFirestore.instance
        .collection('consumers')
        .doc(widget.consumer.id)
        .collection('notification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NOTIFICATIONS",
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
                  ),
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "TODAY",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: notificationCollection
                    ?.where('timestamp', isGreaterThan: today)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs.reversed.toList();
                    if (messages.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'No notifications to show',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final messageData = messages[index].data();
                          log(messageData.toString());
                          Timestamp? timestamp = messageData['timestamp'];
                          DateTime? date = timestamp?.toDate();
                          return GestureDetector(
                            onTap: () {
                              // Handle onTap for the container
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                border: Border.all(color: Colors.red, width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    messageData['message'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    date != null
                                        ? "${date.day} - ${date.month} - ${date.year}  ${date.hour} : ${date.minute} : ${date.second}"
                                        : "Nill",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Error fetching notifications'),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const Text(
                "EARLIER",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: notificationCollection
                    ?.where('timestamp', isLessThan: today)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs.reversed.toList();
                    if (messages.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'No earlier notifications to show',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final messageData = messages[index].data();
                          log(messageData.toString());
                          Timestamp? timestamp = messageData['timestamp'];
                          DateTime? date = timestamp?.toDate();
                          return GestureDetector(
                            onTap: () {
                              // Handle onTap for the container
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                border: Border.all(color: Colors.red, width: 5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    messageData['message'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    date != null
                                        ? "${date.day} - ${date.month} - ${date.year}  ${date.hour} : ${date.minute} : ${date.second}"
                                        : "Nill",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Error fetching notifications'),
                    ));
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
      ),
    );
  }
}
