// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonStatus _$MastodonStatusFromJson(Map<String, dynamic> json) {
  return MastodonStatus(
    id: json['id'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    inReplyToId: json['in_reply_to_id'] as String,
    inReplyToAccountId: json['in_reply_to_account_id'] as String,
    sensitive: json['sensitive'] as bool,
    spoilerText: json['spoiler_text'] as String,
    visibilityRaw: json['visibility'] as String,
    uri: json['uri'] as String,
    url: json['url'] as String,
    repliesCount: json['replies_count'] as int,
    reblogsCount: json['reblogs_count'] as int,
    favouritesCount: json['favourites_count'] as int,
    favourited: json['favourited'] as bool,
    reblogged: json['reblogged'] as bool,
    muted: json['muted'] as bool,
    bookmarked: json['bookmarked'] as bool,
    pinned: json['pinned'] as bool,
    content: json['content'] as String,
    reblog: json['reblog'] == null
        ? null
        : Status.fromJson(json['reblog'] as Map<String, dynamic>),
    application: json['application'] == null
        ? null
        : Application.fromJson(json['application'] as Map<String, dynamic>),
    account: json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>),
    mediaAttachments: (json['media_attachments'] as List)
        ?.map((e) => e == null
            ? null
            : MediaAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mentions: (json['mentions'] as List)
        ?.map((e) =>
            e == null ? null : Mention.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map(
            (e) => e == null ? null : Emoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    poll: json['poll'],
  );
}

Map<String, dynamic> _$MastodonStatusToJson(MastodonStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'in_reply_to_id': instance.inReplyToId,
      'in_reply_to_account_id': instance.inReplyToAccountId,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'visibility': instance.visibilityRaw,
      'uri': instance.uri,
      'url': instance.url,
      'replies_count': instance.repliesCount,
      'reblogs_count': instance.reblogsCount,
      'favourites_count': instance.favouritesCount,
      'favourited': instance.favourited,
      'reblogged': instance.reblogged,
      'muted': instance.muted,
      'bookmarked': instance.bookmarked,
      'pinned': instance.pinned,
      'content': instance.content,
      'reblog': instance.reblog,
      'application': instance.application,
      'account': instance.account,
      'media_attachments': instance.mediaAttachments,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis,
      'poll': instance.poll,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    id: json['id'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    inReplyToId: json['in_reply_to_id'] as String,
    inReplyToAccountId: json['in_reply_to_account_id'] as String,
    sensitive: json['sensitive'] as bool,
    spoilerText: json['spoiler_text'] as String,
    visibilityRaw: json['visibility'] as String,
    uri: json['uri'] as String,
    url: json['url'] as String,
    repliesCount: json['replies_count'] as int,
    reblogsCount: json['reblogs_count'] as int,
    favouritesCount: json['favourites_count'] as int,
    favourited: json['favourited'] as bool,
    reblogged: json['reblogged'] as bool,
    muted: json['muted'] as bool,
    bookmarked: json['bookmarked'] as bool,
    pinned: json['pinned'] as bool,
    content: json['content'] as String,
    reblog: json['reblog'] == null
        ? null
        : Status.fromJson(json['reblog'] as Map<String, dynamic>),
    application: json['application'] == null
        ? null
        : Application.fromJson(json['application'] as Map<String, dynamic>),
    account: json['account'] == null
        ? null
        : Account.fromJson(json['account'] as Map<String, dynamic>),
    mediaAttachments: (json['media_attachments'] as List)
        ?.map((e) => e == null
            ? null
            : MediaAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mentions: (json['mentions'] as List)
        ?.map((e) =>
            e == null ? null : Mention.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map(
            (e) => e == null ? null : Emoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    poll: json['poll'],
    pleroma: json['pleroma'] == null
        ? null
        : StatusPleroma.fromJson(json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'in_reply_to_id': instance.inReplyToId,
      'in_reply_to_account_id': instance.inReplyToAccountId,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'visibility': instance.visibilityRaw,
      'uri': instance.uri,
      'url': instance.url,
      'replies_count': instance.repliesCount,
      'reblogs_count': instance.reblogsCount,
      'favourites_count': instance.favouritesCount,
      'favourited': instance.favourited,
      'reblogged': instance.reblogged,
      'muted': instance.muted,
      'bookmarked': instance.bookmarked,
      'pinned': instance.pinned,
      'content': instance.content,
      'reblog': instance.reblog,
      'application': instance.application,
      'account': instance.account,
      'media_attachments': instance.mediaAttachments,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis,
      'poll': instance.poll,
      'pleroma': instance.pleroma,
    };

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
