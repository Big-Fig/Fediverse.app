// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    name: const NameTypeConverter().fromJson(json['name'] as String),
    website: json['website'],
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'name': const NameTypeConverter().toJson(instance.name),
      'website': instance.website,
    };

Mention _$MentionFromJson(Map<String, dynamic> json) {
  return Mention(
    acct: json['acct'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$MentionToJson(Mention instance) => <String, dynamic>{
      'acct': instance.acct,
      'id': instance.id,
      'url': instance.url,
      'username': instance.username,
    };

StatusPleroma _$StatusPleromaFromJson(Map<String, dynamic> json) {
  return StatusPleroma(
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    conversationId: json['conversation_id'] as int,
    inReplyToAccountAcct: json['in_reply_to_account_acct'] as String,
    local: json['local'] as bool,
    spoilerText: json['spoiler_text'] == null
        ? null
        : Content.fromJson(json['spoiler_text'] as Map<String, dynamic>),
  )
    ..directConversationId = json['direct_conversation_id'] as int
    ..expiresAt = json['expires_at']
    ..threadMuted = json['thread_muted'] as bool
    ..emojiReactions = (json['emoji_reactions'] as List)
        ?.map((e) => e == null
            ? null
            : EmojiReactions.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$StatusPleromaToJson(StatusPleroma instance) =>
    <String, dynamic>{
      'content': instance.content,
      'conversation_id': instance.conversationId,
      'direct_conversation_id': instance.directConversationId,
      'in_reply_to_account_acct': instance.inReplyToAccountAcct,
      'local': instance.local,
      'spoiler_text': instance.spoilerText,
      'expires_at': instance.expiresAt,
      'thread_muted': instance.threadMuted,
      'emoji_reactions': instance.emojiReactions,
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    textPlain: json['text/plain'] as String,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'text/plain': instance.textPlain,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
