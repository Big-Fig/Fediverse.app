import 'dart:async';

import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/database_cache_settings_model.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/global/global_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/cache/database/settings/local_preferences/instance/instance_database_cache_settings_local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/memory_local_preferences_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

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
    DatabaseCacheAgeLimitType? listenedDatabaseCacheAgeLimitType;

    StreamSubscription subscriptionListenedDatabaseCacheAgeLimitType =
        databaseCacheSettingsBloc.ageLimitTypeStream.listen(
      (data) {
        listenedDatabaseCacheAgeLimitType = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

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
      listenedDatabaseCacheAgeLimitType,
      defaultValue.ageLimitType,
    );
    expect(
      databaseCacheSettingsBloc.ageLimitType,
      defaultValue.ageLimitType,
    );

    var testDatabaseCacheAgeLimitType =
        DatabaseCacheSettingsModelTestHelper.createTestDatabaseCacheSettings(
      seed: 'seed',
    ).ageLimitType;

    await databaseCacheSettingsBloc
        .changeAgeLimitType(testDatabaseCacheAgeLimitType);
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );

    expect(
      listenedDatabaseCacheAgeLimitType,
      testDatabaseCacheAgeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.ageLimitType,
      testDatabaseCacheAgeLimitType,
    );

    await subscriptionListenedDatabaseCacheAgeLimitType.cancel();
  });

  test('changeDatabaseCacheEntriesCountByTypeLimitType', () async {
    DatabaseCacheEntriesCountByTypeLimitType?
        listenedDatabaseCacheEntriesCountByTypeLimitType;

    StreamSubscription
        subscriptionListenedDatabaseCacheEntriesCountByTypeLimitType =
        databaseCacheSettingsBloc.entriesCountByTypeLimitTypeStream.listen(
      (data) {
        listenedDatabaseCacheEntriesCountByTypeLimitType = data;
      },
    );

    await Future.delayed(Duration(milliseconds: 100));

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
      listenedDatabaseCacheEntriesCountByTypeLimitType,
      defaultValue.entriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.entriesCountByTypeLimitType,
      defaultValue.entriesCountByTypeLimitType,
    );

    var testDatabaseCacheEntriesCountByTypeLimitType =
        DatabaseCacheSettingsModelTestHelper.createTestDatabaseCacheSettings(
      seed: 'seed',
    ).entriesCountByTypeLimitType;

    await databaseCacheSettingsBloc.changeEntriesCountByTypeLimit(
      testDatabaseCacheEntriesCountByTypeLimitType,
    );
    await Future.delayed(Duration(milliseconds: 100));

    expect(
      listenedSettingsData?.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.settingsData.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );

    expect(
      listenedDatabaseCacheEntriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );
    expect(
      databaseCacheSettingsBloc.entriesCountByTypeLimitType,
      testDatabaseCacheEntriesCountByTypeLimitType,
    );

    await subscriptionListenedDatabaseCacheEntriesCountByTypeLimitType.cancel();
  });
}
