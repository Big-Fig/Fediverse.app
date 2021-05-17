import 'dart:async';

import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'ui_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalUiSettingsLocalPreferenceBloc globalUiSettingsLocalPreferencesBloc;
  late UiSettingsBloc uiSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  UiSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalUiSettingsLocalPreferencesBloc = GlobalUiSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalUiSettingsLocalPreferencesBloc.performAsyncInit();

    uiSettingsBloc = UiSettingsBloc(
      uiSettingsLocalPreferencesBloc: globalUiSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        uiSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await uiSettingsBloc.dispose();
    await globalUiSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('changeStatusFontSize', () async {
    UiSettingsFontSize? listenedStatusFontSize;

    StreamSubscription subscriptionListenedStatusFontSize =
        uiSettingsBloc.statusFontSizeStream.listen(
      (data) {
        listenedStatusFontSize = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalUiSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.statusFontSize,
      defaultValue.statusFontSize,
    );
    expect(
      uiSettingsBloc.settingsData.statusFontSize,
      defaultValue.statusFontSize,
    );

    expect(
      listenedStatusFontSize,
      defaultValue.statusFontSize,
    );
    expect(
      uiSettingsBloc.statusFontSize,
      defaultValue.statusFontSize,
    );

    var testStatusFontSize =
        UiSettingsModelTestHelper.createTestUiSettings(seed: 'seed')
            .statusFontSize;

    await uiSettingsBloc.changeStatusFontSize(testStatusFontSize);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.statusFontSize,
      testStatusFontSize,
    );
    expect(
      uiSettingsBloc.settingsData.statusFontSize,
      testStatusFontSize,
    );

    expect(
      listenedStatusFontSize,
      testStatusFontSize,
    );
    expect(
      uiSettingsBloc.statusFontSize,
      testStatusFontSize,
    );

    await subscriptionListenedStatusFontSize.cancel();
  });

  test('changeThemeId', () async {
    String? listenedThemeId;

    StreamSubscription subscriptionListenedThemeId =
        uiSettingsBloc.themeIdStream.listen(
      (data) {
        listenedThemeId = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalUiSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.themeId,
      defaultValue.themeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      defaultValue.themeId,
    );

    expect(
      listenedThemeId,
      defaultValue.themeId,
    );
    expect(
      uiSettingsBloc.themeId,
      defaultValue.themeId,
    );

    var testThemeId =
        UiSettingsModelTestHelper.createTestUiSettings(seed: 'seed').themeId;

    await uiSettingsBloc.changeThemeId(testThemeId);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.themeId,
      testThemeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      testThemeId,
    );

    expect(
      listenedThemeId,
      testThemeId,
    );
    expect(
      uiSettingsBloc.themeId,
      testThemeId,
    );

    testThemeId = null;

    await uiSettingsBloc.changeThemeId(testThemeId);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.themeId,
      testThemeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      testThemeId,
    );

    expect(
      listenedThemeId,
      testThemeId,
    );
    expect(
      uiSettingsBloc.themeId,
      testThemeId,
    );

    await subscriptionListenedThemeId.cancel();
  });
}
