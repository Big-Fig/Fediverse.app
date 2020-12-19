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
}

extension PaginationPageSizeStringExtension on String {
  PaginationPageSize toPaginationPageSize() =>
      paginationPageSizeEnumValues.valueToEnumMap[this];
}
