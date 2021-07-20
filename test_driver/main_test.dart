// This is a basic Flutter Driver test for the application. A Flutter Driver
// test is an end-to-end test that "drives" your application from another
// process or even from another computer. If you are familiar with
// Selenium/WebDriver for web, Espresso for Android or UI Automation for iOS,
// this is simply Flutter's version of that.
import 'dart:convert' as c;

import 'package:fedi/app/auth/instance/join/from_scratch/from_scratch_join_auth_instance_page_keys.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_widget_keys.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page_keys.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_page_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button_keys.dart';
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

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test(
      'Screenshots: Login, SignUp, InstanceDetails',
      () async {
        await driver.waitFor(
          find.byValueKey(
            FromScratchJoinAuthInstancePageKeys.joinAuthInstanceWidgetKey,
          ),
        );

        await screenshot(driver, config, 'Login');

        var hostTextField = find.byValueKey(
          JoinAuthInstanceWidgetKeys.hostTextFieldKey,
        );
        await driver.tap(hostTextField);

        await driver.enterText('mastodon.social');

        var exploreAsGuestButton = find.byValueKey(
          JoinAuthInstanceWidgetKeys.exploreAsGuestButtonKey,
        );

        await driver.waitFor(exploreAsGuestButton);
        await driver.tap(exploreAsGuestButton);

        await driver.waitFor(
          find.byValueKey(
            RemoteInstanceDetailsPageKeys.instanceDetailsWidgetKey,
          ),
        );

        await screenshot(driver, config, 'InstanceDetails');

        await driver.tap(
          find.byValueKey(
            FediBackIconButtonKeys.button,
          ),
        );

        await driver.waitFor(
          find.byValueKey(
            FromScratchJoinAuthInstancePageKeys.joinAuthInstanceWidgetKey,
          ),
        );

        await driver.tap(
          find.byValueKey(
            JoinAuthInstanceWidgetKeys.signUpButtonKey,
          ),
        );

        await driver.waitFor(
          find.byValueKey(
            RegisterAuthInstancePageKeys.registerAuthInstanceWidgetKey,
          ),
        );

        await screenshot(driver, config, 'SignUp');

        await driver.tap(
          find.byValueKey(
            FediDismissIconButtonKeys.button,
          ),
        );
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
