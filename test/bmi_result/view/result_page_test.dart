import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:bmi_calculator/bmi_input/view/input_page.dart';
import 'package:bmi_calculator/common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result page', () {
    const resultPageKey = Key('resultPage_bottomButton');
    const inputPageKey = Key('inputPage_bottomButton');

    testWidgets('should display your result title', (tester) async {
      await tester.pumpWidget(const BMICalculator());
      await tester.tap(find.byKey(inputPageKey));
      await tester.pumpAndSettle();
      expect(find.text('Your Result'), findsOneWidget);
    });

    testWidgets('renders one widget of type ReusableCard', (tester) async {
      await tester.pumpWidget(const BMICalculator());
      await tester.tap(find.byKey(inputPageKey));
      await tester.pumpAndSettle();
      expect(find.byType(ReusableCard), findsOneWidget);
    });

    testWidgets('renders one widget of type BottomButton', (tester) async {
      await tester.pumpWidget(const BMICalculator());
      await tester.tap(find.byKey(inputPageKey));
      await tester.pumpAndSettle();
      expect(find.byType(BottomButton), findsOneWidget);
    });

    testWidgets('returns on inputPage', (tester) async {
      await tester.pumpWidget(const BMICalculator());
      await tester.tap(find.byKey(inputPageKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(resultPageKey));
      await tester.pumpAndSettle();
      expect(find.byType(InputPage), findsOneWidget);
    });
  });
}
