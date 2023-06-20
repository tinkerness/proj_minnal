import 'package:flutter/material.dart';
import 'package:minnalmini/Page1.dart';
import 'package:minnalmini/Page11.dart';
import 'package:minnalmini/Page4.dart';
import 'package:minnalmini/Page5.dart';
import 'package:minnalmini/Page8.dart';
import 'package:minnalmini/Page9.dart';

import 'Page7.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                          title: Text('Home'),
                          textColor: Colors.black,
                          leading: Icon(Icons.home),
                          iconColor: Colors.black,
                          onTap: () {
                             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page5()),
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
                          title: Text('Report Issue'),
                          textColor: Colors.black,
                          leading: Icon(Icons.report),
                          iconColor: Colors.black,
                          onTap: () {
                             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page8()),
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
                          title: Text('View Status'),
                          textColor: Colors.black,
                          leading: Icon(Icons.remove_red_eye),
                          iconColor: Colors.black,
                          onTap: () {
                             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page9()),
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
                          title: Text('Notifications'),
                          textColor: Colors.black,
                          leading: Icon(Icons.notifications),
                          iconColor: Colors.black,
                          onTap: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page11()),
                      );},
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
                          title: Text('Settings'),
                          textColor: Colors.black,
                          leading: Icon(Icons.settings),
                          iconColor: Colors.black,
                          onTap: () {
                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page7()),
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
                    color: Color.fromARGB(255, 255, 255, 0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('LOGOUT',style: TextStyle(fontWeight: FontWeight.bold),),
                          textColor: Colors.black,
                          leading: Icon(Icons.logout),
                          iconColor: Colors.black,
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>Login(),
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
