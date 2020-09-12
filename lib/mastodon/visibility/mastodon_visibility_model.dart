import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

enum MastodonVisibility { public, unlisted, direct }

final mastodonVisibilityValues = EnumValues({
  "public": MastodonVisibility.public,
  "unlisted": MastodonVisibility.unlisted,
  "direct": MastodonVisibility.direct
});

class MastodonVisibilityTypeConverter
    implements JsonConverter<MastodonVisibility, String> {
  const MastodonVisibilityTypeConverter();

  @override
  MastodonVisibility fromJson(String value) =>
      mastodonVisibilityValues.valueToEnumMap[value];
  @override
  String toJson(MastodonVisibility value) =>
      mastodonVisibilityValues.enumToValueMap[value];
}
