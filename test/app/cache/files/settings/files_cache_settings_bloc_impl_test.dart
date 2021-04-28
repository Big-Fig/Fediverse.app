import 'dart:async';

import 'package:fedi/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'files_cache_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalFilesCacheSettingsLocalPreferencesBloc
      globalFilesCacheSettingsLocalPreferencesBloc;
  late InstanceFilesCacheSettingsLocalPreferencesBloc
      instanceFilesCacheSettingsLocalPreferencesBloc;
  late FilesCacheSettingsBloc filesCacheSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  FilesCacheSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalFilesCacheSettingsLocalPreferencesBloc =
        GlobalFilesCacheSettingsLocalPreferencesBloc(
      memoryLocalPreferencesService,
    );

    await globalFilesCacheSettingsLocalPreferencesBloc.performAsyncInit();

    instanceFilesCacheSettingsLocalPreferencesBloc =
        InstanceFilesCacheSettingsLocalPreferencesBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceFilesCacheSettingsLocalPreferencesBloc.performAsyncInit();
    filesCacheSettingsBloc = FilesCacheSettingsBloc(
      globalLocalPreferencesBloc:
          globalFilesCacheSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instanceFilesCacheSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        filesCacheSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await filesCacheSettingsBloc.dispose();
    await globalFilesCacheSettingsLocalPreferencesBloc.dispose();
    await instanceFilesCacheSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('changeFilesCacheAgeLimitType', () async {
    FilesCacheAgeLimitType? listenedFilesCacheAgeLimitType;

    StreamSubscription subscriptionListenedFilesCacheAgeLimitType =
        filesCacheSettingsBloc.ageLimitTypeStream.listen(
      (data) {
        listenedFilesCacheAgeLimitType = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalFilesCacheSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.ageLimitType,
      defaultValue.ageLimitType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.ageLimitType,
      defaultValue.ageLimitType,
    );

    expect(
      listenedFilesCacheAgeLimitType,
      defaultValue.ageLimitType,
    );
    expect(
      filesCacheSettingsBloc.ageLimitType,
      defaultValue.ageLimitType,
    );

    var testFilesCacheAgeLimitType =
        FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
                seed: "seed")
            .ageLimitType;

    await filesCacheSettingsBloc
        .changeAgeLimitType(testFilesCacheAgeLimitType);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.ageLimitType,
      testFilesCacheAgeLimitType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.ageLimitType,
      testFilesCacheAgeLimitType,
    );

    expect(
      listenedFilesCacheAgeLimitType,
      testFilesCacheAgeLimitType,
    );
    expect(
      filesCacheSettingsBloc.ageLimitType,
      testFilesCacheAgeLimitType,
    );

    await subscriptionListenedFilesCacheAgeLimitType.cancel();
  });

  test('changeFilesCacheSizeLimitCountType', () async {
    FilesCacheSizeLimitCountType?
        listenedFilesCacheSizeLimitCountType;

    StreamSubscription
        subscriptionListenedFilesCacheSizeLimitCountType =
        filesCacheSettingsBloc.sizeLimitCountTypeStream.listen(
      (data) {
        listenedFilesCacheSizeLimitCountType = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

    var defaultValue =
        GlobalFilesCacheSettingsLocalPreferencesBloc.defaultValue;

    expect(
      listenedSettingsData?.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );

    expect(
      listenedFilesCacheSizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );

    var testFilesCacheSizeLimitCountType =
        FilesCacheSettingsModelTestHelper.createTestFilesCacheSettings(
                seed: "seed")
            .sizeLimitCountType;

    await filesCacheSettingsBloc.changeSizeLimitCountType(
        testFilesCacheSizeLimitCountType);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );

    expect(
      listenedFilesCacheSizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );

    await subscriptionListenedFilesCacheSizeLimitCountType.cancel();
  });
}
