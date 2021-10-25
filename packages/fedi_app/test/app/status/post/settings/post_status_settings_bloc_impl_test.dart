import 'dart:async';

import 'package:fedi_app/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../../../rxdart/rxdart_test_helper.dart';
import 'post_status_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalPostStatusSettingsLocalPreferenceBloc
      globalPostStatusSettingsLocalPreferencesBloc;
  late InstancePostStatusSettingsLocalPreferenceBloc
      instancePostStatusSettingsLocalPreferencesBloc;
  late PostStatusSettingsBloc postStatusSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  PostStatusSettings? listened;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalPostStatusSettingsLocalPreferencesBloc =
        GlobalPostStatusSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalPostStatusSettingsLocalPreferencesBloc.performAsyncInit();

    instancePostStatusSettingsLocalPreferencesBloc =
        InstancePostStatusSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instancePostStatusSettingsLocalPreferencesBloc.performAsyncInit();
    postStatusSettingsBloc = PostStatusSettingsBloc(
      globalLocalPreferencesBloc: globalPostStatusSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instancePostStatusSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        postStatusSettingsBloc.settingsDataStream.listen((data) {
      listened = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await postStatusSettingsBloc.dispose();
    await globalPostStatusSettingsLocalPreferencesBloc.dispose();
    await instancePostStatusSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('markMediaAsNsfwOnAttach', () async {
    bool? listenedMarkMediaAsNsfwOnAttach;

    StreamSubscription subscriptionListenedPostStatusAgeLimitType =
        postStatusSettingsBloc.markMediaAsNsfwOnAttachStream.listen(
      (data) {
        listenedMarkMediaAsNsfwOnAttach = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalPostStatusSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listened?.markMediaAsNsfwOnAttach,
      defaultValue.markMediaAsNsfwOnAttach,
    );
    expect(
      postStatusSettingsBloc.settingsData.markMediaAsNsfwOnAttach,
      defaultValue.markMediaAsNsfwOnAttach,
    );

    expect(
      listenedMarkMediaAsNsfwOnAttach,
      defaultValue.markMediaAsNsfwOnAttach,
    );
    expect(
      postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      defaultValue.markMediaAsNsfwOnAttach,
    );

    var testMarkMediaAsNsfwOnAttach =
        PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
      seed: 'seed',
    ).markMediaAsNsfwOnAttach;

    await postStatusSettingsBloc
        .changeMarkMediaAsNsfwOnAttach(testMarkMediaAsNsfwOnAttach);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened?.markMediaAsNsfwOnAttach,
      testMarkMediaAsNsfwOnAttach,
    );
    expect(
      postStatusSettingsBloc.settingsData.markMediaAsNsfwOnAttach,
      testMarkMediaAsNsfwOnAttach,
    );

    expect(
      listenedMarkMediaAsNsfwOnAttach,
      testMarkMediaAsNsfwOnAttach,
    );
    expect(
      postStatusSettingsBloc.markMediaAsNsfwOnAttach,
      testMarkMediaAsNsfwOnAttach,
    );

    await subscriptionListenedPostStatusAgeLimitType.cancel();
  });
  test('defaultVisibilityUnifedi', () async {
    UnifediApiVisibility? listenedDefaultVisibilityUnifedi;

    StreamSubscription subscriptionListenedPostStatusAgeLimitType =
        postStatusSettingsBloc.defaultVisibilityAsUnifediApiStream.listen(
      (data) {
        listenedDefaultVisibilityUnifedi = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalPostStatusSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listened?.defaultVisibilityAsUnifediApi,
      defaultValue.defaultVisibilityAsUnifediApi,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultVisibilityAsUnifediApi,
      defaultValue.defaultVisibilityAsUnifediApi,
    );

    expect(
      listenedDefaultVisibilityUnifedi,
      defaultValue.defaultVisibilityAsUnifediApi,
    );
    expect(
      postStatusSettingsBloc.defaultVisibilityAsUnifediApi,
      defaultValue.defaultVisibilityAsUnifediApi,
    );

    var testDefaultVisibilityUnifedi =
        PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
      seed: 'seed',
    ).defaultVisibilityAsUnifediApi;

    await postStatusSettingsBloc
        .changeDefaultVisibilityAsUnifediApi(testDefaultVisibilityUnifedi);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened?.defaultVisibilityAsUnifediApi,
      testDefaultVisibilityUnifedi,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultVisibilityAsUnifediApi,
      testDefaultVisibilityUnifedi,
    );

    expect(
      listenedDefaultVisibilityUnifedi,
      testDefaultVisibilityUnifedi,
    );
    expect(
      postStatusSettingsBloc.defaultVisibilityAsUnifediApi,
      testDefaultVisibilityUnifedi,
    );

    await subscriptionListenedPostStatusAgeLimitType.cancel();
  });

  test('defaultStatusLocale', () async {
    LocalizationLocale? listenedDefaultStatusLocale;

    StreamSubscription subscriptionListenedPostStatusAgeLimitType =
        postStatusSettingsBloc.defaultStatusLocaleStream.listen(
      (data) {
        listenedDefaultStatusLocale = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalPostStatusSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listened?.defaultStatusLocale,
      defaultValue.defaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultStatusLocale,
      defaultValue.defaultStatusLocale,
    );

    expect(
      listenedDefaultStatusLocale,
      defaultValue.defaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.defaultStatusLocale,
      defaultValue.defaultStatusLocale,
    );

    var testDefaultStatusLocale =
        PostStatusSettingsModelMockHelper.createTestPostStatusSettings(
      seed: 'seed',
    ).defaultStatusLocale;

    await postStatusSettingsBloc
        .changeDefaultStatusLocale(testDefaultStatusLocale);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened?.defaultStatusLocale,
      testDefaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultStatusLocale,
      testDefaultStatusLocale,
    );

    expect(
      listenedDefaultStatusLocale,
      testDefaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.defaultStatusLocale,
      testDefaultStatusLocale,
    );

    testDefaultStatusLocale = null;

    await postStatusSettingsBloc
        .changeDefaultStatusLocale(testDefaultStatusLocale);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listened?.defaultStatusLocale,
      testDefaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultStatusLocale,
      testDefaultStatusLocale,
    );

    expect(
      listenedDefaultStatusLocale,
      testDefaultStatusLocale,
    );
    expect(
      postStatusSettingsBloc.defaultStatusLocale,
      testDefaultStatusLocale,
    );

    await subscriptionListenedPostStatusAgeLimitType.cancel();
  });
}
