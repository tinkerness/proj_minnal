import 'package:flutter/material.dart';
import 'package:minnalmini/Page1.dart';
import 'package:minnalmini/Page11.dart';
import 'package:minnalmini/Page5.dart';
import 'package:minnalmini/Page8.dart';
import 'package:minnalmini/Page9.dart';
import 'package:minnalmini/Page7.dart';
import 'consumermodel.dart';

class Page6 extends StatelessWidget {
  final ConsumerModel consumer;
  // const Page6({super.key, Key? key_, required this.consumer});
  const Page6({Key? key, required this.consumer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MENU',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Home'),
                          textColor: Colors.black,
                          leading: const Icon(Icons.home),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page5(
                                        consumer: consumer,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Report Issue'),
                          textColor: Colors.black,
                          leading: const Icon(Icons.report),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page8(
                                        consumer: consumer,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('View Status'),
                          textColor: Colors.black,
                          leading: const Icon(Icons.remove_red_eye),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page9(
                                        consumer: consumer,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Notifications'),
                          textColor: Colors.black,
                          leading: const Icon(Icons.notifications),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page11(
                                        consumer: consumer,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Settings'),
                          textColor: Colors.black,
                          leading: const Icon(Icons.settings),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Page7(
                                        consumer: consumer,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'LOGOUT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: Colors.black,
                          leading: const Icon(Icons.logout),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                        ),
                      ],
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
