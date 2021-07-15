import 'package:fedi/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = DatabaseCacheAgeLimitType.values;
    for (var value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toDatabaseCacheAgeLimitType();

      expect(value, objFromJsonValue);
    }
  });
  test('toDurationOrNull', () async {
    var values = DatabaseCacheAgeLimitType.values;
    for (var value in values) {
      switch (value) {
        case DatabaseCacheAgeLimitType.notSet:
          expect(value.toDurationOrNull(), null);
          break;
        case DatabaseCacheAgeLimitType.days7:
          expect(value.toDurationOrNull(), Duration(days: 7));
          break;
        case DatabaseCacheAgeLimitType.days30:
          expect(value.toDurationOrNull(), Duration(days: 30));
          break;
        case DatabaseCacheAgeLimitType.days90:
          expect(value.toDurationOrNull(), Duration(days: 90));
          break;
        case DatabaseCacheAgeLimitType.days180:
          expect(value.toDurationOrNull(), Duration(days: 180));
          break;
        case DatabaseCacheAgeLimitType.days365:
          expect(value.toDurationOrNull(), Duration(days: 365));
          break;
      }
    }
  });
}
