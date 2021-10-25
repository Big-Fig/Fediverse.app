import 'package:fedi_app/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi_app/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi_app/app/cache/database/settings/database_cache_settings_model.dart';

// ignore_for_file: no-magic-number
class DatabaseCacheSettingsModelMockHelper {
  static DatabaseCacheSettings createTestDatabaseCacheSettings({
    required String seed,
  }) =>
      DatabaseCacheSettings.fromEnum(
        entriesCountByTypeLimitType:
            DatabaseCacheEntriesCountByTypeLimitType.values[seed.hashCode %
                DatabaseCacheEntriesCountByTypeLimitType.values.length],
        ageLimitType: DatabaseCacheAgeLimitType
            .values[seed.hashCode % DatabaseCacheAgeLimitType.values.length],
      );
}
