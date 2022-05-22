import 'dart:io';

import 'package:bmi_calculator/main.dart' as bmi_calculator;
import 'package:flutter/foundation.dart';
import 'package:flutter_driver/flutter_driver.dart' as d;
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  bmi_calculator.main();
  final driver = await d.FlutterDriver.connect();
  try {
    await integrationDriver(
      driver: driver,
      onScreenshot: (String fileName, List<int> screenshotBytes) async {
        final image = File('../screenshots/$fileName.png');
        if (image.existsSync()) await image.delete(recursive: true);
        await image.create(recursive: true);
        image.writeAsBytesSync(screenshotBytes);
        debugPrint("Screenshot with the name '$fileName' was taken");
        return true;
      },
    );
  } catch (e) {
    debugPrint('Error occurred: $e');
  }
}
