// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiStatusAdapter extends TypeAdapter<PleromaApiStatus> {
  @override
  final int typeId = 0;

  @override
  PleromaApiStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiStatus(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      inReplyToId: fields[2] as String?,
      inReplyToAccountId: fields[3] as String?,
      sensitive: fields[4] as bool,
      spoilerText: fields[5] as String?,
      uri: fields[6] as String,
      url: fields[7] as String?,
      repliesCount: fields[8] as int?,
      reblogsCount: fields[9] as int?,
      favouritesCount: fields[10] as int?,
      favourited: fields[11] as bool?,
      reblogged: fields[12] as bool?,
      muted: fields[13] as bool?,
      bookmarked: fields[14] as bool?,
      pinned: fields[15] as bool?,
      content: fields[16] as String?,
      reblog: fields[17] as PleromaApiStatus?,
      application: fields[18] as PleromaApiApplication?,
      account: fields[19] as PleromaApiAccount,
      mediaAttachments:
          (fields[20] as List?)?.cast<PleromaApiMediaAttachment>(),
      mentions: (fields[21] as List?)?.cast<PleromaApiMention>(),
      tags: (fields[22] as List?)?.cast<PleromaApiTag>(),
      emojis: (fields[23] as List?)?.cast<PleromaApiEmoji>(),
      poll: fields[24] as PleromaApiPoll?,
      card: fields[25] as PleromaApiCard?,
      pleroma: fields[26] as PleromaApiStatusPleromaPart?,
      language: fields[27] as String?,
      visibility: fields[28] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiStatus obj) {
    writer
      ..writeByte(29)
      ..writeByte(18)
      ..write(obj.application)
      ..writeByte(19)
      ..write(obj.account)
      ..writeByte(20)
      ..write(obj.mediaAttachments)
      ..writeByte(21)
      ..write(obj.mentions)
      ..writeByte(22)
      ..write(obj.tags)
      ..writeByte(23)
      ..write(obj.emojis)
      ..writeByte(24)
      ..write(obj.poll)
      ..writeByte(25)
      ..write(obj.card)
      ..writeByte(17)
      ..write(obj.reblog)
      ..writeByte(26)
      ..write(obj.pleroma)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.inReplyToId)
      ..writeByte(3)
      ..write(obj.inReplyToAccountId)
      ..writeByte(4)
      ..write(obj.sensitive)
      ..writeByte(5)
      ..write(obj.spoilerText)
      ..writeByte(28)
      ..write(obj.visibility)
      ..writeByte(6)
      ..write(obj.uri)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(8)
      ..write(obj.repliesCount)
      ..writeByte(9)
      ..write(obj.reblogsCount)
      ..writeByte(10)
      ..write(obj.favouritesCount)
      ..writeByte(11)
      ..write(obj.favourited)
      ..writeByte(12)
      ..write(obj.reblogged)
      ..writeByte(13)
      ..write(obj.muted)
      ..writeByte(14)
      ..write(obj.bookmarked)
      ..writeByte(15)
      ..write(obj.pinned)
      ..writeByte(16)
      ..write(obj.content)
      ..writeByte(27)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiStatusPleromaPartAdapter
    extends TypeAdapter<PleromaApiStatusPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiStatusPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiStatusPleromaPart(
      content: fields[0] as PleromaApiContentVariants?,
      conversationId: fields[1] as int?,
      directConversationId: fields[2] as int?,
      inReplyToAccountAcct: fields[3] as String?,
      local: fields[4] as bool?,
      spoilerText: fields[5] as PleromaApiContentVariants?,
      expiresAt: fields[6] as DateTime?,
      threadMuted: fields[7] as bool?,
      emojiReactions:
          (fields[8] as List?)?.cast<PleromaApiStatusEmojiReaction>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiStatusPleromaPart obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.conversationId)
      ..writeByte(2)
      ..write(obj.directConversationId)
      ..writeByte(3)
      ..write(obj.inReplyToAccountAcct)
      ..writeByte(4)
      ..write(obj.local)
      ..writeByte(5)
      ..write(obj.spoilerText)
      ..writeByte(6)
      ..write(obj.expiresAt)
      ..writeByte(7)
      ..write(obj.threadMuted)
      ..writeByte(8)
      ..write(obj.emojiReactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiStatus _$$_PleromaApiStatusFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiStatus(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      inReplyToId: json['in_reply_to_id'] as String?,
      inReplyToAccountId: json['in_reply_to_account_id'] as String?,
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String?,
      uri: json['uri'] as String,
      url: json['url'] as String?,
      repliesCount: json['replies_count'] as int?,
      reblogsCount: json['reblogs_count'] as int?,
      favouritesCount: json['favourites_count'] as int?,
      favourited: json['favourited'] as bool?,
      reblogged: json['reblogged'] as bool?,
      muted: json['muted'] as bool?,
      bookmarked: json['bookmarked'] as bool?,
      pinned: json['pinned'] as bool?,
      content: json['content'] as String?,
      reblog: json['reblog'] == null
          ? null
          : PleromaApiStatus.fromJson(json['reblog'] as Map<String, dynamic>),
      application: json['application'] == null
          ? null
          : PleromaApiApplication.fromJson(
              json['application'] as Map<String, dynamic>),
      account:
          PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      mediaAttachments: (json['media_attachments'] as List<dynamic>?)
          ?.map((e) =>
              PleromaApiMediaAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => PleromaApiMention.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => PleromaApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => PleromaApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      poll: json['poll'] == null
          ? null
          : PleromaApiPoll.fromJson(json['poll'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : PleromaApiCard.fromJson(json['card'] as Map<String, dynamic>),
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiStatusPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
      language: json['language'] as String?,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$$_PleromaApiStatusToJson(_$_PleromaApiStatus instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('in_reply_to_id', instance.inReplyToId);
  writeNotNull('in_reply_to_account_id', instance.inReplyToAccountId);
  val['sensitive'] = instance.sensitive;
  writeNotNull('spoiler_text', instance.spoilerText);
  val['uri'] = instance.uri;
  writeNotNull('url', instance.url);
  writeNotNull('replies_count', instance.repliesCount);
  writeNotNull('reblogs_count', instance.reblogsCount);
  writeNotNull('favourites_count', instance.favouritesCount);
  writeNotNull('favourited', instance.favourited);
  writeNotNull('reblogged', instance.reblogged);
  writeNotNull('muted', instance.muted);
  writeNotNull('bookmarked', instance.bookmarked);
  writeNotNull('pinned', instance.pinned);
  writeNotNull('content', instance.content);
  writeNotNull('reblog', instance.reblog?.toJson());
  writeNotNull('application', instance.application?.toJson());
  val['account'] = instance.account.toJson();
  writeNotNull('media_attachments',
      instance.mediaAttachments?.map((e) => e.toJson()).toList());
  writeNotNull('mentions', instance.mentions?.map((e) => e.toJson()).toList());
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('emojis', instance.emojis?.map((e) => e.toJson()).toList());
  writeNotNull('poll', instance.poll?.toJson());
  writeNotNull('card', instance.card?.toJson());
  writeNotNull('pleroma', instance.pleroma?.toJson());
  writeNotNull('language', instance.language);
  val['visibility'] = instance.visibility;
  return val;
}

_$_PleromaApiStatusPleromaPart _$$_PleromaApiStatusPleromaPartFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiStatusPleromaPart(
      content: json['content'] == null
          ? null
          : PleromaApiContentVariants.fromJson(
              json['content'] as Map<String, dynamic>),
      conversationId: json['conversation_id'] as int?,
      directConversationId: json['direct_conversation_id'] as int?,
      inReplyToAccountAcct: json['in_reply_to_account_acct'] as String?,
      local: json['local'] as bool?,
      spoilerText: json['spoiler_text'] == null
          ? null
          : PleromaApiContentVariants.fromJson(
              json['spoiler_text'] as Map<String, dynamic>),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      threadMuted: json['thread_muted'] as bool?,
      emojiReactions: (json['emoji_reactions'] as List<dynamic>?)
          ?.map((e) =>
              PleromaApiStatusEmojiReaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PleromaApiStatusPleromaPartToJson(
    _$_PleromaApiStatusPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull('conversation_id', instance.conversationId);
  writeNotNull('direct_conversation_id', instance.directConversationId);
  writeNotNull('in_reply_to_account_acct', instance.inReplyToAccountAcct);
  writeNotNull('local', instance.local);
  writeNotNull('spoiler_text', instance.spoilerText?.toJson());
  writeNotNull('expires_at', instance.expiresAt?.toIso8601String());
  writeNotNull('thread_muted', instance.threadMuted);
  writeNotNull('emoji_reactions',
      instance.emojiReactions?.map((e) => e.toJson()).toList());
  return val;
}
