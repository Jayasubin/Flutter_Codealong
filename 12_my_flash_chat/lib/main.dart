import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      initialRoute: WelcomeScreen.screenID,
      routes: {
        WelcomeScreen.screenID: (context) => const WelcomeScreen(),
        RegistrationScreen.screenID: (context) => const RegistrationScreen(),
        LoginScreen.screenID: (context) => const LoginScreen(),
        ChatScreen.screenID: (context) => const ChatScreen(),
      },
    );
  }
}
