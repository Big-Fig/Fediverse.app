// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_my_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMyAccountAdapter extends TypeAdapter<PleromaApiMyAccount> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMyAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccount(
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
      pleroma: fields[19] as PleromaApiMyAccountPleromaPart?,
      lastStatusAt: fields[20] as DateTime?,
      source: fields[21] as PleromaApiMyAccountSource?,
      discoverable: fields[22] as bool?,
      followRequestsCount: fields[23] as int?,
      fqn: fields[24] as String?,
      suspended: fields[25] as bool?,
      muteExpiresAt: fields[26] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccount obj) {
    writer
      ..writeByte(26)
      ..writeByte(21)
      ..write(obj.source)
      ..writeByte(19)
      ..write(obj.pleroma)
      ..writeByte(23)
      ..write(obj.followRequestsCount)
      ..writeByte(22)
      ..write(obj.discoverable)
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
      ..writeByte(10)
      ..write(obj.fields)
      ..writeByte(11)
      ..write(obj.emojis)
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
      ..writeByte(25)
      ..write(obj.suspended)
      ..writeByte(26)
      ..write(obj.muteExpiresAt)
      ..writeByte(24)
      ..write(obj.fqn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMyAccountPleromaPartAdapter
    extends TypeAdapter<PleromaApiMyAccountPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMyAccountPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountPleromaPart(
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
      settingsStore: (fields[14] as Map?)?.cast<String, dynamic>(),
      chatToken: fields[15] as String?,
      deactivated: fields[16] as bool?,
      allowFollowingMove: fields[17] as bool?,
      unreadConversationCount: fields[18] as int?,
      notificationSettings:
          fields[19] as PleromaApiMyAccountNotificationsSettings?,
      skipThreadContainment: fields[20] as bool?,
      acceptsChatMessages: fields[21] as bool?,
      isConfirmed: fields[22] as bool?,
      favicon: fields[23] as String?,
      apId: fields[24] as String?,
      alsoKnownAs: (fields[25] as List?)?.cast<String>(),
      unreadNotificationsCount: fields[26] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccountPleromaPart obj) {
    writer
      ..writeByte(24)
      ..writeByte(14)
      ..write(obj.settingsStore)
      ..writeByte(18)
      ..write(obj.unreadConversationCount)
      ..writeByte(26)
      ..write(obj.unreadNotificationsCount)
      ..writeByte(15)
      ..write(obj.chatToken)
      ..writeByte(19)
      ..write(obj.notificationSettings)
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
      ..writeByte(21)
      ..write(obj.acceptsChatMessages)
      ..writeByte(20)
      ..write(obj.skipThreadContainment)
      ..writeByte(22)
      ..write(obj.isConfirmed)
      ..writeByte(23)
      ..write(obj.favicon)
      ..writeByte(24)
      ..write(obj.apId)
      ..writeByte(25)
      ..write(obj.alsoKnownAs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMyAccount _$$_PleromaApiMyAccountFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMyAccount(
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
          : PleromaApiMyAccountPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      source: json['source'] == null
          ? null
          : PleromaApiMyAccountSource.fromJson(
              json['source'] as Map<String, dynamic>),
      discoverable: json['discoverable'] as bool?,
      followRequestsCount: json['follow_requests_count'] as int?,
      fqn: json['fqn'] as String?,
      suspended: json['suspended'] as bool?,
      muteExpiresAt: json['mute_expires_at'] == null
          ? null
          : DateTime.parse(json['mute_expires_at'] as String),
    );

Map<String, dynamic> _$$_PleromaApiMyAccountToJson(
    _$_PleromaApiMyAccount instance) {
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
  writeNotNull('source', instance.source?.toJson());
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('follow_requests_count', instance.followRequestsCount);
  writeNotNull('fqn', instance.fqn);
  writeNotNull('suspended', instance.suspended);
  writeNotNull('mute_expires_at', instance.muteExpiresAt?.toIso8601String());
  return val;
}

_$_PleromaApiMyAccountPleromaPart _$$_PleromaApiMyAccountPleromaPartFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMyAccountPleromaPart(
      backgroundImage: json['background_image'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => PleromaApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      relationship: json['relationship'] == null
          ? null
          : PleromaApiAccountRelationship.fromJson(
              json['relationship'] as Map<String, dynamic>),
      isAdmin: json['is_admin'] as bool?,
      isModerator: json['is_moderator'] as bool?,
      confirmationPending: json['confirmation_pending'] as bool?,
      hideFavorites: json['hide_favorites'] as bool?,
      hideFollowers: json['hide_followers'] as bool?,
      hideFollows: json['hide_follows'] as bool?,
      hideFollowersCount: json['hide_followers_count'] as bool?,
      hideFollowsCount: json['hide_follows_count'] as bool?,
      settingsStore: json['settings_store'] as Map<String, dynamic>?,
      chatToken: json['chat_token'] as String?,
      deactivated: json['deactivated'] as bool?,
      allowFollowingMove: json['allow_following_move'] as bool?,
      unreadConversationCount: json['unread_conversation_count'] as int?,
      notificationSettings: json['notifications_settings'] == null
          ? null
          : PleromaApiMyAccountNotificationsSettings.fromJson(
              json['notifications_settings'] as Map<String, dynamic>),
      skipThreadContainment: json['skip_thread_containment'] as bool?,
      acceptsChatMessages: json['accepts_chat_messages'] as bool?,
      isConfirmed: json['is_confirmed'] as bool?,
      favicon: json['favicon'] as String?,
      apId: json['ap_id'] as String?,
      alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unreadNotificationsCount: json['unread_notifications_count'] as int?,
    );

Map<String, dynamic> _$$_PleromaApiMyAccountPleromaPartToJson(
    _$_PleromaApiMyAccountPleromaPart instance) {
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
  writeNotNull('settings_store', instance.settingsStore);
  writeNotNull('chat_token', instance.chatToken);
  writeNotNull('deactivated', instance.deactivated);
  writeNotNull('allow_following_move', instance.allowFollowingMove);
  writeNotNull('unread_conversation_count', instance.unreadConversationCount);
  writeNotNull(
      'notifications_settings', instance.notificationSettings?.toJson());
  writeNotNull('skip_thread_containment', instance.skipThreadContainment);
  writeNotNull('accepts_chat_messages', instance.acceptsChatMessages);
  writeNotNull('is_confirmed', instance.isConfirmed);
  writeNotNull('favicon', instance.favicon);
  writeNotNull('ap_id', instance.apId);
  writeNotNull('also_known_as', instance.alsoKnownAs);
  writeNotNull('unread_notifications_count', instance.unreadNotificationsCount);
  return val;
}
