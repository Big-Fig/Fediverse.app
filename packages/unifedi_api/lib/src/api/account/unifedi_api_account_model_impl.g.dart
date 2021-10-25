// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountAdapter extends TypeAdapter<UnifediApiAccount> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccount(
      username: fields[0] as String,
      url: fields[1] as String,
      statusesCount: fields[2] as int?,
      note: fields[3] as String?,
      locked: fields[4] as bool?,
      id: fields[5] as String,
      headerStatic: fields[6] as String?,
      header: fields[7] as String?,
      followingCount: fields[8] as int?,
      followersCount: fields[9] as int?,
      fields: (fields[10] as List?)?.cast<UnifediApiField>(),
      emojis: (fields[11] as List?)?.cast<UnifediApiEmoji>(),
      displayName: fields[12] as String?,
      createdAt: fields[13] as DateTime,
      bot: fields[14] as bool?,
      avatarStatic: fields[15] as String,
      avatar: fields[16] as String,
      acct: fields[17] as String,
      lastStatusAt: fields[20] as DateTime?,
      fqn: fields[21] as String?,
      suspended: fields[22] as bool?,
      muteExpiresAt: fields[23] as DateTime?,
      backgroundImage: fields[24] as String?,
      tags: (fields[25] as List?)?.cast<UnifediApiTag>(),
      relationship: fields[26] as UnifediApiAccountRelationship?,
      isAdmin: fields[27] as bool?,
      isModerator: fields[28] as bool?,
      confirmationPending: fields[30] as bool?,
      hideFavorites: fields[31] as bool?,
      hideFollowers: fields[32] as bool?,
      hideFollows: fields[34] as bool?,
      hideFollowersCount: fields[35] as bool?,
      hideFollowsCount: fields[36] as bool?,
      deactivated: fields[39] as bool?,
      allowFollowingMove: fields[40] as bool?,
      skipThreadContainment: fields[41] as bool?,
      acceptsChatMessages: fields[42] as bool?,
      isConfirmed: fields[43] as bool?,
      favicon: fields[44] as String?,
      apId: fields[45] as String?,
      alsoKnownAs: (fields[46] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccount obj) {
    writer
      ..writeByte(41)
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
      ..writeByte(10)
      ..write(obj.fields)
      ..writeByte(11)
      ..write(obj.emojis)
      ..writeByte(21)
      ..write(obj.fqn)
      ..writeByte(24)
      ..write(obj.backgroundImage)
      ..writeByte(25)
      ..write(obj.tags)
      ..writeByte(26)
      ..write(obj.relationship)
      ..writeByte(27)
      ..write(obj.isAdmin)
      ..writeByte(28)
      ..write(obj.isModerator)
      ..writeByte(30)
      ..write(obj.confirmationPending)
      ..writeByte(31)
      ..write(obj.hideFavorites)
      ..writeByte(32)
      ..write(obj.hideFollowers)
      ..writeByte(34)
      ..write(obj.hideFollows)
      ..writeByte(35)
      ..write(obj.hideFollowersCount)
      ..writeByte(36)
      ..write(obj.hideFollowsCount)
      ..writeByte(39)
      ..write(obj.deactivated)
      ..writeByte(40)
      ..write(obj.allowFollowingMove)
      ..writeByte(42)
      ..write(obj.acceptsChatMessages)
      ..writeByte(41)
      ..write(obj.skipThreadContainment)
      ..writeByte(43)
      ..write(obj.isConfirmed)
      ..writeByte(44)
      ..write(obj.favicon)
      ..writeByte(45)
      ..write(obj.apId)
      ..writeByte(46)
      ..write(obj.alsoKnownAs)
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
      other is UnifediApiAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccount _$$_UnifediApiAccountFromJson(Map<String, dynamic> json) =>
    _$_UnifediApiAccount(
      username: json['username'] as String,
      url: json['url'] as String,
      statusesCount: json['statuses_count'] as int?,
      note: json['note'] as String?,
      locked: json['locked'] as bool?,
      id: json['id'] as String,
      headerStatic: json['header_static'] as String?,
      header: json['header'] as String?,
      followingCount: json['following_count'] as int?,
      followersCount: json['followers_count'] as int?,
      fields: (json['fields'] as List<dynamic>?)
          ?.map((e) => UnifediApiField.fromJson(e as Map<String, dynamic>))
          .toList(),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => UnifediApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayName: json['display_name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      bot: json['bot'] as bool?,
      avatarStatic: json['avatar_static'] as String,
      avatar: json['avatar'] as String,
      acct: json['acct'] as String,
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      fqn: json['fqn'] as String?,
      suspended: json['suspended'] as bool?,
      muteExpiresAt: json['mute_expires_at'] == null
          ? null
          : DateTime.parse(json['mute_expires_at'] as String),
      backgroundImage: json['background_image'] as String?,
      tags: UnifediApiTag.fromJsonListOrNullOnError(json['tags']),
      relationship: UnifediApiAccountRelationship.fromJsonOrNullOnError(
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
      apId: json['apId'] as String?,
      alsoKnownAs: UnifediApiAccount.fromJsonAlsoKnownAsListOrNullOnError(
          json['also_known_as']),
    );

Map<String, dynamic> _$$_UnifediApiAccountToJson(
    _$_UnifediApiAccount instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('statuses_count', instance.statusesCount);
  writeNotNull('note', instance.note);
  writeNotNull('locked', instance.locked);
  val['id'] = instance.id;
  writeNotNull('header_static', instance.headerStatic);
  writeNotNull('header', instance.header);
  writeNotNull('following_count', instance.followingCount);
  writeNotNull('followers_count', instance.followersCount);
  writeNotNull('fields', instance.fields?.map((e) => e.toJson()).toList());
  writeNotNull('emojis', instance.emojis?.map((e) => e.toJson()).toList());
  writeNotNull('display_name', instance.displayName);
  val['created_at'] = instance.createdAt.toIso8601String();
  writeNotNull('bot', instance.bot);
  val['avatar_static'] = instance.avatarStatic;
  val['avatar'] = instance.avatar;
  val['acct'] = instance.acct;
  writeNotNull('last_status_at', instance.lastStatusAt?.toIso8601String());
  writeNotNull('fqn', instance.fqn);
  writeNotNull('suspended', instance.suspended);
  writeNotNull('mute_expires_at', instance.muteExpiresAt?.toIso8601String());
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
  writeNotNull('apId', instance.apId);
  writeNotNull('also_known_as', instance.alsoKnownAs);
  return val;
}
