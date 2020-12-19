import 'package:fedi/enum/enum_values.dart';

enum PaginationPageSize {
  size5,
  size10,
  size20,
  size50,
  size100,
}

EnumValues<PaginationPageSize> paginationPageSizeEnumValues = EnumValues({
  "size5": PaginationPageSize.size5,
  "size10": PaginationPageSize.size10,
  "size20": PaginationPageSize.size20,
  "size50": PaginationPageSize.size50,
  "size100": PaginationPageSize.size100,
});

extension PaginationPageSizeExtension on PaginationPageSize {
  String toJsonValue() {
    var type = paginationPageSizeEnumValues.enumToValueMap[this];
    assert(type != null, "invalid type $this");
    return type;
  }

  int toCount() {
    int count;

    switch (this) {
      case PaginationPageSize.size5:
        count = 5;
        break;
      case PaginationPageSize.size10:
        count = 10;
        break;
      case PaginationPageSize.size20:
        count = 20;
        break;
      case PaginationPageSize.size50:
        count = 50;
        break;
      case PaginationPageSize.size100:
        count = 100;
        break;
    }

    return count;
  }
}

extension PaginationPageSizeStringExtension on String {
  PaginationPageSize toPaginationPageSize() =>
      paginationPageSizeEnumValues.valueToEnumMap[this];
}
