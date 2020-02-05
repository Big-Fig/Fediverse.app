
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Emoji.g.dart';

@HiveType()
@JsonSerializable()
class Emoji {
  @HiveField(0)
  String shortcode;
  @HiveField(1)
  String url;

  Emoji({this.shortcode, this.url});

  factory Emoji.fromJson(Map<String, dynamic> json) =>
      _$EmojiFromJson(json);

  Map<String, dynamic> toJson() => _$EmojiToJson(this);
}
