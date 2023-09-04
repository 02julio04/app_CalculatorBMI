import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = 0;

  Map<double, String> thresholds = {
    40: 'Muy Obeso',
    25.0: 'SobrePeso',
    18.5: 'Promedio',
    0: 'Por abajo del promedio'
  };

  Map<double, String> interpretations = {
    40: 'WAOOOOOO Estas muy gordoooo',
    25.0: 'Tienes que comer menos',
    18.5: 'Tienes un peso promedio',
    0: 'Tienes que comer mas'
  };

  CalculatorBrain({required this.height, required this.weight});

  void calculateBMI() {
    _bmi = _bmiCalculator(weight, height);
  }

  String getBMI() {
    calculateBMI();

    return _bmi.toStringAsFixed(1);
  }

  double _bmiCalculator(int weight, int height) {
    double heightInMeters = height / 100.0;
    num heightSquared = pow(heightInMeters, 2);

    double bmi = weight / heightSquared;

    return bmi;
  }

  String getResult() {
    String result = thresholds.entries
        .firstWhere((entry) => _bmi >= entry.key,
        orElse: () => thresholds.entries.last)
        .value;

    return result;
  }

  String getInterpretation() {
    String interpretation = interpretations.entries
        .firstWhere((entry) => _bmi >= entry.key,
        orElse: () => thresholds.entries.last)
        .value;

    return interpretation;
  }
}