import 'package:flutter/material.dart';
import 'package:my_flash_chat/screens/registration_screen.dart';
import '/components/flash_button.dart';
import '/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String screenID = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String username;
  late String password;
  bool loadingAnimation = false;

  final _authProvider = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loadingAnimation,
        color: Colors.black,
        opacity: 0.5,
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
                      //Do something with the user input.
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
                        var existingUser =
                            await _authProvider.signInWithEmailAndPassword(
                                email: username, password: password);
                        if (existingUser != null) {
                          Navigator.popAndPushNamed(
                              context, ChatScreen.screenID);
                        }
                        setState(() {
                          loadingAnimation = false;
                          //dispose();
                        });
                      } catch (e) {
                        rethrow;
                      }
                    },
                    buttonColor: Colors.blueAccent,
                    buttonTitle: 'Login',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                  ),
                  FlashButton(
                    buttonColor: Colors.lightBlueAccent,
                    buttonTitle: 'Register yourself',
                    action: () {
                      Navigator.popAndPushNamed(
                        context,
                        RegistrationScreen.screenID,
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
