import 'dart:convert';

import 'package:fedi/mastodon/card/mastodon_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_card_model.g.dart';

abstract class IPleromaCard implements IMastodonCard {}

@JsonSerializable()
class PleromaCard implements IPleromaCard {
  @override
  @JsonKey(name: "author_name")
  String authorName;

  @override
  @JsonKey(name: "author_url")
  String authorUrl;

  @override
  String description;

  @override
  @JsonKey(name: "embed_url")
  String embedUrl;

  @override
  int height;

  @override
  String html;

  @override
  String image;

  @override
  @JsonKey(name: "provider_name")
  String providerName;

  @override
  @JsonKey(name: "provider_url")
  String providerUrl;

  @override
  String title;

  @override
  MastodonCardType type;

  @override
  String url;

  @override
  int width;

  PleromaCard(
      {this.authorName,
      this.authorUrl,
      this.description,
      this.embedUrl,
      this.height,
      this.html,
      this.image,
      this.providerName,
      this.providerUrl,
      this.title,
      this.type,
      this.url,
      this.width});

  factory PleromaCard.fromJson(Map<String, dynamic> json) =>
      _$PleromaCardFromJson(json);

  factory PleromaCard.fromJsonString(String jsonString) =>
      _$PleromaCardFromJson(jsonDecode(jsonString));

  static List<PleromaCard> listFromJsonString(String str) =>
      List<PleromaCard>.from(
          json.decode(str).map((x) => PleromaCard.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaCardToJson(this);

  String toJsonString() => jsonEncode(_$PleromaCardToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaCard &&
          runtimeType == other.runtimeType &&
          authorName == other.authorName &&
          authorUrl == other.authorUrl &&
          description == other.description &&
          embedUrl == other.embedUrl &&
          height == other.height &&
          html == other.html &&
          image == other.image &&
          providerName == other.providerName &&
          providerUrl == other.providerUrl &&
          title == other.title &&
          type == other.type &&
          url == other.url &&
          width == other.width;

  @override
  int get hashCode =>
      authorName.hashCode ^
      authorUrl.hashCode ^
      description.hashCode ^
      embedUrl.hashCode ^
      height.hashCode ^
      html.hashCode ^
      image.hashCode ^
      providerName.hashCode ^
      providerUrl.hashCode ^
      title.hashCode ^
      type.hashCode ^
      url.hashCode ^
      width.hashCode;

  @override
  String toString() {
    return 'PleromaCard{authorName: $authorName, authorUrl: $authorUrl,'
        ' description: $description, embedUrl: $embedUrl, height: $height,'
        ' html: $html, image: $image, providerName: $providerName,'
        ' providerUrl: $providerUrl, title: $title, type: $type,'
        ' url: $url, width: $width}';
  }
}
