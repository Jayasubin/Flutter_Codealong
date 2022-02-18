import 'package:flutter/material.dart';

import '/components/flash_button.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenID = 'welcome_Screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController cont;

  @override
  void initState() {
    super.initState();
    cont = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    cont.forward();
    cont.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(cont.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 50.0,
                  ),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            FlashButton(
              action: () {
                Navigator.popAndPushNamed(context, LoginScreen.screenID);
              },
              buttonColor: Colors.blueAccent,
              buttonTitle: 'Login',
            ),
            FlashButton(
              action: () {
                Navigator.popAndPushNamed(context, RegistrationScreen.screenID);
              },
              buttonColor: Colors.lightBlueAccent,
              buttonTitle: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
