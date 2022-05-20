import 'dart:io';

import 'package:bmi_calculator/common/bottom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final binding = IntegrationTestWidgetsFlutterBinding();
  /* late FlutterDriver? driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver?.close();
  }); */

  try {
    await integrationDriver(
      onScreenshot: (String fileName, List<int> screenshotBytes) async {
        final image = File('screenshots/$fileName.png');
        await image.create(recursive: true);
        image.writeAsBytesSync(screenshotBytes);
        debugPrint("Screenshot with the name '$fileName' was taken");
        return true;
      },
    );
  } catch (e) {
    debugPrint('Error occurred: $e');
  }

  group('End-to-end test', () {
    testWidgets('Initial value should appeared', (WidgetTester tester) async {
      await tester.pumpAndSettle();
      tester
        ..widget(find.byKey(const Key('inputPage_text_height')))
        ..widget(find.byKey(const Key('inputPage_text_weight')))
        ..widget(find.byKey(const Key('inputPage_text_age')));
      // await tester.waitFor(find.text('180'));
      // await tester.waitFor(find.text('60'));
      // await tester.waitFor(find.text('19'));
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
      await binding.takeScreenshot('input_page');
    });

    testWidgets('Calculating BMI with initial value',
        (WidgetTester tester) async {
      await tester.tap(find.byType(BottomButton));
      tester
        // ..widget(find.text('NORMAL'))
        ..widget(find.byKey(const Key('resultPage_text')))
        // ..widget(find.text('18.5'))
        ..widget(
          find.text('You have a normal body weight. Good job !'),
        );
      await binding.takeScreenshot('result_page');
    });
  });
}

// extension on FlutterDriver {
//   Future<void> tackScreenshot(String fileName) async {
//     final filePath = File('screenshots/$fileName.png');
//     if (filePath.existsSync()) await filePath.delete(recursive: true);
//     final file = await filePath.create(recursive: true);
//     final png = await screenshot();
//     file.writeAsBytesSync(png);
//     debugPrint("Screenshot with the name '$fileName' was taken");
//   }
// }
