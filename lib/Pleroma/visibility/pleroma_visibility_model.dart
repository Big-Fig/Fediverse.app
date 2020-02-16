
import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum PleromaVisibility { PUBLIC, UNLISTED, DIRECT, LIST }

final visibilityValues = new EnumValues({
  "public": PleromaVisibility.PUBLIC,
  "unlisted": PleromaVisibility.UNLISTED,
  "direct": PleromaVisibility.DIRECT,
  "list": PleromaVisibility.LIST
});


class PleromaVisibilityTypeConverter implements JsonConverter<PleromaVisibility, String> {
  const PleromaVisibilityTypeConverter();

  @override
  PleromaVisibility fromJson(String value) => visibilityValues.map[value];
  @override
  String toJson(PleromaVisibility value) => visibilityValues.reverseMap[value];

}