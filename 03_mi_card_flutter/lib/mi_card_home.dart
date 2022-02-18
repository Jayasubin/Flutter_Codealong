import 'package:flutter/material.dart';

class MiCardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/subin.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Jayasubin J',
                  style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    //fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Flutter developer',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.8,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              SizedBox(
                height: 30,
                width: 300,
                child: Divider(
                  color: Colors.cyanAccent,
                ),
              ),
              Card(
                color: Colors.cyanAccent[700],
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android_outlined,
                    color: Colors.cyan[900],
                  ),
                  title: Text(
                    '+91 9798979897',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.cyanAccent[700],
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.mail_outline_rounded,
                    color: Colors.cyan[900],
                  ),
                  title: Text(
                    'jayasubin@gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
