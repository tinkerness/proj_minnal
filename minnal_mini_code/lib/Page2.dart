// consumer registration1 - verification

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minnalmini/Page3.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _consumerNumberController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> _verifyConsumerAndPhoneNumber() async {
    final String consumerNumber = _consumerNumberController.text;
    final String phoneNumber = _phoneNumberController.text;

    // Query Firestore collection to check if consumer number and phone number exist
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('consumers')
        .where('consumerNumber', isEqualTo: consumerNumber)
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      final documentId = querySnapshot.docs.first.id;

      // Consumer number and phone number are verified, proceed with navigation to next page

      /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Verify(documentId: documentId,)),
      )*/
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Verify(documentId: documentId)),
      );
    } else {
      // No matching document found, display an error message or take appropriate action
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid consumer number or phone number.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // Widget code for the rest of the UI
              Container(
                height: 310,
                padding: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(210),
                    bottomRight: Radius.circular(210),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200),
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/minnalicon.png'),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "CONSUMER VERIFICATION",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                    color: const Color.fromARGB(255, 255, 255, 0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _consumerNumberController,
                          decoration: const InputDecoration(
                            labelText: 'consumer number',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            labelText: 'phone number',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _verifyConsumerAndPhoneNumber,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 45),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'VERIFY',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Widget code for the rest of the UI
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 232, 236, 6),
            ),
          ),
        ),
      ],
    ));
  }
}
