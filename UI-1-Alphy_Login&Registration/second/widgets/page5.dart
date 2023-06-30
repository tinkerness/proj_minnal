import 'package:flutter/material.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 103,
          title: const Column(
            children: [
              Text(
                'Welcome',
                  style: TextStyle(
                      fontSize: 32,
                      
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 255, 255, 0),)
              ),

               Text('KSEB Pala',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 255, 255, 0),
                  )),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
           
          ], //right side of title
          
          elevation: 10, //shadow
        ),
        

        body:Center(
          child: Stack(
            children:[ Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const SizedBox(
                    height: 40,
                  ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(258, 100),
                  backgroundColor:  const Color.fromARGB(255, 255, 255, 0),
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Notification",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
          
              const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(258, 100),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 0),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Send Alert Messages",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
          
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(258, 100),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 0),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Poles",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
          
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(258, 100),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 0),
                      side: const BorderSide(color: Colors.black, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text("Set Status",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
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
                        )),
                  ),
              ]
              
            ),
          ]),
        )
         
         
         
      
    );
  }
}

        
   
