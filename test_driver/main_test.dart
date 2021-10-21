// This is a basic Flutter Driver test for the application. A Flutter Driver
// test is an end-to-end test that "drives" your application from another
// process or even from another computer. If you are familiar with
// Selenium/WebDriver for web, Espresso for Android or UI Automation for iOS,
// this is simply Flutter's version of that.

import 'package:fedi/app/access/join/from_scratch/from_scratch_join_access_page_keys.dart';
import 'package:fedi/app/access/join/join_access_widget_keys.dart';
import 'package:fedi/app/access/register/register_access_page_keys.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget_keys.dart';
import 'package:fedi/app/home/home_page_keys.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page_keys.dart';
import 'package:fedi/app/home/tab/account/menu/account_home_tab_menu_dialog_keys.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_page_keys.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_page_keys.dart';
import 'package:fedi/app/settings/instance/list/instance_settings_list_widget_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button_keys.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet_keys.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_widget_keys.dart';
import 'package:fedi/app/ui/theme/dark/dark_fedi_ui_theme_model_id.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:screenshots/screenshots.dart';
import 'package:test/test.dart';

// ignore_for_file: avoid-ignoring-return-values
void main() {
  // var instanceHost =
  //     Platform.environment['FLUTTER_DRIVER_INSTANCE_HOST']!;

  group('end-to-end test', () {
    // ignore: avoid-late-keyword
    late FlutterDriver driver;
    // ignore: avoid-late-keyword
    late String instanceHost;
    final config = Config();

    setUpAll(() async {
      // Connect to a running Flutter application instance.
      driver = await FlutterDriver.connect();
      // get the localizations for the current locale
      instanceHost = await driver.requestData(null);
      // ignore: avoid_print
      print('instanceHost=$instanceHost');
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test(
      'Screenshots: 1_Login, 2_InstanceDetails, 3_SignUp, '
      '4_Timelines, 5_Notifications, 6_Messages, 7_Chat, '
      '8_ChooseAccount, 9_Settings, 10_AccountActions',
      () async {
        await screenshot(driver, config, '1_Login');

        var hostTextField = find.byValueKey(
          JoinUnifediApiAccessWidgetKeys.hostTextFieldKey,
        );
        await driver.tap(hostTextField);

        // await driver.enterText('mastodon.social');
        await driver.enterText(instanceHost);
        // if(Platform.isAndroid) {
        //   await driver.enterText('http://10.0.2.2:4000');
        // } else if(Platform.isIOS) {
        //   await driver.enterText('http://localhost:4000');
        // }

        var exploreAsGuestButton = find.byValueKey(
          JoinUnifediApiAccessWidgetKeys.exploreAsGuestButtonKey,
        );

        await driver.waitFor(exploreAsGuestButton);
        await driver.tap(exploreAsGuestButton);

        await driver.waitFor(
          find.byValueKey(
            RemoteInstanceDetailsPageKeys.instanceDetailsWidgetKey,
          ),
        );

        await screenshot(driver, config, '2_InstanceDetails');

        await driver.tap(
          find.byValueKey(
            FediBackIconButtonKeys.button,
          ),
        );

        await driver.waitFor(
          find.byValueKey(
            FromScratchJoinUnifediApiAccessPageKeys
                .joinUnifediApiAccessWidgetKey,
          ),
        );

        await driver.tap(
          find.byValueKey(
            JoinUnifediApiAccessWidgetKeys.signUpButtonKey,
          ),
        );

        await driver.waitFor(
          find.byValueKey(
            RegisterUnifediApiAccessPageKeys.registerUnifediApiAccessWidgetKey,
          ),
        );

        await screenshot(driver, config, '3_SignUp');

        await driver.tap(
          find.byValueKey(
            FediDismissIconButtonKeys.button,
          ),
        );

        hostTextField = find.byValueKey(
          JoinUnifediApiAccessWidgetKeys.hostTextFieldKey,
        );
        await driver.tap(hostTextField);

        await driver.enterText('mastodon.social');
        // ignore: avoid_print
        print('before joinUnifediApiAccessWidgetKey');

        await driver.waitFor(
          find.byValueKey(
            FromScratchJoinUnifediApiAccessPageKeys
                .joinUnifediApiAccessWidgetKey,
          ),
        );
        // ignore: avoid_print
        print('before login');

        await driver.tap(
          find.byValueKey(
            JoinUnifediApiAccessWidgetKeys.loginButtonKey,
          ),
        );
        // ignore: avoid_print
        print('after login');

        await driver.waitFor(
          find.byType('HomePageBottomNavigationBarWidget'),
          // timeout: Duration(seconds: 5),
        );
        // ignore: avoid_print
        print('after test');

        await driver.waitFor(
          find.byValueKey(
            HomePageKeys.bottomNavBarWidget,
          ),
        );

        // ignore: avoid_print
        print('after wait navBarWidget');

        await screenshot(driver, config, '4_Timelines');

        await driver.tap(
          find.byValueKey(
            HomePageBottomNavigationBarWidgetKeys.notificationsTabButton,
          ),
        );

        await screenshot(driver, config, '5_Notifications');

        await driver.tap(
          find.byValueKey(
            HomePageBottomNavigationBarWidgetKeys.chatTabButton,
          ),
        );

        await screenshot(driver, config, '6_Messages');

        await driver.tap(
          find.descendant(
            of: find.byValueKey(
              PleromaChatHomeTabPageKeys.pleromaChatWithLastMessageListWidget,
            ),
            matching: find.byType('ChatListItemWidget'),
            firstMatchOnly: true,
          ),
        );

        await screenshot(driver, config, '7_Chat');

        await driver.tap(
          find.byValueKey(
            FediBackIconButtonKeys.button,
          ),
        );

        await driver.tap(
          find.byValueKey(
            HomePageBottomNavigationBarWidgetKeys.accountTabButton,
          ),
        );

        await driver.tap(
          find.byValueKey(
            AccountHomeTabPageKeys
                .accountHomeTabFediTabMainHeaderBarChooserButtonWidget,
          ),
        );

        await screenshot(driver, config, '8_ChooseAccount');

        await driver.tap(
          find.byValueKey(
            FediModalBottomSheetKeys.fediModalBottomSheetHandlerBar,
          ),
        );

        await driver.tap(
          find.byValueKey(
            AccountHomeTabPageKeys
                .accountHomeTabFediTabMainHeaderBarAccountMenuButtonWidget,
          ),
        );

        await driver.tap(
          find.byValueKey(
            AccountHomeTabMenuDialogKeys
                .settingsHomeTabMenuDialogBodySettingsItemWidget,
          ),
        );

        await driver.tap(
          find.byValueKey(
            InstanceSettingsListWidgetKeys.instanceSettingsUiRowWidget,
          ),
        );

        await driver.tap(
          find.descendant(
            of: find.byValueKey(
              EditUiSettingsWidgetKeys
                  .fediUiThemeSingleFromListValueFormFieldRowWidget,
            ),
            matching: find.byType('InkWell'),
            firstMatchOnly: true,
          ),
        );
        await driver.tap(
          find.byValueKey(
            darkFediUiThemeId,
          ),
        );

        await driver.tap(
          find.byValueKey(
            FediModalBottomSheetKeys.fediModalBottomSheetHandlerBar,
          ),
        );

        await screenshot(driver, config, '9_Settings');

        await driver.tap(
          find.byValueKey(
            FediBackIconButtonKeys.button,
          ),
        );

        await driver.tap(
          find.byValueKey(
            AccountHomeTabMenuDialogKeys
                .accountHomeTabMenuDialogBodyAccountItemWidget,
          ),
        );

        await screenshot(driver, config, '10_AccountActions');
      },
      timeout: const Timeout(
        Duration(
          // ignore: no-magic-number
          seconds: 240,
        ),
      ),
    );
  });
}
