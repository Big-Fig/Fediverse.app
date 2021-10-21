import 'dart:async';

import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/app/ui/settings/local_preference/global/global_ui_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_bloc_impl.dart';
import 'package:fedi/app/ui/settings/ui_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../rxdart/rxdart_test_helper.dart';
import 'ui_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalUiSettingsLocalPreferenceBloc globalUiSettingsLocalPreferencesBloc;
  late UiSettingsBloc uiSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  UiSettings? listened;

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
      listened = data;
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

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalUiSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listened?.statusFontSize,
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
        UiSettingsModelMockHelper.createTestUiSettings(seed: 'seed')
            .statusFontSize;

    await uiSettingsBloc.changeStatusFontSize(testStatusFontSize);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened?.statusFontSize,
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
    String? listened;

    StreamSubscription subscriptionListenedThemeId =
        uiSettingsBloc.themeIdStream.listen(
      (data) {
        listened = data;
      },
    );

    var defaultValue = GlobalUiSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listened,
      defaultValue.themeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      defaultValue.themeId,
    );

    expect(
      listened,
      defaultValue.themeId,
    );
    expect(
      uiSettingsBloc.themeId,
      defaultValue.themeId,
    );

    var testThemeId =
        UiSettingsModelMockHelper.createTestUiSettings(seed: 'seed').themeId;

    await uiSettingsBloc.changeThemeId(testThemeId);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened,
      testThemeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      testThemeId,
    );

    expect(
      listened,
      testThemeId,
    );
    expect(
      uiSettingsBloc.themeId,
      testThemeId,
    );

    testThemeId = null;

    await uiSettingsBloc.changeThemeId(testThemeId);

    expect(
      listened,
      testThemeId,
    );
    expect(
      uiSettingsBloc.settingsData.themeId,
      testThemeId,
    );

    expect(
      listened,
      testThemeId,
    );
    expect(
      uiSettingsBloc.themeId,
      testThemeId,
    );

    await subscriptionListenedThemeId.cancel();
  });
}
