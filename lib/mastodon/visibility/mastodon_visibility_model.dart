import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum MastodonVisibility { PUBLIC, UNLISTED, DIRECT }

final visibilityMastodonValues = new EnumValues({
  "public": MastodonVisibility.PUBLIC,
  "unlisted": MastodonVisibility.UNLISTED,
  "direct": MastodonVisibility.DIRECT
});

class MastodonVisibilityTypeConverter implements JsonConverter<MastodonVisibility, String> {
  const MastodonVisibilityTypeConverter();

  @override
  MastodonVisibility fromJson(String value) => visibilityMastodonValues.map[value];
  @override
  String toJson(MastodonVisibility value) => visibilityMastodonValues.reverseMap[value];

}