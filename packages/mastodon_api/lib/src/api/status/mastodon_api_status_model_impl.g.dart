// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_status_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiStatusAdapter extends TypeAdapter<MastodonApiStatus> {
  @override
  final int typeId = 0;

  @override
  MastodonApiStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiStatus(
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
      reblog: fields[17] as MastodonApiStatus?,
      application: fields[18] as MastodonApiApplication?,
      account: fields[19] as MastodonApiAccount,
      mediaAttachments:
          (fields[20] as List?)?.cast<MastodonApiMediaAttachment>(),
      mentions: (fields[21] as List?)?.cast<MastodonApiMention>(),
      tags: (fields[22] as List?)?.cast<MastodonApiTag>(),
      emojis: (fields[23] as List?)?.cast<MastodonApiEmoji>(),
      poll: fields[24] as MastodonApiPoll?,
      card: fields[25] as MastodonApiCard?,
      language: fields[27] as String?,
      visibility: fields[28] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiStatus obj) {
    writer
      ..writeByte(28)
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
      ..writeByte(17)
      ..write(obj.reblog)
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
      ..writeByte(27)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiStatus _$$_MastodonApiStatusFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiStatus(
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
          : MastodonApiStatus.fromJson(json['reblog'] as Map<String, dynamic>),
      application: json['application'] == null
          ? null
          : MastodonApiApplication.fromJson(
              json['application'] as Map<String, dynamic>),
      account:
          MastodonApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      mediaAttachments: (json['media_attachments'] as List<dynamic>?)
          ?.map((e) =>
              MastodonApiMediaAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => MastodonApiMention.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => MastodonApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => MastodonApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      poll: json['poll'] == null
          ? null
          : MastodonApiPoll.fromJson(json['poll'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : MastodonApiCard.fromJson(json['card'] as Map<String, dynamic>),
      language: json['language'] as String?,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$$_MastodonApiStatusToJson(
    _$_MastodonApiStatus instance) {
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
  writeNotNull('language', instance.language);
  val['visibility'] = instance.visibility;
  return val;
}
