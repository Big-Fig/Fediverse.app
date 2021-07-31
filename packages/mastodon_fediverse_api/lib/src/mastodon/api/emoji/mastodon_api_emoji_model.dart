import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_api_emoji_model.g.dart';

abstract class IMastodonApiEmoji {
  String? get shortcode;

  String? get url;

  String? get staticUrl;

  bool? get visibleInPicker;

  String? get category;
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@JsonSerializable()
class MastodonApiEmoji implements IMastodonApiEmoji, IJsonObject {
  @override
  @HiveField(0)
  final String? shortcode;
  @override
  @HiveField(1)
  final String? url;
  @override
  @HiveField(2)
  @JsonKey(name: 'static_url')
  final String? staticUrl;
  @override
  @JsonKey(name: 'visible_in_picker')
  @HiveField(3)
  final bool? visibleInPicker;
  @override
  @HiveField(4)
  final String? category;

  MastodonApiEmoji({
    required this.shortcode,
    required this.url,
    required this.staticUrl,
    required this.visibleInPicker,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiEmoji &&
          runtimeType == other.runtimeType &&
          shortcode == other.shortcode &&
          url == other.url &&
          staticUrl == other.staticUrl &&
          visibleInPicker == other.visibleInPicker &&
          category == other.category;

  @override
  int get hashCode =>
      shortcode.hashCode ^
      url.hashCode ^
      staticUrl.hashCode ^
      visibleInPicker.hashCode ^
      category.hashCode;

  @override
  String toString() {
    return 'MastodonApiEmoji{'
        'shortcode: $shortcode, '
        'url: $url, '
        'staticUrl: $staticUrl, '
        'visibleInPicker: $visibleInPicker, '
        'category: $category'
        '}';
  }

  static MastodonApiEmoji fromJson(Map<String, dynamic> json) =>
      _$MastodonApiEmojiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MastodonApiEmojiToJson(this);
}
