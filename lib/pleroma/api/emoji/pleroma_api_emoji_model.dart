import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/emoji/mastodon_api_emoji_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_emoji_model.g.dart';

abstract class IPleromaApiEmoji extends IMastodonApiEmoji {}

abstract class IPleromaApiCustomEmoji {
  List<String>? get tags;

  String get imageUrl;

  String get name;
}

extension IPleromaApiEmojiExtension on IPleromaApiEmoji {
  PleromaApiEmoji toPleromaApiEmoji({bool forceNewObject = false}) {
    if (this is PleromaApiEmoji && !forceNewObject) {
      return this as PleromaApiEmoji;
    } else {
      return PleromaApiEmoji(
        shortcode: shortcode,
        url: url,
        staticUrl: staticUrl,
        visibleInPicker: visibleInPicker,
        category: category,
      );
    }
  }
}

extension IPleromaEmojiListExtension on List<IPleromaApiEmoji> {
  List<PleromaApiEmoji> toPleromaApiEmojis({bool forceNewObject = false}) {
    if (this is List<PleromaApiEmoji> && !forceNewObject) {
      return this as List<PleromaApiEmoji>;
    } else {
      return map(
        (emoji) => emoji.toPleromaApiEmoji(forceNewObject: forceNewObject),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 38)
@JsonSerializable()
class PleromaApiEmoji implements IPleromaApiEmoji, IJsonObject {
  @override
  @HiveField(0)
  final String? shortcode;
  @override
  @HiveField(1)
  final String? url;
  @override
  @HiveField(2)
  @JsonKey(name: "static_url")
  final String? staticUrl;
  @override
  @JsonKey(name: "visible_in_picker")
  @HiveField(3)
  final bool? visibleInPicker;
  @override
  @HiveField(4)
  final String? category;

  PleromaApiEmoji({
    required this.shortcode,
    required this.url,
    required this.staticUrl,
    required this.visibleInPicker,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiEmoji &&
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
    return 'PleromaApiEmoji{'
        'shortcode: $shortcode, '
        'url: $url, '
        'staticUrl: $staticUrl, '
        'visibleInPicker: $visibleInPicker, '
        'category: $category'
        '}';
  }

  static PleromaApiEmoji fromJson(Map<String, dynamic> json) =>
      _$PleromaApiEmojiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiEmojiToJson(this);
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 76)
@JsonSerializable()
class PleromaApiCustomEmoji implements IPleromaApiCustomEmoji, IJsonObject {
  @override
  @HiveField(0)
  final List<String>? tags;
  @override
  @HiveField(1)
  @JsonKey(name: "image_url")
  final String imageUrl;

  @override
  @HiveField(2)
  final String name;

  PleromaApiCustomEmoji({
    required this.tags,
    required this.imageUrl,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiCustomEmoji &&
          runtimeType == other.runtimeType &&
          listEquals(tags, other.tags) &&
          imageUrl == other.imageUrl &&
          name == other.name;

  @override
  int get hashCode => listHash(tags) ^ imageUrl.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'PleromaApiCustomEmoji{'
        'tags: $tags, '
        'imageUrl: $imageUrl, '
        'name: $name'
        '}';
  }

  static PleromaApiCustomEmoji fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCustomEmojiFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiCustomEmojiToJson(this);
}
