import 'package:fedi/app/cache/files/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = FilesCacheSizeLimitCountType.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toFilesCacheSizeLimitCountType();

      expect(value, objFromJsonValue);
    }
  });
  test('toCountOrNull', () async {
    var values = FilesCacheSizeLimitCountType.values;
    for (final value in values) {
      switch (value) {
        case FilesCacheSizeLimitCountType.notSet:
          expect(value.toCountOrNull(), null);
          break;
        case FilesCacheSizeLimitCountType.size50:
          expect(value.toCountOrNull(), 50);
          break;
        case FilesCacheSizeLimitCountType.size100:
          expect(value.toCountOrNull(), 100);
          break;
        case FilesCacheSizeLimitCountType.size200:
          expect(value.toCountOrNull(), 200);
          break;
        case FilesCacheSizeLimitCountType.size500:
          expect(value.toCountOrNull(), 500);
          break;
        case FilesCacheSizeLimitCountType.size1000:
          expect(value.toCountOrNull(), 1000);
          break;
        case FilesCacheSizeLimitCountType.size10000:
          expect(value.toCountOrNull(), 10000);
          break;
      }
    }
  });
}
