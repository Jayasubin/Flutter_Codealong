import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import './components/my_constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
          thumbColor: Colors.cyan,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 25.0),
          overlayColor: Colors.cyan.withOpacity(0.2),
          activeTrackColor: Colors.white70,
          inactiveTrackColor: Colors.blueGrey,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kAppbarColor,
          secondary: kAppbarColor,
        ),
      ),
      home: InputPage(),
    );
  }
}
