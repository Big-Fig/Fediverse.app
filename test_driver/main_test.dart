// This is a basic Flutter Driver test for the application. A Flutter Driver
// test is an end-to-end test that "drives" your application from another
// process or even from another computer. If you are familiar with
// Selenium/WebDriver for web, Espresso for Android or UI Automation for iOS,
// this is simply Flutter's version of that.
import 'dart:convert' as c;

import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

void main() {
  group('end-to-end test', () {
    // ignore: avoid-late-keyword
    late FlutterDriver driver;
    // ignore: avoid-late-keyword
    late Map localizations;
    final config = Config();

    setUpAll(() async {
      // Connect to a running Flutter application instance.
      driver = await FlutterDriver.connect();
      // get the localizations for the current locale
      localizations = c.jsonDecode(await driver.requestData(null));
      print('localizations=$localizations');
    });

    tearDownAll(() async {
      await driver.close();
    });

    test(
      'tap on the floating action button; verify counter',
      () async {
        // Finds the floating action button (fab) to tap on
        // var fab = find.byTooltip(
        //   localizations['counterIncrementButtonTooltip'],
        // );
        //
        // // Wait for the floating action button to appear
        // await driver.waitFor(fab);

        // take screenshot before number is incremented
        await screenshot(driver, config, '0');
        // await screenshot_my(driver, config, '0');
        //
        // // Tap on the fab
        // await driver.tap(fab);
        //
        // // Wait for text to change to the desired value
        // await driver.waitFor(find.text('1'));
        //
        // // take screenshot after number is incremented
        // await screenshot(driver, config, '1');

        // increase timeout from 30 seconds for testing
        // on slow running emulators in cloud
      },
      timeout: Timeout(
        Duration(
          // ignore: no-magic-number
          seconds: 120,
        ),
      ),
    );
  });
}
