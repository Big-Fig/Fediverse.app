import 'dart:async';

import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../rxdart/rxdart_test_helper.dart';
import 'database_cache_settings_model_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
void main() {
  late MemoryLocalPreferencesService memoryLocalPreferencesService;
  late GlobalDatabaseCacheSettingsLocalPreferenceBloc
      globalDatabaseCacheSettingsLocalPreferencesBloc;
  late InstanceDatabaseCacheSettingsLocalPreferenceBloc
      instanceDatabaseCacheSettingsLocalPreferencesBloc;
  late DatabaseCacheSettingsBloc databaseCacheSettingsBloc;

  late StreamSubscription subscriptionListenedSettingsData;

  DatabaseCacheSettings? listenedSettingsData;

  setUp(() async {
    memoryLocalPreferencesService = MemoryLocalPreferencesService();
    globalDatabaseCacheSettingsLocalPreferencesBloc =
        GlobalDatabaseCacheSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
    );

    await globalDatabaseCacheSettingsLocalPreferencesBloc.performAsyncInit();

    instanceDatabaseCacheSettingsLocalPreferencesBloc =
        InstanceDatabaseCacheSettingsLocalPreferenceBloc(
      memoryLocalPreferencesService,
      userAtHost: 'user@host',
    );

    await instanceDatabaseCacheSettingsLocalPreferencesBloc.performAsyncInit();
    databaseCacheSettingsBloc = DatabaseCacheSettingsBloc(
      globalLocalPreferencesBloc:
          globalDatabaseCacheSettingsLocalPreferencesBloc,
      instanceLocalPreferencesBloc:
          instanceDatabaseCacheSettingsLocalPreferencesBloc,
    );

    subscriptionListenedSettingsData =
        databaseCacheSettingsBloc.settingsDataStream.listen((data) {
      listenedSettingsData = data;
    });
  });

  tearDown(() async {
    await subscriptionListenedSettingsData.cancel();
    await databaseCacheSettingsBloc.dispose();
    await globalDatabaseCacheSettingsLocalPreferencesBloc.dispose();
    await instanceDatabaseCacheSettingsLocalPreferencesBloc.dispose();
    await memoryLocalPreferencesService.dispose();
  });

  test('changeDatabaseCacheAgeLimitType', () async {
    DatabaseCacheAgeLimitType? listened;

    StreamSubscription subscriptionListenedDatabaseCacheAgeLimitType =
        databaseCacheSettingsBloc.ageLimitTypeStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue =
        GlobalDatabaseCacheSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.ageLimitType,
      defaultValue.ageLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.ageLimitType,
      defaultValue.ageLimitType,
    );

    expect(
      listened,
      defaultValue.ageLimitType,
    );
    expect(
      databaseCacheSettingsBloc.ageLimitType,
      defaultValue.ageLimitType,
    );

    var testDatabaseCacheAgeLimitType =
        DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
      seed: 'seed',
    ).ageLimitType;

    await databaseCacheSettingsBloc
        .changeAgeLimitType(testDatabaseCacheAgeLimitType);

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listenedSettingsData?.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );

    expect(
      listened,
      testDatabaseCacheAgeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );

    await subscriptionListenedDatabaseCacheAgeLimitType.cancel();
  });

  test('changeDatabaseCacheEntriesCountByTypeLimitType', () async {
    DatabaseCacheEntriesCountByTypeLimitType? listened;

    StreamSubscription
        subscriptionListenedDatabaseCacheEntriesCountByTypeLimitType =
        databaseCacheSettingsBloc.entriesCountByTypeLimitTypeStream.listen(
      (data) {
        listened = data;
      },
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    var defaultValue =
        GlobalDatabaseCacheSettingsLocalPreferenceBloc.defaultValue;

    expect(
      listenedSettingsData?.entriesCountByTypeLimitType,
      defaultValue.entriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.entriesCountByTypeLimitType,
      defaultValue.entriesCountByTypeLimitType,
    );

    expect(
      listened,
      defaultValue.entriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.entriesCountByTypeLimitType,
      defaultValue.entriesCountByTypeLimitType,
    );

    var testDatabaseCacheEntriesCountByTypeLimitType =
        DatabaseCacheSettingsModelMockHelper.createTestDatabaseCacheSettings(
      seed: 'seed',
    ).entriesCountByTypeLimitType;

    await databaseCacheSettingsBloc.changeEntriesCountByTypeLimit(
      testDatabaseCacheEntriesCountByTypeLimitType,
    );

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    expect(
      listenedSettingsData?.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );

    expect(
      listened,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );

    await subscriptionListenedDatabaseCacheEntriesCountByTypeLimitType.cancel();
  });
}
