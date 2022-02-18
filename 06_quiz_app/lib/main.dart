import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizStorage quizStorage = QuizStorage();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> choices = [];

  void checkAnswer(bool userAnswer) {
    bool rightAnswer = quizStorage.getAnswer();
    if (rightAnswer == userAnswer) {
      choices.add(const Icon(Icons.check, color: Colors.green));
    } else {
      choices.add(const Icon(Icons.close, color: Colors.red));
    }

    bool isFinished = quizStorage.checkFinished();
    if (isFinished == true) {
      setState(() {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Quiz Completed",
          desc: "You've reached the end of the quiz",
          buttons: [
            DialogButton(
                color: Colors.black,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                width: 120,
                onPressed: () {
                  setState(() {
                    quizStorage.resetQuestionNumber();
                    choices.clear();
                  });
                  Navigator.pop(context);
                })
          ],
        ).show();
      });
    } else {
      setState(() {
        quizStorage.incrementQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizStorage.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: choices,
          ),
        ),
      ],
    );
  }
}
