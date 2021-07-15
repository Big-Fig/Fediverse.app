import 'package:fedi/app/cache/database/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = DatabaseCacheEntriesCountByTypeLimitType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue =
          jsonValue.toDatabaseCacheEntriesCountByTypeLimitType();

      expect(value, objFromJsonValue);
    }
  });
  test('toCountOrNull', () async {
    var values = DatabaseCacheEntriesCountByTypeLimitType.values;
    for (var value in values) {
      switch (value) {
        case DatabaseCacheEntriesCountByTypeLimitType.notSet:
          expect(value.toCountOrNull(), null);
          break;
        case DatabaseCacheEntriesCountByTypeLimitType.limit1000:
          expect(value.toCountOrNull(), 1000);
          break;
        case DatabaseCacheEntriesCountByTypeLimitType.limit5000:
          expect(value.toCountOrNull(), 5000);
          break;
        case DatabaseCacheEntriesCountByTypeLimitType.limit10000:
          expect(value.toCountOrNull(), 10000);
          break;
        case DatabaseCacheEntriesCountByTypeLimitType.limit100000:
          expect(value.toCountOrNull(), 100000);
          break;
      }
    }
  });
}
