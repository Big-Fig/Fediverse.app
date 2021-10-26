// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_my_account_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMyAccountAdapter extends TypeAdapter<UnifediApiMyAccount> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMyAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMyAccount(
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
      discoverable: fields[22] as bool?,
      followRequestsCount: fields[23] as int?,
      fqn: fields[24] as String?,
      suspended: fields[25] as bool?,
      muteExpiresAt: fields[26] as DateTime?,
      backgroundImage: fields[27] as String?,
      tags: (fields[28] as List?)?.cast<UnifediApiTag>(),
      relationship: fields[29] as UnifediApiAccountRelationship?,
      isAdmin: fields[30] as bool?,
      isModerator: fields[31] as bool?,
      confirmationPending: fields[33] as bool?,
      hideFavorites: fields[34] as bool?,
      hideFollowers: fields[35] as bool?,
      hideFollows: fields[37] as bool?,
      hideFollowersCount: fields[38] as bool?,
      hideFollowsCount: fields[39] as bool?,
      settingsStore: (fields[40] as Map?)?.cast<String, dynamic>(),
      chatToken: fields[41] as String?,
      deactivated: fields[42] as bool?,
      allowFollowingMove: fields[43] as bool?,
      unreadConversationCount: fields[44] as int?,
      notificationSettings:
          fields[45] as UnifediApiMyAccountNotificationsSettings?,
      skipThreadContainment: fields[46] as bool?,
      acceptsChatMessages: fields[47] as bool?,
      isConfirmed: fields[48] as bool?,
      favicon: fields[49] as String?,
      apId: fields[50] as String?,
      alsoKnownAs: (fields[51] as List?)?.cast<String>(),
      unreadNotificationsCount: fields[52] as int?,
      privacy: fields[53] as String?,
      sensitive: fields[54] as bool?,
      language: fields[55] as String?,
      showRole: fields[59] as bool?,
      noRichText: fields[60] as bool?,
      actorType: fields[62] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMyAccount obj) {
    writer
      ..writeByte(54)
      ..writeByte(23)
      ..write(obj.followRequestsCount)
      ..writeByte(22)
      ..write(obj.discoverable)
      ..writeByte(40)
      ..write(obj.settingsStore)
      ..writeByte(44)
      ..write(obj.unreadConversationCount)
      ..writeByte(52)
      ..write(obj.unreadNotificationsCount)
      ..writeByte(41)
      ..write(obj.chatToken)
      ..writeByte(45)
      ..write(obj.notificationSettings)
      ..writeByte(59)
      ..write(obj.showRole)
      ..writeByte(60)
      ..write(obj.noRichText)
      ..writeByte(62)
      ..write(obj.actorType)
      ..writeByte(53)
      ..write(obj.privacy)
      ..writeByte(54)
      ..write(obj.sensitive)
      ..writeByte(55)
      ..write(obj.language)
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
      ..writeByte(24)
      ..write(obj.fqn)
      ..writeByte(27)
      ..write(obj.backgroundImage)
      ..writeByte(28)
      ..write(obj.tags)
      ..writeByte(29)
      ..write(obj.relationship)
      ..writeByte(30)
      ..write(obj.isAdmin)
      ..writeByte(31)
      ..write(obj.isModerator)
      ..writeByte(33)
      ..write(obj.confirmationPending)
      ..writeByte(34)
      ..write(obj.hideFavorites)
      ..writeByte(35)
      ..write(obj.hideFollowers)
      ..writeByte(37)
      ..write(obj.hideFollows)
      ..writeByte(38)
      ..write(obj.hideFollowersCount)
      ..writeByte(39)
      ..write(obj.hideFollowsCount)
      ..writeByte(42)
      ..write(obj.deactivated)
      ..writeByte(43)
      ..write(obj.allowFollowingMove)
      ..writeByte(47)
      ..write(obj.acceptsChatMessages)
      ..writeByte(46)
      ..write(obj.skipThreadContainment)
      ..writeByte(48)
      ..write(obj.isConfirmed)
      ..writeByte(49)
      ..write(obj.favicon)
      ..writeByte(50)
      ..write(obj.apId)
      ..writeByte(51)
      ..write(obj.alsoKnownAs)
      ..writeByte(25)
      ..write(obj.suspended)
      ..writeByte(26)
      ..write(obj.muteExpiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMyAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMyAccount _$$_UnifediApiMyAccountFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMyAccount(
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
      discoverable: json['discoverable'] as bool?,
      followRequestsCount: json['follow_requests_count'] as int?,
      fqn: json['fqn'] as String?,
      suspended: json['suspended'] as bool?,
      muteExpiresAt: json['mute_expires_at'] == null
          ? null
          : DateTime.parse(json['mute_expires_at'] as String),
      backgroundImage: json['background_image'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => UnifediApiTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      relationship: json['relationship'] == null
          ? null
          : UnifediApiAccountRelationship.fromJson(
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
          : UnifediApiMyAccountNotificationsSettings.fromJson(
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
      privacy: json['privacy'] as String?,
      sensitive: json['sensitive'] as bool?,
      language: json['language'] as String?,
      showRole: json['show_role'] as bool?,
      noRichText: json['no_rich_text'] as bool?,
      actorType: json['actor_type'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiMyAccountToJson(
    _$_UnifediApiMyAccount instance) {
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
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('follow_requests_count', instance.followRequestsCount);
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
  writeNotNull('privacy', instance.privacy);
  writeNotNull('sensitive', instance.sensitive);
  writeNotNull('language', instance.language);
  writeNotNull('show_role', instance.showRole);
  writeNotNull('no_rich_text', instance.noRichText);
  writeNotNull('actor_type', instance.actorType);
  return val;
}
