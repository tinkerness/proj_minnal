import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
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
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 255, 0),
                size: 30,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            ClickableContainer(
              color: Colors.red,
              message: 'Container 1 clicked!',
            ),
            ClickableContainer(
              color: Colors.green,
              message: 'Container 2 clicked!',
            ),
            ClickableContainer(
              color: Colors.blue,
              message: 'Container 3 clicked!',
            ),
          ],
        ),
      ),
    );
  }
}

class ClickableContainer extends StatelessWidget {
  final Color color;
  final String message;

  const ClickableContainer({
    required this.color,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle container click event
        print(message);
      },
      child: Container(
        width: 200,
        height: 200,
        color: color,
        child: Center(
          child: Text(
            'Click Me',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
