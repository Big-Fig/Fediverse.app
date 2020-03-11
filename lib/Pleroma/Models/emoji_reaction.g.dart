// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmojiReaction _$EmojiReactionFromJson(Map<String, dynamic> json) {
  return EmojiReaction(
    count: json['count'] as int,
    me: json['me'] as bool,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$EmojiReactionToJson(EmojiReaction instance) =>
    <String, dynamic>{
      'count': instance.count,
      'me': instance.me,
      'name': instance.name,
    };
