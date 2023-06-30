import 'package:flutter/material.dart';
import 'package:first/widgets/page3.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Stack(
        children:[
          
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
                      image: AssetImage('assets/minnal.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          
          
             
          
          
            const SizedBox(
              height: 20,
            ),
            const Text("CONSUMER VERIFICATION",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1),
                    color: const Color.fromARGB(255, 255, 255, 0)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'consumer number',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'phone number',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Verify()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 45),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("VERIFY",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20)
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
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
                   
                  ],
                ),
          ),
      ],),
    );
  }
}
