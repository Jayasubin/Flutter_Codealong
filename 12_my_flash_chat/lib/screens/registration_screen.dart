import 'package:flutter/material.dart';
import '/components/flash_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String screenID = 'registration_Screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String username;
  late String password;

  final _authProvider = FirebaseAuth.instance;

  bool loadingAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loadingAnimation,
        opacity: 0.5,
        color: Colors.black,
        progressIndicator: const CircularProgressIndicator(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: kFlashTextBoxDecor.copyWith(
                        hintText: 'Enter your e-mail'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: kFlashTextBoxDecor.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  FlashButton(
                    action: () async {
                      setState(() {
                        loadingAnimation = true;
                      });

                      try {
                        final newUser =
                            await _authProvider.createUserWithEmailAndPassword(
                                email: username, password: password);

                        if (newUser != null) {
                          Navigator.popAndPushNamed(
                              context, ChatScreen.screenID);
                        }

                        setState(() {
                          loadingAnimation = false;
                        });
                      } catch (e) {
                        rethrow;
                      }
                    },
                    buttonColor: Colors.lightBlueAccent,
                    buttonTitle: 'Register',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                  ),
                  FlashButton(
                    buttonColor: Colors.blueAccent,
                    buttonTitle: 'Goto Login Screen',
                    action: () {
                      Navigator.popAndPushNamed(
                        context,
                        LoginScreen.screenID,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
