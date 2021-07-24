// This is a basic Flutter Driver test for the application. A Flutter Driver
// test is an end-to-end test that "drives" your application from another
// process or even from another computer. If you are familiar with
// Selenium/WebDriver for web, Espresso for Android or UI Automation for iOS,
// this is simply Flutter's version of that.
import 'dart:convert' as c;

import 'package:fedi/app/auth/instance/join/from_scratch/from_scratch_join_auth_instance_page_keys.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_widget_keys.dart';
import 'package:fedi/app/auth/instance/register/register_auth_instance_page_keys.dart';
import 'package:fedi/app/home/home_page_bottom_navigation_bar_widget_keys.dart';
import 'package:fedi/app/home/home_page_keys.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_page_keys.dart';
import 'package:fedi/app/home/tab/account/menu/account_home_tab_menu_dialog_keys.dart';
import 'package:fedi/app/home/tab/chat/pleroma_chat_home_tab_page_keys.dart';
import 'package:fedi/app/instance/details/remote/remote_instance_details_page_keys.dart';
import 'package:fedi/app/settings/global/list/global_settings_list_widget_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button_keys.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button_keys.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet_keys.dart';
import 'package:fedi/app/ui/settings/edit/edit_ui_settings_widget_keys.dart';
import 'package:fedi/app/ui/theme/dark/dark_fedi_ui_theme_model_id.dart';
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
      'Screenshots: 1_Login, 2_InstanceDetails, 3_SignUp, '
      '4_Timelines, 5_Notifications, 6_Messages, 7_Chat, '
      '8_ChooseAccount, 9_Settings, 10_AccountActions',
      () async {
        await screenshot(driver, config, '1_Login');

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

        await screenshot(driver, config, '2_InstanceDetails');

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

        await screenshot(driver, config, '3_SignUp');

        await driver.tap(
          find.byValueKey(
            FediDismissIconButtonKeys.button,
          ),
        );

        hostTextField = find.byValueKey(
          JoinAuthInstanceWidgetKeys.hostTextFieldKey,
        );
        await driver.tap(hostTextField);

        await driver.enterText('mastodon.social');

        print('before joinAuthInstanceWidgetKey');

        await driver.waitFor(
          find.byValueKey(
            FromScratchJoinAuthInstancePageKeys.joinAuthInstanceWidgetKey,
          ),
        );

        print('before login');

        await driver.tap(
          find.byValueKey(
            JoinAuthInstanceWidgetKeys.loginButtonKey,
          ),
        );

        print('after login');

        await driver.waitFor(
          find.byType('HomePageBottomNavigationBarWidget'),
          // timeout: Duration(seconds: 5),
        );
        print('after test');

        await driver.waitFor(
          find.byValueKey(
            HomePageKeys.bottomNavBarWidget,
          ),
        );

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
                .globalSettingsHomeTabMenuDialogBodySettingsItemWidget,
          ),
        );

        await driver.tap(
          find.byValueKey(
            GlobalSettingsListWidgetKeys.globalSettingsUiRowWidget,
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
      timeout: Timeout(
        Duration(
          // ignore: no-magic-number
          seconds: 240,
        ),
      ),
    );
  });
}
