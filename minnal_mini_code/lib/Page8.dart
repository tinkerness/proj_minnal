import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Page6.dart';

class Page8 extends StatefulWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  String? selectedType;
  final TextEditingController textFieldController = TextEditingController();
  TextEditingController poleNumberController = TextEditingController();
  bool checkBoxValue = false;
  String poleNumber = '';
  String? myPoleno;
  String? consumerNumber;
  CollectionReference complaintRef =
      FirebaseFirestore.instance.collection('Complaints');
  String imageUrl = '';
  XFile? file;

  @override
  void dispose() {
    textFieldController.dispose();
    poleNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      Future<void> getAccess() async {
    final access = await [Permission.camera, Permission.storage].request();
    final cameraStatus = access[Permission.camera];
    final storageStatus = access[Permission.storage];
    if (storageStatus != PermissionStatus.granted ||
        cameraStatus != PermissionStatus.granted) {
        print('error');
    }

  }


    final dateTime = DateTime.now();

    final complaintType = selectedType;
    final complaintDesc = textFieldController.text;
    CollectionReference consumerRef =
        FirebaseFirestore.instance.collection('consumers');
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? userEmail;

    if (user != null) {
      userEmail = user.email;
    }

    consumerRef.where('email', isEqualTo: userEmail).get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          consumerNumber = snapshot.docs[0]['consumerNumber'];
          if (checkBoxValue) {
            myPoleno = snapshot.docs[0]['poleNumber'];
          } else {
            myPoleno = null;
          }
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'REPORT ISSUE',
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
                MaterialPageRoute(builder: (context) => const Page6()),
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Complaint type",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedType = newValue;
                      });
                    },
                    items: <String>[
                      'Voltage related',
                      'Meter related',
                      'No power supply',
                      'Pole related',
                      'Transformer related',
                      'Frequent interruption',
                      'Line related',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Type your Complaint here",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(
                      labelText: 'Type here',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () async {

                        getAccess();

                        ImagePicker imagePicker = ImagePicker();
                         file = await imagePicker.pickImage(
                            source: ImageSource.camera);

        

                        if (file == null) return;
                      },
                      icon: const Icon(Icons.upload,
                          color: Color.fromARGB(255, 255, 255, 0)),
                      label: const Text(
                        'Upload',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 0),
                            fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: const Size(150, 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        "Is the location yours?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checkBoxValue = newValue ?? false;

                            if (checkBoxValue) {
                              consumerRef
                                  .where('email', isEqualTo: userEmail)
                                  .get()
                                  .then((snapshot) {
                                if (snapshot.docs.isNotEmpty) {
                                  setState(() {
                                    myPoleno = snapshot.docs[0]['poleNumber'];
                                  });
                                }
                              });
                            } else {
                              myPoleno = null;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Else, enter Pole no:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    enabled: !checkBoxValue,
                    controller: poleNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Pole no',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        String uniqueFileName =
                            DateTime.now().millisecondsSinceEpoch.toString();

                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('images');

                        Reference referenceImageToUpload =
                            referenceDirImages.child(uniqueFileName);

                        await referenceImageToUpload.putFile(File(file!.path));
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                        if (imageUrl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please upload an image')),
                          );
                          return;
                        }

                        complaintRef.add({
                          'complaintType': complaintType,
                          'complaintDesc': complaintDesc,
                          'dateTime': dateTime,
                          'consumerNumber': consumerNumber,
                          'poleNumber': myPoleno ?? poleNumberController.text,
                          'imageUrl': imageUrl,
                        }).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Complaint added')),
                          );
                          Navigator.pop(context);
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to add complaint')),
                          );
                          print('Error adding complaint: $error');
                        });
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
