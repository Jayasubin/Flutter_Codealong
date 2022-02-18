import '../components/bottom_button.dart';
import '../components/my_constants.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiHeadline;
  final String bmiDesc;
  final String bmiValue;
  final String bmiNormal;

  ResultPage({
    required this.bmiHeadline,
    required this.bmiDesc,
    required this.bmiValue,
    required this.bmiNormal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Result'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bmiHeadline.toUpperCase(),
                  style: kInfoStyle,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              cardColor: kInactiveCardColor,
              whenPressed: () {},
              cardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiDesc,
                    textAlign: TextAlign.center,
                    style: kBMITextStyle,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your BMI : ',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            bmiValue,
                            style: kButtonTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Normal : ',
                            style: kLabelTextStyle,
                          ),
                          Text(bmiNormal, style: kButtonTextStyle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomButton(
        label: 'Back to home',
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
