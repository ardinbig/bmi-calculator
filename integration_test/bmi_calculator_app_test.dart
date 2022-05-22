import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'bmi_calculator_app.dart' as app;
import 'screenshots_helper.dart';

Future<void> main() async {
  late IntegrationTestWidgetsFlutterBinding binding;

  setUpAll(() async {
    binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      ..framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  });

  group('End-to-end test', () {
    testWidgets('Initial value should appeared', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();
      expect(find.text('180'), findsOneWidget);
      expect(find.text('60'), findsOneWidget);
      expect(find.text('19'), findsOneWidget);
      // tester
      //   ..widget(find.byKey(const Key('inputPage_text_height')))
      //   ..widget(find.byKey(const Key('inputPage_text_weight')))
      //   ..widget(find.byKey(const Key('inputPage_text_age')));
      // await tester.waitFor(find.text('180'));
      // await tester.waitFor(find.text('60'));
      // await tester.waitFor(find.text('19'));
      takeScreenshot(
        tester: tester,
        binding: binding,
        name: 'input-page',
      );
      // await binding.takeScreenshot('input-page');
    });

    // testWidgets('Calculating BMI with initial value',
    //     (WidgetTester tester) async {
    //   await tester.tap(find.byType(BottomButton));
    //   tester
    //     // ..widget(find.text('NORMAL'))
    //     ..widget(find.byKey(const Key('resultPage_text')))
    //     // ..widget(find.text('18.5'))
    //     ..widget(
    //       find.text('You have a normal body weight. Good job !'),
    //     );
    //   await binding.takeScreenshot('result-page');
    // });
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
