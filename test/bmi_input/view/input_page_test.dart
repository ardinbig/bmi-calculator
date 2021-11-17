import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:bmi_calculator/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Input page", () {
    testWidgets("renders five widgets ot type ReusableCard", (tester) async {
      await tester.pumpWidget(BMICalculator());
      expect(find.byType(ReusableCard), findsNWidgets(5));
    });

    testWidgets("renders one widget ot type BottomButton", (tester) async {
      await tester.pumpWidget(BMICalculator());
      expect(find.byType(BottomButton), findsNWidgets(1));
    });
  });
}
