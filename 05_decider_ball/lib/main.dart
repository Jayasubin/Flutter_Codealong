import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DeciderApp());
}

class DeciderApp extends StatefulWidget {
  @override
  _DeciderAppState createState() => _DeciderAppState();
}

class _DeciderAppState extends State<DeciderApp> {
  int decisionNumber = 5;
  int disturbedCounter = 0;

  void makeDecision() {
    setState(() {
      decisionNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('The Ball with Answers'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Press the Button below the ball to get a Response',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  decisionNumber = 8;
                });
              },
              child: Image.asset('images/ball$decisionNumber.png'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey)),
                onPressed: () {
                  makeDecision();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Ask Me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
