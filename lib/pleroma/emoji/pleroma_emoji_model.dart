import 'dart:convert';

import 'package:fedi/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_emoji_model.g.dart';

abstract class IPleromaEmoji extends IMastodonEmoji {}

abstract class IPleromaCustomEmoji {
  List<String> get tags;

  String get imageUrl;
}

@HiveType()
@JsonSerializable()
class PleromaEmoji implements IPleromaEmoji {
  @override
  @HiveField(0)
  String shortcode;
  @override
  @HiveField(1)
  String url;
  @override
  @HiveField(2)
  @JsonKey(name: "static_url")
  String staticUrl;
  @override
  @JsonKey(name: "visible_in_picker")
  @HiveField(3)
  bool visibleInPicker;
  @override
  @HiveField(4)
  String category;

  PleromaEmoji(
      {this.shortcode, this.url, this.staticUrl, this.visibleInPicker});

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

@HiveType()
@JsonSerializable()
class PleromaCustomEmoji implements IPleromaCustomEmoji {
  @override
  @HiveField(0)
  List<String> tags;
  @override
  @HiveField(1)
  @JsonKey(name: "image_url")
  String imageUrl;

  PleromaCustomEmoji({
    this.tags,
    this.imageUrl,
  });

  @override
  String toString() {
    return 'PleromaCustomEmoji{tags: $tags, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaCustomEmoji &&
          runtimeType == other.runtimeType &&
          tags == other.tags &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => tags.hashCode ^ imageUrl.hashCode;

  factory PleromaCustomEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaCustomEmojiFromJson(json);

  static List<PleromaCustomEmoji> listFromJsonString(String str) =>
      List<PleromaCustomEmoji>.from(
          json.decode(str).map((x) => PleromaCustomEmoji.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaCustomEmojiToJson(this);
}
