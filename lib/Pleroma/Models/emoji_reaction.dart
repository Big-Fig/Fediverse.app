import 'package:json_annotation/json_annotation.dart';

part 'emoji_reaction.g.dart';

@JsonSerializable()
class EmojiReaction {
    int count;
    bool me;
    String name;

    EmojiReaction({
        this.count,
        this.me,
        this.name,
    });

      factory EmojiReaction.fromJson(Map<String, dynamic> json) =>
        _$EmojiReactionFromJson(json);

    Map<String, dynamic> toJson() => _$EmojiReactionToJson(this);

}
