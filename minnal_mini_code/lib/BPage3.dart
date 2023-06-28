import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minnalmini/BPage9.dart';

class BPage3 extends StatelessWidget {
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();

  BPage3({Key? key}) : super(key: key);

  void sendNotification(BuildContext context) {
    String enteredText1 = textController1.text;
    String enteredText2 = textController2.text;

    // Get a reference to the Firestore collection
    CollectionReference consumersCollection =
        FirebaseFirestore.instance.collection('consumers');

    consumersCollection
        .where('poleNumber', isEqualTo: enteredText2)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot documentSnapshot) {
        // Get the document ID
        String documentId = documentSnapshot.id;

        // Reference the notification subcollection
        CollectionReference notificationCollection =
            consumersCollection.doc(documentId).collection('notification');

        // Write the text to the notification subcollection
        notificationCollection.add({
          'message': enteredText1,
          'timestamp': DateTime.now(),
        });
      });
    });

    // Show a SnackBar indicating the successful sending of the notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Message sent successfully!'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate to BPage9 after sending the notification
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BPage3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SEND ALERTS",
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
                  builder: (context) => BPage9(),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                'Enter Text : ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(3),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: textController1,
                  decoration: const InputDecoration(
                    hintText: 'Enter the text',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Consumers Affected : ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(3),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: textController2,
                  decoration: const InputDecoration(
                    hintText: 'Enter Pole Number ',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2),
                  backgroundColor: Colors.yellow,
                  minimumSize: const Size(330, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  sendNotification(context);
                },
                child: const Text(
                  'SEND',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
