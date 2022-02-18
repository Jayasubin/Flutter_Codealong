import '../components/bottom_button.dart';
import '../components/calculate_module.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_cards.dart';
import '../components/reusable_card.dart';
import '../components/reusable_content.dart';
import '../components/my_constants.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 170;
  int weight = 60;
  int age = 25;
  Gender selectedGender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fitness'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardContent:
                          ReusableContent(FontAwesomeIcons.mars, 'MALE'),
                      whenPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardContent:
                          ReusableContent(FontAwesomeIcons.venus, 'FEMALE'),
                      whenPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardColor: kActiveCardColor,
                cardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kInfoStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 110,
                      max: 220,
                      onChanged: (double newHeight) {
                        setState(
                          () {
                            height = newHeight.round();
                          },
                        );
                      },
                    ),
                  ],
                ),
                whenPressed: () {},
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardContent: BottomCardContent(
                        cardTitle: 'WEIGHT',
                        value: weight,
                        suffix: 'Kg',
                        whenMinusPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        whenPlusPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                      whenPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: kActiveCardColor,
                      cardContent: BottomCardContent(
                        cardTitle: 'AGE',
                        value: age,
                        suffix: 'Yrs',
                        whenMinusPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                        whenPlusPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                      whenPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomButton(
          label: 'Calculate BMI',
          onTap: () {
            CalcModule calc = CalcModule(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmiValue: calc.getBMI(),
                  bmiNormal: calc.getNormalBMI(),
                  bmiHeadline: calc.getHeadline(),
                  bmiDesc: calc.getDescription(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
