import 'package:flutter/material.dart';

class OutputCard extends StatelessWidget {
  const OutputCard({
    Key? key,
    required this.currentCrypto,
    required this.exchangeRate,
    required this.currentFiat,
  }) : super(key: key);

  final String currentCrypto;
  final String exchangeRate;
  final String currentFiat;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $currentCrypto = $exchangeRate $currentFiat',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
