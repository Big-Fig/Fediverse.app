// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_pleroma.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusPleroma _$StatusPleromaFromJson(Map<String, dynamic> json) {
  return StatusPleroma(
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    conversationId: json['conversation_id'] as int,
    directConversationId: json['direct_converstaion_id'],
    emojiReactions: (json['emoji_reactions'] as List)
        ?.map((e) => e == null
            ? null
            : EmojiReaction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    expiresAt: json['expires_at'],
    inReplyToAccountAcct: json['in_reply_to_account_acct'],
    local: json['local'] as bool,
    spoilerText: json['spoiler_text'] == null
        ? null
        : Content.fromJson(json['spoiler_text'] as Map<String, dynamic>),
    threadMuted: json['thread_muted'] as bool,
  );
}

Map<String, dynamic> _$StatusPleromaToJson(StatusPleroma instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('conversation_id', instance.conversationId);
  writeNotNull('direct_converstaion_id', instance.directConversationId);
  writeNotNull('emoji_reactions', instance.emojiReactions);
  writeNotNull('expires_at', instance.expiresAt);
  writeNotNull('in_reply_to_account_acct', instance.inReplyToAccountAcct);
  writeNotNull('local', instance.local);
  writeNotNull('spoiler_text', instance.spoilerText);
  writeNotNull('thread_muted', instance.threadMuted);
  return val;
}
