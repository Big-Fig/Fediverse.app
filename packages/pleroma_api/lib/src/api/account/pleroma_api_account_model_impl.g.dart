// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccountAdapter extends TypeAdapter<PleromaApiAccount> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccount(
      username: fields[0] as String,
      url: fields[1] as String,
      statusesCount: fields[2] as int,
      note: fields[3] as String?,
      locked: fields[4] as bool,
      id: fields[5] as String,
      headerStatic: fields[6] as String,
      header: fields[7] as String,
      followingCount: fields[8] as int,
      followersCount: fields[9] as int,
      fields: (fields[10] as List?)?.cast<PleromaApiField>(),
      emojis: (fields[11] as List?)?.cast<PleromaApiEmoji>(),
      displayName: fields[12] as String?,
      createdAt: fields[13] as DateTime,
      bot: fields[14] as bool?,
      avatarStatic: fields[15] as String,
      avatar: fields[16] as String,
      acct: fields[17] as String,
      pleroma: fields[19] as PleromaApiAccountPleromaPart?,
      lastStatusAt: fields[20] as DateTime?,
      fqn: fields[21] as String?,
      suspended: fields[22] as bool?,
      muteExpiresAt: fields[23] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccount obj) {
    writer
      ..writeByte(23)
      ..writeByte(10)
      ..write(obj.fields)
      ..writeByte(11)
      ..write(obj.emojis)
      ..writeByte(19)
      ..write(obj.pleroma)
      ..writeByte(21)
      ..write(obj.fqn)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.statusesCount)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(14)
      ..write(obj.bot)
      ..writeByte(4)
      ..write(obj.locked)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.headerStatic)
      ..writeByte(7)
      ..write(obj.header)
      ..writeByte(8)
      ..write(obj.followingCount)
      ..writeByte(9)
      ..write(obj.followersCount)
      ..writeByte(12)
      ..write(obj.displayName)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(15)
      ..write(obj.avatarStatic)
      ..writeByte(16)
      ..write(obj.avatar)
      ..writeByte(17)
      ..write(obj.acct)
      ..writeByte(20)
      ..write(obj.lastStatusAt)
      ..writeByte(22)
      ..write(obj.suspended)
      ..writeByte(23)
      ..write(obj.muteExpiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiAccountPleromaPartAdapter
    extends TypeAdapter<PleromaApiAccountPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccountPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccountPleromaPart(
      backgroundImage: fields[1] as String?,
      tags: (fields[2] as List?)?.cast<PleromaApiTag>(),
      relationship: fields[3] as PleromaApiAccountRelationship?,
      isAdmin: fields[4] as bool?,
      isModerator: fields[5] as bool?,
      confirmationPending: fields[7] as bool?,
      hideFavorites: fields[8] as bool?,
      hideFollowers: fields[9] as bool?,
      hideFollows: fields[11] as bool?,
      hideFollowersCount: fields[12] as bool?,
      hideFollowsCount: fields[13] as bool?,
      deactivated: fields[16] as bool?,
      allowFollowingMove: fields[17] as bool?,
      skipThreadContainment: fields[18] as bool?,
      acceptsChatMessages: fields[19] as bool?,
      isConfirmed: fields[20] as bool?,
      favicon: fields[21] as String?,
      apId: fields[22] as String?,
      alsoKnownAs: (fields[23] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccountPleromaPart obj) {
    writer
      ..writeByte(19)
      ..writeByte(1)
      ..write(obj.backgroundImage)
      ..writeByte(2)
      ..write(obj.tags)
      ..writeByte(3)
      ..write(obj.relationship)
      ..writeByte(4)
      ..write(obj.isAdmin)
      ..writeByte(5)
      ..write(obj.isModerator)
      ..writeByte(7)
      ..write(obj.confirmationPending)
      ..writeByte(8)
      ..write(obj.hideFavorites)
      ..writeByte(9)
      ..write(obj.hideFollowers)
      ..writeByte(11)
      ..write(obj.hideFollows)
      ..writeByte(12)
      ..write(obj.hideFollowersCount)
      ..writeByte(13)
      ..write(obj.hideFollowsCount)
      ..writeByte(16)
      ..write(obj.deactivated)
      ..writeByte(17)
      ..write(obj.allowFollowingMove)
      ..writeByte(19)
      ..write(obj.acceptsChatMessages)
      ..writeByte(18)
      ..write(obj.skipThreadContainment)
      ..writeByte(20)
      ..write(obj.isConfirmed)
      ..writeByte(21)
      ..write(obj.favicon)
      ..writeByte(22)
      ..write(obj.apId)
      ..writeByte(23)
      ..write(obj.alsoKnownAs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccount _$$_PleromaApiAccountFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiAccount(
      username: json['username'] as String,
      url: json['url'] as String,
      statusesCount: json['statuses_count'] as int,
      note: json['note'] as String?,
      locked: json['locked'] as bool,
      id: json['id'] as String,
      headerStatic: json['header_static'] as String,
      header: json['header'] as String,
      followingCount: json['following_count'] as int,
      followersCount: json['followers_count'] as int,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => PleromaApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => PleromaApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayName: json['display_name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      bot: json['bot'] as bool?,
      avatarStatic: json['avatar_static'] as String,
      avatar: json['avatar'] as String,
      acct: json['acct'] as String,
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiAccountPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      fqn: json['fqn'] as String?,
      suspended: json['suspended'] as bool?,
      muteExpiresAt: json['mute_expires_at'] == null
          ? null
          : DateTime.parse(json['mute_expires_at'] as String),
    );

Map<String, dynamic> _$$_PleromaApiAccountToJson(
    _$_PleromaApiAccount instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'url': instance.url,
    'statuses_count': instance.statusesCount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('note', instance.note);
  val['locked'] = instance.locked;
  val['id'] = instance.id;
  val['header_static'] = instance.headerStatic;
  val['header'] = instance.header;
  val['following_count'] = instance.followingCount;
  val['followers_count'] = instance.followersCount;
  writeNotNull('fields', instance.fields?.map((e) => e.toJson()).toList());
  writeNotNull('emojis', instance.emojis?.map((e) => e.toJson()).toList());
  writeNotNull('display_name', instance.displayName);
  val['created_at'] = instance.createdAt.toIso8601String();
  writeNotNull('bot', instance.bot);
  val['avatar_static'] = instance.avatarStatic;
  val['avatar'] = instance.avatar;
  val['acct'] = instance.acct;
  writeNotNull('pleroma', instance.pleroma?.toJson());
  writeNotNull('last_status_at', instance.lastStatusAt?.toIso8601String());
  writeNotNull('fqn', instance.fqn);
  writeNotNull('suspended', instance.suspended);
  writeNotNull('mute_expires_at', instance.muteExpiresAt?.toIso8601String());
  return val;
}

_$_PleromaApiAccountPleromaPart _$$_PleromaApiAccountPleromaPartFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccountPleromaPart(
      backgroundImage: json['background_image'] as String?,
      tags: PleromaApiTag.fromJsonListOrNullOnError(json['tags']),
      relationship: PleromaApiAccountRelationship.fromJsonOrNullOnError(
          json['relationship'] as Map<String, dynamic>?),
      isAdmin: json['is_admin'] as bool?,
      isModerator: json['is_moderator'] as bool?,
      confirmationPending: json['confirmation_pending'] as bool?,
      hideFavorites: json['hide_favorites'] as bool?,
      hideFollowers: json['hide_followers'] as bool?,
      hideFollows: json['hide_follows'] as bool?,
      hideFollowersCount: json['hide_followers_count'] as bool?,
      hideFollowsCount: json['hide_follows_count'] as bool?,
      deactivated: json['deactivated'] as bool?,
      allowFollowingMove: json['allow_following_move'] as bool?,
      skipThreadContainment: json['skip_thread_containment'] as bool?,
      acceptsChatMessages: json['accepts_chat_messages'] as bool?,
      isConfirmed: json['is_confirmed'] as bool?,
      favicon: json['favicon'] as String?,
      apId: json['ap_id'] as String?,
      alsoKnownAs:
          PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError(
              json['also_known_as']),
    );

Map<String, dynamic> _$$_PleromaApiAccountPleromaPartToJson(
    _$_PleromaApiAccountPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('background_image', instance.backgroundImage);
  writeNotNull('tags', instance.tags?.map((e) => e.toJson()).toList());
  writeNotNull('relationship', instance.relationship?.toJson());
  writeNotNull('is_admin', instance.isAdmin);
  writeNotNull('is_moderator', instance.isModerator);
  writeNotNull('confirmation_pending', instance.confirmationPending);
  writeNotNull('hide_favorites', instance.hideFavorites);
  writeNotNull('hide_followers', instance.hideFollowers);
  writeNotNull('hide_follows', instance.hideFollows);
  writeNotNull('hide_followers_count', instance.hideFollowersCount);
  writeNotNull('hide_follows_count', instance.hideFollowsCount);
  writeNotNull('deactivated', instance.deactivated);
  writeNotNull('allow_following_move', instance.allowFollowingMove);
  writeNotNull('skip_thread_containment', instance.skipThreadContainment);
  writeNotNull('accepts_chat_messages', instance.acceptsChatMessages);
  writeNotNull('is_confirmed', instance.isConfirmed);
  writeNotNull('favicon', instance.favicon);
  writeNotNull('ap_id', instance.apId);
  writeNotNull('also_known_as', instance.alsoKnownAs);
  return val;
}
