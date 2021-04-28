import 'dart:async';

import 'package:fedi/app/media/settings/local_preferences/global/global_media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/local_preferences/instance/instance_media_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_bloc_impl.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'media_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalMediaSettingsLocalPreferencesBloc
      globalMediaSettingsLocalPreferencesBloc;
  late InstanceMediaSettingsLocalPreferencesBloc
      instanceMediaSettingsLocalPreferencesBloc;
  late MediaSettingsBloc mediaSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  MediaSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalMediaSettingsLocalPreferencesBloc =
        GlobalMediaSettingsLocalPreferencesBloc(
      memoryLocalPreferencesService,
    );

    await globalMediaSettingsLocalPreferencesBloc.performAsyncInit();

    instanceMediaSettingsLocalPreferencesBloc =
        InstanceMediaSettingsLocalPreferencesBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceMediaSettingsLocalPreferencesBloc.performAsyncInit();
    mediaSettingsBloc = MediaSettingsBloc(
      globalLocalPreferencesBloc: globalMediaSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc: instanceMediaSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        mediaSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await mediaSettingsBloc.dispose();
    await globalMediaSettingsLocalPreferencesBloc.dispose();
    await instanceMediaSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('autoPlay', () async {
    bool? listenedAutoPlay;

    StreamSubscription subscriptionListenedMediaAgeLimitType =
        mediaSettingsBloc.autoPlayStream.listen(
      (data) {
        listenedAutoPlay = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalMediaSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.autoPlay,
      defaultValue.autoPlay,
    );
    expect(
      mediaSettingsBloc.settingsData.autoPlay,
      defaultValue.autoPlay,
    );

    expect(
      listenedAutoPlay,
      defaultValue.autoPlay,
    );
    expect(
      mediaSettingsBloc.autoPlay,
      defaultValue.autoPlay,
    );

    var testAutoPlay =
        MediaSettingsModelTestHelper.createTestMediaSettings(seed: "seed")
            .autoPlay;

    await mediaSettingsBloc.changeAutoPlay(testAutoPlay);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.autoPlay,
      testAutoPlay,
    );
    expect(
      mediaSettingsBloc.settingsData.autoPlay,
      testAutoPlay,
    );

    expect(
      listenedAutoPlay,
      testAutoPlay,
    );
    expect(
      mediaSettingsBloc.autoPlay,
      testAutoPlay,
    );

    await subscriptionListenedMediaAgeLimitType.cancel();
  });
  test('autoInit', () async {
    bool? listenedAutoPlay;

    StreamSubscription subscriptionListenedMediaAgeLimitType =
        mediaSettingsBloc.autoInitStream.listen(
      (data) {
        listenedAutoPlay = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue = GlobalMediaSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.autoInit,
      defaultValue.autoInit,
    );
    expect(
      mediaSettingsBloc.settingsData.autoInit,
      defaultValue.autoInit,
    );

    expect(
      listenedAutoPlay,
      defaultValue.autoInit,
    );
    expect(
      mediaSettingsBloc.autoInit,
      defaultValue.autoInit,
    );

    var testAutoPlay =
        MediaSettingsModelTestHelper.createTestMediaSettings(seed: "seed")
            .autoInit;

    await mediaSettingsBloc.changeAutoPlay(testAutoPlay);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.autoInit,
      testAutoPlay,
    );
    expect(
      mediaSettingsBloc.settingsData.autoInit,
      testAutoPlay,
    );

    expect(
      listenedAutoPlay,
      testAutoPlay,
    );
    expect(
      mediaSettingsBloc.autoInit,
      testAutoPlay,
    );

    await subscriptionListenedMediaAgeLimitType.cancel();
  });
}
