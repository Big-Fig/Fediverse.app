import 'package:fedi_app/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: no-magic-number
void main() {
  test('toJsonValue & fromJsonValue', () async {
    var values = PaginationPageSize.values;
    for (final value in values) {
      var jsonValue = value.toJsonValue();

      var objFromJsonValue = jsonValue.toPaginationPageSize();

      expect(value, objFromJsonValue);
    }
  });
  test('toCount', () async {
    var values = PaginationPageSize.values;
    for (final value in values) {
      switch (value) {
        case PaginationPageSize.size5:
          expect(value.toCount(), 5);
          break;
        case PaginationPageSize.size10:
          expect(value.toCount(), 10);
          break;
        case PaginationPageSize.size20:
          expect(value.toCount(), 20);
          break;
        case PaginationPageSize.size50:
          expect(value.toCount(), 50);
          break;
        case PaginationPageSize.size100:
          expect(value.toCount(), 100);
          break;
      }
    }
  });
}
