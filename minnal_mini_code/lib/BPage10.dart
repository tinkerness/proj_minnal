import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minnalmini/BPage1.dart';

class BPage10 extends StatefulWidget {
  const BPage10({Key? key}) : super(key: key);

  @override
  State<BPage10> createState() => _BPage10State();
}

class _BPage10State extends State<BPage10> {
  @override
  Widget build(BuildContext context) {
    void changePasswordEmail(String newEmail, String newPassword) async {
      User? user = FirebaseAuth.instance.currentUser;

      try {
        await user?.updatePassword(newPassword);
        await user?.updateEmail(newEmail);
        print('Password changed successfully');
      } catch (e) {
        print('Error changing password: $e');
      }
    }

    TextEditingController mailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    User? user = FirebaseAuth.instance.currentUser;
    // String? useremail = user!.email!.toString();
    String? useremail = user?.email?.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('board')
            .where('email', isEqualTo: useremail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // String? boardemail = snapshot.data!.docs[0].get('email');
          String? boardemail = snapshot.data?.docs[0].get('email') as String?;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('images/minnalicon.png'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      useremail ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      height: 200,
                      width: 500,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Container(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Row(
                              children: [
                                Text(
                                  'Userid             :',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  boardemail!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Divider(color: Colors.black, thickness: 2),
                          Row(
                            children: [
                              Text(
                                'Section           :',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Pala',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.black, thickness: 2),
                          Row(
                            children: [
                              Text(
                                'No. of Poles   :',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.black, thickness: 2),
                          Row(
                            children: [
                              Text(
                                'No. of Trans   :',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Update Profile'),
                            content: SizedBox(
                              height: 200,
                              width: 100,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: mailcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'New Email',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: passwordcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'New Password',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextButton(
                                    child: Text('Update'),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('board')
                                          .doc('pala')
                                          .update({
                                        'email': mailcontroller.text,
                                        'password': passwordcontroller.text,
                                      }).then((value) {
                                        print('Field updated successfully');
                                      }).catchError((error) {
                                        print('Error updating field: $error');
                                      });

                                      changePasswordEmail(
                                        mailcontroller.text,
                                        passwordcontroller.text,
                                      );

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BPage1(context: context),

                                            // builder: (context) => BPage1(),
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(25, 50),
                        backgroundColor: const Color.fromARGB(255, 255, 255, 0),
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Update',
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
            );
          }
        },
      ),
    );
  }
}
