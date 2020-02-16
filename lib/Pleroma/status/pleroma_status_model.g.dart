// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaStatus _$PleromaStatusFromJson(Map<String, dynamic> json) {
  return PleromaStatus(
    id: json['id'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    inReplyToId: json['in_reply_to_id'] as String,
    inReplyToAccountId: json['in_reply_to_account_id'] as String,
    sensitive: json['sensitive'] as bool,
    spoilerText: json['spoiler_text'] as String,
    uri: json['uri'] as String,
    url: json['url'] as String,
    repliesCount: json['replies_count'] as int,
    reblogsCount: json['reblogs_count'] as int,
    favouritesCount: json['favourites_count'] as int,
    favourited: json['favourited'] as bool,
    reblogged: json['reblogged'] as bool,
    muted: json['muted'] as bool,
    bookmarked: json['bookmarked'] as bool,
    content: json['content'] as String,
    reblog: json['reblog'] == null
        ? null
        : PleromaStatus.fromJson(json['reblog'] as Map<String, dynamic>),
    application: json['application'] == null
        ? null
        : PleromaApplication.fromJson(
            json['application'] as Map<String, dynamic>),
    account: json['account'] == null
        ? null
        : PleromaAccount.fromJson(json['account'] as Map<String, dynamic>),
    mediaAttachments: (json['media_attachments'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaMediaAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mentions: (json['mentions'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaMention.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : PleromaTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map((e) =>
            e == null ? null : PleromaEmoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    poll: json['poll'] == null
        ? null
        : PleromaPoll.fromJson(json['poll'] as Map<String, dynamic>),
    card: json['card'] == null
        ? null
        : PleromaCard.fromJson(json['card'] as Map<String, dynamic>),
    pleroma: json['pleroma'] == null
        ? null
        : PleromaStatusPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    visibilityRaw: json['visbility'] as String,
  );
}

Map<String, dynamic> _$PleromaStatusToJson(PleromaStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'in_reply_to_id': instance.inReplyToId,
      'in_reply_to_account_id': instance.inReplyToAccountId,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'uri': instance.uri,
      'url': instance.url,
      'replies_count': instance.repliesCount,
      'reblogs_count': instance.reblogsCount,
      'favourites_count': instance.favouritesCount,
      'favourited': instance.favourited,
      'reblogged': instance.reblogged,
      'muted': instance.muted,
      'bookmarked': instance.bookmarked,
      'content': instance.content,
      'reblog': instance.reblog,
      'application': instance.application,
      'account': instance.account,
      'media_attachments': instance.mediaAttachments,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis,
      'poll': instance.poll,
      'card': instance.card,
      'pleroma': instance.pleroma,
      'visbility': instance.visibilityRaw,
    };

PleromaStatusPleromaPart _$PleromaStatusPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaStatusPleromaPart(
    content: json['content'] == null
        ? null
        : PleromaContent.fromJson(json['content'] as Map<String, dynamic>),
    conversationId: json['conversation_id'] as int,
    inReplyToAccountAcct: json['in_reply_to_account_acct'] as String,
    local: json['local'] as bool,
    spoilerText: json['spoiler_text'] == null
        ? null
        : PleromaContent.fromJson(json['spoiler_text'] as Map<String, dynamic>),
  )
    ..directConversationId = json['direct_conversation_id'] as int
    ..expiresAt = json['expires_at']
    ..threadMuted = json['thread_muted'] as bool
    ..emojiReactions = (json['emoji_reactions'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaEmojiReactions.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PleromaStatusPleromaPartToJson(
        PleromaStatusPleromaPart instance) =>
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
