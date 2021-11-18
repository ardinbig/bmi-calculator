import 'package:bmi_calculator/app/bmi_calculator_app.dart';
import 'package:bmi_calculator/common/common.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
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

  group("Click on ReusableCard", () {
    const maleKey = const Key("inputPage_reusableCard_male");
    const femaleKey = const Key("inputPage_reusableCard_female");

    testWidgets("renders male selection", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(maleKey));
      await tester.pumpAndSettle();
      final widget = tester.widget(find.byKey(maleKey)) as ReusableCard;
      expect(widget.color, kActiveCardColor);
    });

    testWidgets("renders female selection", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(femaleKey));
      await tester.pumpAndSettle();
      final widget = tester.widget(find.byKey(femaleKey)) as ReusableCard;
      expect(widget.color, kActiveCardColor);
    });
  });

  group("Sliver", () {
    testWidgets("renders default value", (tester) async {
      final slider = find.byType(Slider);
      await tester.pumpWidget(BMICalculator());
      await tester.drag(slider, Offset(0.5, 0.0));
      expect(find.text("60"), findsOneWidget);
    });
  });

  group("Weight ReusableCard", () {
    const minusKey = const Key("inputPage_iconButton_weight_minus");
    const plusKey = const Key("inputPage_iconButton_weight_plus");

    testWidgets("renders default - 1, expect 59 ", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(minusKey));
      await tester.pumpAndSettle();
      expect(find.text("59"), findsOneWidget);
    });

    testWidgets("renders default + 1, expect 61 ", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(plusKey));
      await tester.pumpAndSettle();
      expect(find.text("61"), findsOneWidget);
    });
  });

  group("Age ReusableCard", () {
    const minusKey = const Key("inputPage_iconButton_age_minus");
    const plusKey = const Key("inputPage_iconButton_age_plus");

    testWidgets("renders default - 1, expect 18 ", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(minusKey));
      await tester.pumpAndSettle();
      expect(find.text("18"), findsOneWidget);
    });

    testWidgets("renders default + 1, expect 20 ", (tester) async {
      await tester.pumpWidget(BMICalculator());
      await tester.tap(find.byKey(plusKey));
      await tester.pumpAndSettle();
      expect(find.text("20"), findsOneWidget);
    });
  });
}
