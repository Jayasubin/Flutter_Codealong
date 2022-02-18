import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
            elevation: 2,
            centerTitle: true,
            title: Text(
              'Twin Dice',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            backgroundColor: Colors.green),
        body: DiceHome(),
      ),
    ),
  );
}

class DiceHome extends StatefulWidget {
  @override
  _DiceHomeState createState() => _DiceHomeState();
}

class _DiceHomeState extends State<DiceHome> {
  int leftDice = 1;
  int rightDice = 3;

  void rollBothDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child: Image.asset('images/dice$leftDice.png'),
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child: Image.asset('images/dice$rightDice.png'),
                  onPressed: () {
                    setState(() {
                      rightDice = Random().nextInt(6) + 1;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
              child: Text(
                'Roll both',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            onPressed: () {
              rollBothDice();
            },
          ),
        ),
      ],
    );
  }
}
