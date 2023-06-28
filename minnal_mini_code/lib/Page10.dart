import 'package:flutter/material.dart';
import 'package:minnalmini/complaintmodel.dart';

class Page10 extends StatefulWidget {
  final ComplaintModel complaint;
  const Page10({Key? key, required this.complaint}) : super(key: key);

  @override
  State<Page10> createState() => _Page10State();
}

class _Page10State extends State<Page10> {
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
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 0),
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 320,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "DATE :",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.complaint.dateTime != null
                              ? "${widget.complaint.dateTime?.day} - ${widget.complaint.dateTime?.month} - ${widget.complaint.dateTime?.year}  ${widget.complaint.dateTime?.hour} : ${widget.complaint.dateTime?.minute} : ${widget.complaint.dateTime?.second}"
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
                      endIndent: 210,
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
                      height: 4,
                      thickness: 2,
                      indent: 0,
                      endIndent: 190,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.complaint.complaintType ?? "Nill",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
                      endIndent: 200,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.complaint.status ?? "Nill",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
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
                      endIndent: 170,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.complaint.comments ?? "Nill",
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
