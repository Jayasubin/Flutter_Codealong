import 'package:flutter/material.dart';
import 'exchange_screen.dart';

void main() => runApp(const CryptoTrackerApp());

class CryptoTrackerApp extends StatelessWidget {
  const CryptoTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Colors.blue),
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white70),
      home: const PriceScreen(),
    );
  }
}
