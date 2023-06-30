import 'package:flutter/material.dart';
import 'package:first/widgets/page2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SingleChildScrollView(
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
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  "CONSUMER",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Container(
                height: 220,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                  color: const Color.fromARGB(255, 255, 255, 0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 45),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Consumer",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 45),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Board",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Or",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 0),
                    minimumSize: const Size(270, 60),
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text("Register",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
