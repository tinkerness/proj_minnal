import 'package:flutter/material.dart';
import 'package:minnalmini/Page11.dart';
import 'package:minnalmini/Page6.dart';
import 'package:minnalmini/Page8.dart';

import 'Page9.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 0),
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page6()),
                      );},
            icon: Icon(
              Icons.menu,
              color: Color.fromARGB(255, 255, 255, 0),
              size: 30,
            ),
          ),
        ],
      ),
      
         body:Center(
          child: Stack(
            children:[ Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                // const SizedBox(
                //     height: 0,
                //   ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Page8()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(258, 150),
                  backgroundColor:  Color.fromARGB(255, 255, 255, 0),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Report \n Issue",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
          
              const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Page9()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(258, 150),
                      backgroundColor: Color.fromARGB(255, 255, 255, 0),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("View \n Status",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
          
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Page11()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(258, 150),
                      backgroundColor: Color.fromARGB(255, 255, 255, 0),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Notification",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
          
                 
              ]
              
            ),
          ]),
        )

    );
  }
}


