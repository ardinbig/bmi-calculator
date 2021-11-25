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
  });

  test("Calculating BMI with inital value", () async {
    await driver!.tap(find.byType("BottomButton"));
    await driver!.waitFor(find.text("NORMAL"));
    await driver!.waitFor(find.text("18.5"));
    await driver!.waitFor(find.text("You have a normal body weight. Good job !"));
  });
}
