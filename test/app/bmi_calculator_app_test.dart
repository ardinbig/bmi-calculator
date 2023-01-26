import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:bmi_calculator/bmi_input/view/input_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders InputPage', (tester) async {
      await tester.pumpWidget(const BMICalculator());
      expect(find.byType(InputPage), findsOneWidget);
    });

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
  });
}
