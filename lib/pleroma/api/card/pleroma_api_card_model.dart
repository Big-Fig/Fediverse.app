import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/card/mastodon_api_card_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_card_model.g.dart';

abstract class IPleromaApiCard implements IMastodonApiCard {}

extension IPleromaApiCardExtension on IPleromaApiCard {
  PleromaApiCard toPleromaApiCard({bool forceNewObject = false}) {
    if (this is PleromaApiCard && !forceNewObject) {
      return this as PleromaApiCard;
    } else {
      return PleromaApiCard(
        authorName: authorName,
        authorUrl: authorUrl,
        description: description,
        embedUrl: embedUrl,
        height: height,
        html: html,
        image: image,
        providerName: providerName,
        providerUrl: providerUrl,
        title: title,
        type: type,
        url: url,
        width: width,
      );
    }
  }
}

@JsonSerializable()
class PleromaApiCard implements IPleromaApiCard, IJsonObject {
  @override
  @JsonKey(name: "author_name")
  final String? authorName;

  @override
  @JsonKey(name: "author_url")
  final String? authorUrl;

  @override
  final String? description;

  @override
  @JsonKey(name: "embed_url")
  final String? embedUrl;

  @override
  final int? height;

  @override
  final String? html;

  @override
  final String? image;

  @override
  @JsonKey(name: "provider_name")
  final String? providerName;

  @override
  @JsonKey(name: "provider_url")
  final String? providerUrl;

  @override
  final String? title;

  @override
  final String? type;

  @override
  MastodonApiCardType? get typeAsMastodonApi => type?.toMastodonApiCardType();

  @override
  final String? url;

  @override
  final int? width;

  PleromaApiCard({
    required this.authorName,
    required this.authorUrl,
    required this.description,
    required this.embedUrl,
    required this.height,
    required this.html,
    required this.image,
    required this.providerName,
    required this.providerUrl,
    required this.title,
    required this.type,
    required this.url,
    required this.width,
  });

  PleromaApiCard.only({
    this.authorName,
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
    this.width,
  });

  static PleromaApiCard fromJson(Map<String, dynamic> json) =>
      _$PleromaApiCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiCardToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiCard &&
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
    return 'PleromaApiCard{'
        'authorName: $authorName, '
        'authorUrl: $authorUrl, '
        'description: $description, '
        'embedUrl: $embedUrl, '
        'height: $height, '
        'html: $html, '
        'image: $image, '
        'providerName: $providerName, '
        'providerUrl: $providerUrl, '
        'title: $title, '
        'type: $type, '
        'url: $url, '
        'width: $width'
        '}';
  }
}
