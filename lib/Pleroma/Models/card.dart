import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
    String url;
    String title;
    String description;
    String type;
    @JsonKey(name: "author_name")
    String authorName;
    String authorUrl;
    @JsonKey(name: "provider_name")
    String providerName;
    @JsonKey(name: "provider_url")
    String providerUrl;
    String html;
    int width;
    int height;
    String image;
    @JsonKey(name: "embed_url")
    String embedUrl;

    Card({this.url, this.title, this.description, this.type, this.authorName, this.authorUrl, this.providerName, this.providerUrl, this.html, this.width, this.height, this.image, this.embedUrl});
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);

}