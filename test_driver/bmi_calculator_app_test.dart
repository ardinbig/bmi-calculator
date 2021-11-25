import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver? driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver?.close();
  });

  test("Initial value should appeared", () async {
    await driver!.waitFor(find.text("180"));
    await driver!.waitFor(find.text("60"));
    await driver!.waitFor(find.text("19"));
    await driver!.tackScreenshot("input_page");
  });

  test("Calculating BMI with inital value", () async {
    await driver!.tap(find.byType("BottomButton"));
    await driver!.waitFor(find.text("NORMAL"));
    await driver!.waitFor(find.text("18.5"));
    await driver!.waitFor(
      find.text("You have a normal body weight. Good job !"),
    );
    await driver!.tackScreenshot("result_page");
  });
}

extension on FlutterDriver {
  Future<void> tackScreenshot(String fileName) async {
    final filePath = File("screenshots/$fileName.png");
    if (await filePath.exists()) await filePath.delete(recursive: true);
    final file = await filePath.create(recursive: true);
    final png = await screenshot();
    file.writeAsBytesSync(png);
    print("Screenshot with the name '$fileName' was taken");
  }
}
