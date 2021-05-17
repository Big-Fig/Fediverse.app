import 'dart:async';

import 'package:fedi/app/status/sensitive/settings/local_preferences/global/global_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/local_preferences/instance/instance_status_sensitive_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_bloc_impl.dart';
import 'package:fedi/app/status/sensitive/settings/status_sensitive_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'status_sensitive_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalStatusSensitiveSettingsLocalPreferenceBloc
      globalStatusSensitiveSettingsLocalPreferencesBloc;
  late InstanceStatusSensitiveSettingsLocalPreferenceBloc
      instanceStatusSensitiveSettingsLocalPreferencesBloc;
  late StatusSensitiveSettingsBloc statusSensitiveSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  StatusSensitiveSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalStatusSensitiveSettingsLocalPreferencesBloc =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalStatusSensitiveSettingsLocalPreferencesBloc.performAsyncInit();

    instanceStatusSensitiveSettingsLocalPreferencesBloc =
        InstanceStatusSensitiveSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceStatusSensitiveSettingsLocalPreferencesBloc
        .performAsyncInit();
    statusSensitiveSettingsBloc = StatusSensitiveSettingsBloc(
      globalLocalPreferencesBloc:
          globalStatusSensitiveSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instanceStatusSensitiveSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        statusSensitiveSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await statusSensitiveSettingsBloc.dispose();
    await globalStatusSensitiveSettingsLocalPreferencesBloc.dispose();
    await instanceStatusSensitiveSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('isAlwaysShowNsfw', () async {
    bool? listenedIsAlwaysShowNsfw;

    StreamSubscription subscriptionListenedStatusSensitiveAgeLimitType =
        statusSensitiveSettingsBloc.isAlwaysShowNsfwStream.listen(
      (data) {
        listenedIsAlwaysShowNsfw = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.isAlwaysShowNsfw,
      defaultValue.isAlwaysShowNsfw,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.isAlwaysShowNsfw,
      defaultValue.isAlwaysShowNsfw,
    );

    expect(
      listenedIsAlwaysShowNsfw,
      defaultValue.isAlwaysShowNsfw,
    );
    expect(
      statusSensitiveSettingsBloc.isAlwaysShowNsfw,
      defaultValue.isAlwaysShowNsfw,
    );

    var testIsAlwaysShowNsfw = StatusSensitiveSettingsModelTestHelper
            .createTestStatusSensitiveSettings(seed: 'seed')
        .isAlwaysShowNsfw;

    await statusSensitiveSettingsBloc
        .changeIsAlwaysShowNsfw(testIsAlwaysShowNsfw);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.isAlwaysShowNsfw,
      testIsAlwaysShowNsfw,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.isAlwaysShowNsfw,
      testIsAlwaysShowNsfw,
    );

    expect(
      listenedIsAlwaysShowNsfw,
      testIsAlwaysShowNsfw,
    );
    expect(
      statusSensitiveSettingsBloc.isAlwaysShowNsfw,
      testIsAlwaysShowNsfw,
    );

    await subscriptionListenedStatusSensitiveAgeLimitType.cancel();
  });

  test('isAlwaysShowSpoiler', () async {
    bool? listenedIsAlwaysShowSpoiler;

    StreamSubscription subscriptionListenedStatusSensitiveAgeLimitType =
        statusSensitiveSettingsBloc.isAlwaysShowSpoilerStream.listen(
      (data) {
        listenedIsAlwaysShowSpoiler = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.isAlwaysShowSpoiler,
      defaultValue.isAlwaysShowSpoiler,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.isAlwaysShowSpoiler,
      defaultValue.isAlwaysShowSpoiler,
    );

    expect(
      listenedIsAlwaysShowSpoiler,
      defaultValue.isAlwaysShowSpoiler,
    );
    expect(
      statusSensitiveSettingsBloc.isAlwaysShowSpoiler,
      defaultValue.isAlwaysShowSpoiler,
    );

    var testIsAlwaysShowSpoiler = StatusSensitiveSettingsModelTestHelper
            .createTestStatusSensitiveSettings(seed: 'seed')
        .isAlwaysShowSpoiler;

    await statusSensitiveSettingsBloc
        .changeIsAlwaysShowSpoiler(testIsAlwaysShowSpoiler);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.isAlwaysShowSpoiler,
      testIsAlwaysShowSpoiler,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.isAlwaysShowSpoiler,
      testIsAlwaysShowSpoiler,
    );

    expect(
      listenedIsAlwaysShowSpoiler,
      testIsAlwaysShowSpoiler,
    );
    expect(
      statusSensitiveSettingsBloc.isAlwaysShowSpoiler,
      testIsAlwaysShowSpoiler,
    );

    await subscriptionListenedStatusSensitiveAgeLimitType.cancel();
  });

  test('nsfwDisplayDelayDuration', () async {
    Duration? listenedNsfwDisplayDelayDuration;

    StreamSubscription subscriptionListenedStatusSensitiveAgeLimitType =
        statusSensitiveSettingsBloc.nsfwDisplayDelayDurationStream.listen(
      (data) {
        listenedNsfwDisplayDelayDuration = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalStatusSensitiveSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.nsfwDisplayDelayDuration,
      defaultValue.nsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.nsfwDisplayDelayDuration,
      defaultValue.nsfwDisplayDelayDuration,
    );

    expect(
      listenedNsfwDisplayDelayDuration,
      defaultValue.nsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.nsfwDisplayDelayDuration,
      defaultValue.nsfwDisplayDelayDuration,
    );

    var testNsfwDisplayDelayDuration = StatusSensitiveSettingsModelTestHelper
            .createTestStatusSensitiveSettings(seed: 'seed')
        .nsfwDisplayDelayDuration;

    await statusSensitiveSettingsBloc
        .changeNsfwDisplayDelayDuration(testNsfwDisplayDelayDuration);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );

    expect(
      listenedNsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );

    testNsfwDisplayDelayDuration = null;

    await statusSensitiveSettingsBloc
        .changeNsfwDisplayDelayDuration(testNsfwDisplayDelayDuration);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.settingsData.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );

    expect(
      listenedNsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );
    expect(
      statusSensitiveSettingsBloc.nsfwDisplayDelayDuration,
      testNsfwDisplayDelayDuration,
    );

    await subscriptionListenedStatusSensitiveAgeLimitType.cancel();
  });
}
