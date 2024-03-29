import 'dart:async';

import 'package:fedi_app/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi_app/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/files_cache_settings_model.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/global/global_files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/cache/files/settings/local_preferences/instance/instance_files_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../rxdart/rxdart_test_helper.dart';
import 'files_cache_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalFilesCacheSettingsLocalPreferenceBloc
      globalFilesCacheSettingsLocalPreferencesBloc;
  late InstanceFilesCacheSettingsLocalPreferenceBloc
      instanceFilesCacheSettingsLocalPreferencesBloc;
  late FilesCacheSettingsBloc filesCacheSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  FilesCacheSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalFilesCacheSettingsLocalPreferencesBloc =
        GlobalFilesCacheSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalFilesCacheSettingsLocalPreferencesBloc.performAsyncInit();

    instanceFilesCacheSettingsLocalPreferencesBloc =
        InstanceFilesCacheSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceFilesCacheSettingsLocalPreferencesBloc.performAsyncInit();
    filesCacheSettingsBloc = FilesCacheSettingsBloc(
      globalLocalPreferencesBloc: globalFilesCacheSettingsLocalPreferencesBloc,
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
    FilesCacheAgeLimitType? listened;

    StreamSubscription subscriptionListenedFilesCacheAgeLimitType =
        filesCacheSettingsBloc.ageLimitTypeStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalFilesCacheSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.ageLimitType,
      defaultValue.ageLimitType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.ageLimitType,
      defaultValue.ageLimitType,
    );

    expect(
      listened,
      defaultValue.ageLimitType,
    );
    expect(
      filesCacheSettingsBloc.ageLimitType,
      defaultValue.ageLimitType,
    );

    var testFilesCacheAgeLimitType =
        FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
      seed: 'seed',
    ).ageLimitType;

    await filesCacheSettingsBloc.changeAgeLimitType(testFilesCacheAgeLimitType);

    expect(
      listenedSettingsData?.ageLimitType,
      testFilesCacheAgeLimitType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.ageLimitType,
      testFilesCacheAgeLimitType,
    );

    expect(
      listened,
      testFilesCacheAgeLimitType,
    );
    expect(
      filesCacheSettingsBloc.ageLimitType,
      testFilesCacheAgeLimitType,
    );

    await subscriptionListenedFilesCacheAgeLimitType.cancel();
  });

  test('changeFilesCacheSizeLimitCountType', () async {
    FilesCacheSizeLimitCountType? listened;

    StreamSubscription subscriptionListenedFilesCacheSizeLimitCountType =
        filesCacheSettingsBloc.sizeLimitCountTypeStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue = GlobalFilesCacheSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );

    expect(
      listened,
      defaultValue.sizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.sizeLimitCountType,
      defaultValue.sizeLimitCountType,
    );

    var testFilesCacheSizeLimitCountType =
        FilesCacheSettingsModelMockHelper.createTestFilesCacheSettings(
      seed: 'seed',
    ).sizeLimitCountType;

    await filesCacheSettingsBloc
        .changeSizeLimitCountType(testFilesCacheSizeLimitCountType);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listenedSettingsData?.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.settingsData.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );

    expect(
      listened,
      testFilesCacheSizeLimitCountType,
    );
    expect(
      filesCacheSettingsBloc.sizeLimitCountType,
      testFilesCacheSizeLimitCountType,
    );

    await subscriptionListenedFilesCacheSizeLimitCountType.cancel();
  });
}
