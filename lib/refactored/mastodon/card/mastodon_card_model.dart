import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class IMastodonCard {
  String get url;

  String get title;

  String get description;

  MastodonCardType get type;

  String get authorName;

  String get authorUrl;

  String get providerName;

  String get providerUrl;

  String get html;

  int get width;

  int get height;

  String get image;

  String get embedUrl;
}

final mastodonCardTypeValues = EnumValues({
  "link": MastodonCardType.link,
  "photo": MastodonCardType.photo,
  "video": MastodonCardType.video,
  "rich": MastodonCardType.rich
});

enum MastodonCardType { link, photo, video, rich }

class MastodonCardTypeTypeConverter
    implements JsonConverter<MastodonCardType, String> {
  const MastodonCardTypeTypeConverter();

  @override
  MastodonCardType fromJson(String value) => mastodonCardTypeValues.map[value];
  @override
  String toJson(MastodonCardType value) =>
      mastodonCardTypeValues.reverse[value];
}
