import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum PleromaVisibility { PUBLIC, UNLISTED, DIRECT, LIST, PRIVATE }

extension PleromaVisibilityJsonValueExtension on PleromaVisibility {
  String toJsonValue() => _pleromaVisibilityValues.enumToValueMap[this];
}

extension PleromaVisibilityStringExtension on String {
  PleromaVisibility toPleromaVisibility() => _pleromaVisibilityValues.valueToEnumMap[this];
}

final _pleromaVisibilityValues = EnumValues({
  "public": PleromaVisibility.PUBLIC,
  "unlisted": PleromaVisibility.UNLISTED,
  "direct": PleromaVisibility.DIRECT,
  "list": PleromaVisibility.LIST,
  "private": PleromaVisibility.PRIVATE
});

class PleromaVisibilityTypeConverter
    implements JsonConverter<PleromaVisibility, String> {
  const PleromaVisibilityTypeConverter();

  @override
  PleromaVisibility fromJson(String value) =>
      value.toPleromaVisibility();
  @override
  String toJson(PleromaVisibility value) =>
      value.toJsonValue();
}
