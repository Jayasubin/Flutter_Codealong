import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MusicalApp());
}

class MusicalApp extends StatelessWidget {
  final myPlayer = AudioCache();

  Expanded buildKey({color, noteNumber, keyName}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          primary: Colors.white,
        ),
        onPressed: () => {myPlayer.play('note$noteNumber.wav')},
        child: Text(keyName),
      ),
    );
  }

  //const MusicalApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, noteNumber: 7, keyName: 'B'),
              buildKey(
                  color: Colors.deepOrangeAccent, noteNumber: 6, keyName: 'A'),
              buildKey(color: Colors.amber, noteNumber: 5, keyName: 'G'),
              buildKey(color: Colors.yellow, noteNumber: 4, keyName: 'F'),
              buildKey(color: Colors.lightGreen, noteNumber: 3, keyName: 'E'),
              buildKey(color: Colors.green, noteNumber: 2, keyName: 'D'),
              buildKey(color: Colors.blueGrey, noteNumber: 1, keyName: 'C'),
            ],
          ),
        ),
      ),
    );
  }
}
