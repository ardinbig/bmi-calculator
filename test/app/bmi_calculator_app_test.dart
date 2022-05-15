import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Matches golden file',
    (tester) async {
      await tester.pumpWidget(const BMICalculator());
      await expectLater(
        find.byType(BMICalculator),
        matchesGoldenFile('golden/bmi_calculator_app.png'),
      );
    },
    tags: 'no-ci',
  );
}
