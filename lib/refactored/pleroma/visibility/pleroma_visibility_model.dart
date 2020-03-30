
import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum PleromaVisibility { PUBLIC, UNLISTED, DIRECT, LIST, PRIVATE }

final pleromaVisibilityValues = new EnumValues({
  "public": PleromaVisibility.PUBLIC,
  "unlisted": PleromaVisibility.UNLISTED,
  "direct": PleromaVisibility.DIRECT,
  "list": PleromaVisibility.LIST,
  "private" : PleromaVisibility.PRIVATE
});


class PleromaVisibilityTypeConverter implements JsonConverter<PleromaVisibility, String> {
  const PleromaVisibilityTypeConverter();

  @override
  PleromaVisibility fromJson(String value) => pleromaVisibilityValues.map[value];
  @override
  String toJson(PleromaVisibility value) => pleromaVisibilityValues.reverse[value];

}