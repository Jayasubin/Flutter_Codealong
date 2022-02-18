import 'dart:math';

class CalcModule {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalcModule({required this.height, required this.weight});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getHeadline() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi <= 18.5) {
      return 'UnderWeight';
    } else {
      return 'Normal';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You are too heavy\nstart exercising!';
    } else if (_bmi <= 18.5) {
      return 'Don\'t starve yourself to death\nEat more food';
    } else {
      return 'You\'re doing good!\nKeep it up';
    }
  }

  String getNormalBMI() {
    return '18.5 - 25';
  }
}
