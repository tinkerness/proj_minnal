import 'package:flutter/material.dart';

class Page10 extends StatefulWidget {
  const Page10({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.all(20.0),
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
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        Text(
                          "DATE :",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 90),
                        Text(
                          " 12/05/23",
                          style: TextStyle(
                              fontSize: 20,
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
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    const Text(
                      "Pole leaning",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    const Text(
                      "Not Resolved",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    const Text(
                      "Processing",
                      style: TextStyle(fontSize: 20, color: Colors.black),
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
