import 'package:fedi/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_emoji_model.g.dart';

abstract class IPleromaEmoji implements IMastodonEmoji {}

abstract class IPleromaEmojiReactions implements IMastodonEmojiReactions {}

@HiveType()
@JsonSerializable()
class PleromaEmoji implements IPleromaEmoji {
  @HiveField(0)
  String shortcode;
  @HiveField(1)
  String url;
  @HiveField(2)
  @JsonKey(name:"static_url")
  String staticUrl;
  @JsonKey(name:"visible_in_picker")
  @HiveField(3)
  bool visibleInPicker;
  @HiveField(4)
  String category;


  PleromaEmoji({this.shortcode, this.url, this.staticUrl, this.visibleInPicker});

  factory PleromaEmoji.fromJson(Map<String, dynamic> json) =>
      _$PleromaEmojiFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaEmojiToJson(this);
}

@JsonSerializable()
class PleromaEmojiReactions implements IPleromaEmojiReactions {
  final String name;
  final int count;
  final bool me;

  PleromaEmojiReactions({this.name, this.count, this.me});

  factory PleromaEmojiReactions.fromJson(Map<String, dynamic> json) =>
      _$PleromaEmojiReactionsFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaEmojiReactionsToJson(this);
}
