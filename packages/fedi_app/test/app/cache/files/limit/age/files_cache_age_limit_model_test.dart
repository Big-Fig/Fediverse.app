// ignore_for_file: prefer_const_constructors

import 'package:fedi_app/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = FilesCacheAgeLimitType.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toFilesCacheAgeLimitType();

      expect(value, objFromJsonValue);
    }
  });
  test('toDurationOrNull', () async {
    var values = FilesCacheAgeLimitType.values;
    for (final value in values) {
      switch (value) {
        case FilesCacheAgeLimitType.notSet:
          expect(value.toDurationOrNull(), null);
          break;
        case FilesCacheAgeLimitType.days7:
          expect(value.toDurationOrNull(), Duration(days: 7));
          break;
        case FilesCacheAgeLimitType.days30:
          expect(value.toDurationOrNull(), Duration(days: 30));
          break;
        case FilesCacheAgeLimitType.days90:
          expect(value.toDurationOrNull(), Duration(days: 90));
          break;
        case FilesCacheAgeLimitType.days180:
          expect(value.toDurationOrNull(), Duration(days: 180));
          break;
        case FilesCacheAgeLimitType.days365:
          expect(value.toDurationOrNull(), Duration(days: 365));
          break;
      }
    }
  });
}
