import 'dart:convert';

import 'package:fedi/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_emoji_model.g.dart';

abstract class IPleromaEmoji extends IMastodonEmoji {}

abstract class IPleromaCustomEmoji {
  List<String> get tags;

  String get imageUrl;

  String get name;
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 38)
@JsonSerializable()
class PleromaEmoji implements IPleromaEmoji {
  @override
  @HiveField(0)
  final String shortcode;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  @JsonKey(name: "static_url")
  final String staticUrl;
  @override
  @JsonKey(name: "visible_in_picker")
  @HiveField(3)
  final bool visibleInPicker;
  @override
  @HiveField(4)
  final String category;

  PleromaEmoji({
    @required this.shortcode,
    @required this.url,
    @required this.staticUrl,
    @required this.visibleInPicker,
    @required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaEmoji &&
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
    return 'PleromaEmoji{shortcode: $shortcode, url: $url,'
        ' staticUrl: $staticUrl,'
        ' visibleInPicker: $visibleInPicker, category: $category}';
  }

  factory PleromaEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaEmojiFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaEmojiToJson(this);
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 76)
@JsonSerializable()
class PleromaCustomEmoji implements IPleromaCustomEmoji {
  @override
  @HiveField(0)
  final List<String> tags;
  @override
  @HiveField(1)
  @JsonKey(name: "image_url")
  final String imageUrl;

  @override
  @HiveField(2)
  final String name;

  PleromaCustomEmoji({
    this.tags,
    this.imageUrl,
    this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaCustomEmoji &&
          runtimeType == other.runtimeType &&
          tags == other.tags &&
          imageUrl == other.imageUrl &&
          name == other.name;

  @override
  int get hashCode => tags.hashCode ^ imageUrl.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'PleromaCustomEmoji{tags: $tags, imageUrl: $imageUrl, name: $name}';
  }

  factory PleromaCustomEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaCustomEmojiFromJson(json);

  static List<PleromaCustomEmoji> listFromJsonString(String str) =>
      List<PleromaCustomEmoji>.from(
          json.decode(str).map((x) => PleromaCustomEmoji.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaCustomEmojiToJson(this);
}
