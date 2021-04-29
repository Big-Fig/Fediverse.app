import 'dart:async';

import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'post_status_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalPostStatusSettingsLocalPreferencesBloc
      globalPostStatusSettingsLocalPreferencesBloc;
  late InstancePostStatusSettingsLocalPreferencesBloc
      instancePostStatusSettingsLocalPreferencesBloc;
  late PostStatusSettingsBloc postStatusSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  PostStatusSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalPostStatusSettingsLocalPreferencesBloc =
        GlobalPostStatusSettingsLocalPreferencesBloc(
      memoryLocalPreferencesService,
    );

    await globalPostStatusSettingsLocalPreferencesBloc.performAsyncInit();

    instancePostStatusSettingsLocalPreferencesBloc =
        InstancePostStatusSettingsLocalPreferencesBloc(
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
      listenedSettingsData = data;
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

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalPostStatusSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.markMediaAsNsfwOnAttach,
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
        PostStatusSettingsModelTestHelper.createTestPostStatusSettings(
                seed: "seed")
            .markMediaAsNsfwOnAttach;

    await postStatusSettingsBloc
        .changeMarkMediaAsNsfwOnAttach(testMarkMediaAsNsfwOnAttach);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.markMediaAsNsfwOnAttach,
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
  test('defaultVisibilityPleroma', () async {
    PleromaApiVisibility? listenedDefaultVisibilityPleroma;

    StreamSubscription subscriptionListenedPostStatusAgeLimitType =
        postStatusSettingsBloc.defaultVisibilityAsPleromaApiStream.listen(
      (data) {
        listenedDefaultVisibilityPleroma = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalPostStatusSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.defaultVisibilityAsPleromaApi,
      defaultValue.defaultVisibilityAsPleromaApi,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultVisibilityAsPleromaApi,
      defaultValue.defaultVisibilityAsPleromaApi,
    );

    expect(
      listenedDefaultVisibilityPleroma,
      defaultValue.defaultVisibilityAsPleromaApi,
    );
    expect(
      postStatusSettingsBloc.defaultVisibilityAsPleromaApi,
      defaultValue.defaultVisibilityAsPleromaApi,
    );

    var testDefaultVisibilityPleroma =
        PostStatusSettingsModelTestHelper.createTestPostStatusSettings(
                seed: "seed")
            .defaultVisibilityAsPleromaApi;

    await postStatusSettingsBloc
        .changeDefaultVisibilityAsPleromaApi(testDefaultVisibilityPleroma);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.defaultVisibilityAsPleromaApi,
      testDefaultVisibilityPleroma,
    );
    expect(
      postStatusSettingsBloc.settingsData.defaultVisibilityAsPleromaApi,
      testDefaultVisibilityPleroma,
    );

    expect(
      listenedDefaultVisibilityPleroma,
      testDefaultVisibilityPleroma,
    );
    expect(
      postStatusSettingsBloc.defaultVisibilityAsPleromaApi,
      testDefaultVisibilityPleroma,
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

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalPostStatusSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.defaultStatusLocale,
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
        PostStatusSettingsModelTestHelper.createTestPostStatusSettings(
            seed: "seed")
            .defaultStatusLocale;

    await postStatusSettingsBloc
        .changeDefaultStatusLocale(testDefaultStatusLocale);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.defaultStatusLocale,
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
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.defaultStatusLocale,
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
