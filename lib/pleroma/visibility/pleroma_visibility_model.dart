import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum PleromaVisibility {
  public,
  unlisted,
  direct,
  list,
  private,
  local,
}

extension PleromaVisibilityJsonValueExtension on PleromaVisibility {
  String toJsonValue() => _pleromaVisibilityValues.enumToValueMap[this];
}

extension PleromaVisibilityStringExtension on String {
  PleromaVisibility toPleromaVisibility() {
    var visibility = _pleromaVisibilityValues.valueToEnumMap[this];
    assert(visibility != null, "invalid visibility $this");
    return visibility;
  }
}

final _pleromaVisibilityValues = EnumValues({
  "public": PleromaVisibility.public,
  "local": PleromaVisibility.local,
  "unlisted": PleromaVisibility.unlisted,
  "direct": PleromaVisibility.direct,
  "list": PleromaVisibility.list,
  "private": PleromaVisibility.private
});

class PleromaVisibilityTypeConverter
    implements JsonConverter<PleromaVisibility, String> {
  const PleromaVisibilityTypeConverter();

  @override
  PleromaVisibility fromJson(String value) => value.toPleromaVisibility();

  @override
  String toJson(PleromaVisibility value) => value.toJsonValue();
}
