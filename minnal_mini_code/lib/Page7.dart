import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:minnalmini/Page1.dart';
// import 'package:minnalmini/Page4.dart';

class Page7 extends StatefulWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    // void changePasswordEmail(String newEmail, String newPassword) async {
    //   User? user = FirebaseAuth.instance.currentUser;

    //   try {
    //     await user?.updatePassword(newPassword);
    //     await user?.updateEmail(newEmail);
    //     print('Password changed successfully');
    //   } catch (e) {
    //     print('Error changing password: $e');
    //   }
    // }

    // TextEditingController mailcontroller = TextEditingController();
    // TextEditingController passwordcontroller = TextEditingController();

    User? user = FirebaseAuth.instance.currentUser;
    String useremail = user!.email.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('consumers')
            .where('email', isEqualTo: useremail)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Error retrieving data');
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            DocumentSnapshot firstDocument = documents[0];
            String? consumerno = firstDocument.get('consumerNumber');
            String? poleno = firstDocument.get('poleNumber');
            String? documentid = firstDocument.id;

            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Profile',
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
                child: SingleChildScrollView(
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
                          useremail,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          height: 250,
                          width: 300,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('C#          :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text(consumerno!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Divider(color: Colors.black, thickness: 2),
                              Row(
                                children: [
                                  Text('Pole       :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text(poleno!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Divider(color: Colors.black, thickness: 2),
                              Row(
                                children: [
                                  Text('Trans     :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('1',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Divider(color: Colors.black, thickness: 2),
                              Row(
                                children: [
                                  Text('Tariff      :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('LT-1 Dom',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              Divider(color: Colors.black, thickness: 2),
                              Row(
                                children: [
                                  Text('Purpose :',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 10),
                                  Text('Domestic',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      // const SizedBox(height: 16),
                      // Center(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       showDialog(
                      //         context: context,
                      //         builder: (context) => AlertDialog(
                      //           title: Text('update profile'),
                      //           content: SizedBox(
                      //             height: 200,
                      //             width: 100,
                      //             child: Column(
                      //               children: [
                      //                 const SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: TextField(
                      //                     controller: mailcontroller,
                      //                     decoration: InputDecoration(
                      //                         hintText: 'new mail',
                      //                         border: OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10))),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: TextField(
                      //                     controller: passwordcontroller,
                      //                     decoration: InputDecoration(
                      //                         hintText: 'new password',
                      //                         border: OutlineInputBorder(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10))),
                      //                   ),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 TextButton(
                      //                     child: Text('update'),
                      //                     onPressed: () {
                      //                       FirebaseFirestore.instance
                      //                           .collection('consumers')
                      //                           .doc(documentid)
                      //                           .update({
                      //                         'email': mailcontroller.text,
                      //                         'password': passwordcontroller.text
                      //                       }).then((value) {
                      //                         print('Field updated successfully');
                      //                       }).catchError((error) {
                      //                         print('Error updating field: $error');
                      //                       });

                      //                       changePasswordEmail(
                      //                           mailcontroller.text,
                      //                           passwordcontroller.text);
                      //                       // Navigator.pop(context);
                      //                       Navigator.push(
                      //                           context,
                      //                           MaterialPageRoute(
                      //                               builder: (context) =>
                      //                                   Login()));
                      //                     }),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       minimumSize: const Size(25, 50),
                      //       backgroundColor:
                      //           const Color.fromARGB(255, 255, 255, 0),
                      //       side: const BorderSide(color: Colors.black, width: 1),
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20)),
                      //     ),
                      //     child: const Text(
                      //       "Update",
                      //       style: TextStyle(
                      //         fontSize: 25,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:minnalmini/Page1.dart';
// import 'package:minnalmini/Page4.dart';

// class Page7 extends StatefulWidget {
//   const Page7({Key? key}) : super(key: key);

//   @override
//   State<Page7> createState() => _Page7State();
// }

// class _Page7State extends State<Page7> {
//   @override
//   Widget build(BuildContext context) {
//     void changePasswordEmail(String newEmail, String newPassword) async {
//       User? user = FirebaseAuth.instance.currentUser;

//       try {
//         await user?.updatePassword(newPassword);
//         await user?.updateEmail(newEmail);
//         print('Password changed successfully');
//       } catch (e) {
//         print('Error changing password: $e');
//       }
//     }

//     TextEditingController mailcontroller = TextEditingController();
//     TextEditingController passwordcontroller = TextEditingController();

//     User? user = FirebaseAuth.instance.currentUser;
//     String useremail = user!.email.toString();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             color: Color.fromARGB(255, 255, 255, 0),
//             fontSize: 30,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('consumers')
//             .where('email', isEqualTo: useremail)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           String? consumerno = snapshot.data?.docs[0].get('consumerNumber');
//           String? poleno = snapshot.data?.docs[0].get('poleNumber');
//           String? documentid = snapshot.data?.docs[0].id;

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Center(
//                       child: CircleAvatar(
//                         radius: 60,
//                         backgroundImage: AssetImage('images/user.png'),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Text(
//                         useremail,
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Center(
//                       child: Container(
//                         height: 250,
//                         width: 300,
//                         padding: const EdgeInsets.all(16.0),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(10.0),
//                           border: Border.all(color: Colors.black),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Text('C#          :',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 10),
//                                 Text(consumerno!,
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.normal)),
//                               ],
//                             ),
//                             Divider(color: Colors.black, thickness: 2),
//                             Row(
//                               children: [
//                                 Text('Pole       :',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 10),
//                                 Text(poleno!,
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.normal)),
//                               ],
//                             ),
//                             Divider(color: Colors.black, thickness: 2),
//                             Row(
//                               children: [
//                                 Text('Trans     :',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 10),
//                                 Text('1',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.normal)),
//                               ],
//                             ),
//                             Divider(color: Colors.black, thickness: 2),
//                             Row(
//                               children: [
//                                 Text('Tariff      :',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 10),
//                                 Text('LT-1 Dom',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.normal)),
//                               ],
//                             ),
//                             Divider(color: Colors.black, thickness: 2),
//                             Row(
//                               children: [
//                                 Text('Purpose :',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold)),
//                                 SizedBox(width: 10),
//                                 Text('Domestic',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.normal)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const SizedBox(height: 16),
//                     SingleChildScrollView(
//                       child: Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 title: Text('update profile'),
//                                 content: SizedBox(
//                                   height: 200,
//                                   width: 100,
//                                   child: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: TextField(
//                                             controller: mailcontroller,
//                                             decoration: InputDecoration(
//                                                 hintText: 'new mail',
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10))),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: TextField(
//                                             controller: passwordcontroller,
//                                             decoration: InputDecoration(
//                                                 hintText: 'new password',
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10))),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         TextButton(
//                                             child: Text('update'),
//                                             onPressed: () {
//                                               FirebaseFirestore.instance
//                                                   .collection('consumers')
//                                                   .doc(documentid)
//                                                   .update({
//                                                 'email': mailcontroller.text,
//                                                 'password':
//                                                     passwordcontroller.text
//                                               }).then((value) {
//                                                 print(
//                                                     'Field updated successfully');
//                                               }).catchError((error) {
//                                                 print(
//                                                     'Error updating field: $error');
//                                               });

//                                               changePasswordEmail(
//                                                   mailcontroller.text,
//                                                   passwordcontroller.text);
//                                               // Navigator.pop(context);
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           Login()));
//                                             }),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(25, 50),
//                             backgroundColor:
//                                 const Color.fromARGB(255, 255, 255, 0),
//                             side:
//                                 const BorderSide(color: Colors.black, width: 1),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           child: const Text(
//                             "EDIT",
//                             style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
