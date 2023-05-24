import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choice Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChoiceScreen(),
    );
  }
}

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  int option1Count = 0;
  int option2Count = 0;
  int option3Count = 0;
  int option4Count = 0;

  void incrementCount(int option) {
    setState(() {
      if (option == 1) {
        option1Count++;
      } else if (option == 2) {
        option2Count++;
      } else if (option == 3) {
        option3Count++;
      } else if (option == 4) {
        option4Count++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POLES'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 55, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Pole :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ChoiceButton(
              count: option1Count,
              label: 'P1',
              onPressed: () => incrementCount(1),
            ),
            SizedBox(height: 16),
            ChoiceButton(
              count: option2Count,
              label: 'P2',
              onPressed: () => incrementCount(2),
            ),
            SizedBox(height: 16),
            ChoiceButton(
              count: option3Count,
              label: 'P3',
              onPressed: () => incrementCount(3),
            ),
            SizedBox(height: 16),
            ChoiceButton(
              count: option4Count,
              label: 'P4',
              onPressed: () => incrementCount(4),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final int count;
  final String label;
  final VoidCallback onPressed;

  const ChoiceButton({
    Key? key,
    this.count = 0,
    this.label = '',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
