import 'package:bmi_calculator/utils/calculator_brain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculatorBrain calculatorBrain;

  setUp(() {
    const height = 180;
    const weight = 60;
    calculatorBrain = CalculatorBrain(height: height, weight: weight);
  });

  group('Calculator Brain', () {
    test('BMI value should start by 18.5', () {
      expect(calculatorBrain.calculateBMI(), '18.5');
    });

    group('Get Result', () {
      test('should get Normal bmi', () {
        calculatorBrain.calculateBMI();
        expect(calculatorBrain.getResult(), 'Normal');
      });

      test('should get Overweight bmi', () {
        calculatorBrain = CalculatorBrain(height: 170, weight: 96)
          ..calculateBMI();
        expect(calculatorBrain.getResult(), 'Overweight');
      });

      test('should get Underweight bmi', () {
        calculatorBrain = CalculatorBrain(height: 184, weight: 58)
          ..calculateBMI();
        expect(calculatorBrain.getResult(), 'Underweight');
      });
    });

    group('Get Interpretation', () {
      test('should get normal bmi', () {
        calculatorBrain.calculateBMI();
        expect(
          calculatorBrain.getInterpretation(),
          'You have a normal body weight. Good job !',
        );
      });

      test('should get higher than normal bmi', () {
        calculatorBrain = CalculatorBrain(height: 170, weight: 96)
          ..calculateBMI();
        expect(
          calculatorBrain.getInterpretation(),
          'You have a higher than normal body weight. Try to exercise more.',
        );
      });

      test('should get lower than normal bmi', () {
        calculatorBrain = CalculatorBrain(height: 184, weight: 58)
          ..calculateBMI();
        expect(
          calculatorBrain.getInterpretation(),
          'You have a lower than normal body weight. You can eat a bit more.',
        );
      });
    });
  });
}
