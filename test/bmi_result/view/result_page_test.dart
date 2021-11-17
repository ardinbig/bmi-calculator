import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:bmi_calculator/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Result page", () {
    testWidgets("should display your result title", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byType(BottomButton));
      await tester.pumpAndSettle();
      expect(find.text("Your Result"), findsOneWidget);
    });

    testWidgets("renders one widget of type ReusableCard", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byType(BottomButton));
      await tester.pumpAndSettle();
      expect(find.byType(ReusableCard), findsOneWidget);
    });

    testWidgets("renders one widget of type BottomButton", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byType(BottomButton));
      await tester.pumpAndSettle();
      expect(find.byType(BottomButton), findsOneWidget);
    });
  });
}
