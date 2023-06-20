// consumer registration2 - fill details

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minnalmini/Page4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Verify extends StatefulWidget {
  final String? documentId;
  const Verify({Key? key, required this.documentId}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _poleNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> _saveConsumerDetails() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String poleNumber = _poleNumberController.text;
    final String address = _addressController.text;

    try {
      await FirebaseFirestore.instance
          .collection('consumers')
          .doc(widget.documentId)
          .update({
        'email': email,
        'password': password,
        'poleNumber': poleNumber,
        'address': address,
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while saving the data.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future createUser() async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

/* Future<bool> checkUserExists(String email) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
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
                  "WELCOME <username>",
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
                    height: 400,
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
                          padding: EdgeInsets.all(6.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'enter email',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'enter password',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: TextField(
                            controller: _poleNumberController,
                            decoration: InputDecoration(
                              labelText: 'pole number',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.0),
                          child: TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              labelText: 'address',
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_passwordController.text.length < 6) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Password must be at least 6 character long.'),
                                  actions: [
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              /*final scaffoldMessenger =
                                  ScaffoldMessenger.of(context);
                              scaffoldMessenger.showSnackBar(
                                SnackBar(
                                  duration: const Duration(milliseconds: 1000),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  content: Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              55, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                          child: Text(
                                        'Unable to sign in',
                                        style: TextStyle(letterSpacing: 5),
                                      ))),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );*/
                              _saveConsumerDetails();
                              createUser().then((_) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Consumer())));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 45),
                            backgroundColor: Colors.white,
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
