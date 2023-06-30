import 'package:flutter/material.dart';
class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
      children: [ SingleChildScrollView(
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
            const Text("WELCOME <username>",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 550,
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
                        padding: EdgeInsets.all(6.0),
                        child: TextField( 
                          
                          decoration: InputDecoration( 
                            labelText: 'enter email',
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
      
      
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'enter password',
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      
      
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'pole number',
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      
      
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'address',
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
                      
      
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '',
                            contentPadding: EdgeInsets.symmetric(vertical: 20),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ),
      
                      const SizedBox(
                          height: 20,
                        ),
                      
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 45),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text("REGISTER",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                     

                     const SizedBox(
                          height: 20,
                        ),
                     
                    ]),
              ),
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
      ),],
      )
    );
  }
}

  

