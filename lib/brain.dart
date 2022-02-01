import 'dart:math';

class Brain {
  Brain({this.wt, this.ht});

  final int? wt;
  final int? ht;
  double _bmi = 0;

  String CalculateBMI() {
    double _bmi = wt! / pow(ht! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Results() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String Remark() {
    return _bmi >= 25
        ? 'You have higher than normal body weight, start doing exercise.'
        : _bmi > 18.5
            ? 'You have normal bogy weight, GOOD JOB!!'
            : 'You have lower than normal bogy weight, start eating more.';
  }
}
//'You have higher than normal body weight, start doing exercise.'
//'You have normal bogy weight, GOOD JOB!!'
//'You have lower than normal bogy weight, start eating more.'
