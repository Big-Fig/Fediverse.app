// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaMyAccountSourceAdapter
    extends TypeAdapter<PleromaMyAccountSource> {
  @override
  final int typeId = 11;

  @override
  PleromaMyAccountSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountSource(
      privacy: fields[1] as String,
      sensitive: fields[2] as bool,
      language: fields[3] as String,
      note: fields[4] as String,
      fields: (fields[5] as List)?.cast<PleromaField>(),
      followRequestsCount: fields[6] as int,
      pleroma: fields[7] as PleromaMyAccountSourcePleromaPart,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccountSource obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.privacy)
      ..writeByte(2)
      ..write(obj.sensitive)
      ..writeByte(3)
      ..write(obj.language)
      ..writeByte(4)
      ..write(obj.note)
      ..writeByte(5)
      ..write(obj.fields)
      ..writeByte(6)
      ..write(obj.followRequestsCount)
      ..writeByte(7)
      ..write(obj.pleroma);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaMyAccountSourcePleromaPartAdapter
    extends TypeAdapter<PleromaMyAccountSourcePleromaPart> {
  @override
  final int typeId = 12;

  @override
  PleromaMyAccountSourcePleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountSourcePleromaPart(
      showRole: fields[1] as bool,
      noRichText: fields[2] as bool,
      discoverable: fields[3] as bool,
      actorType: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccountSourcePleromaPart obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.showRole)
      ..writeByte(2)
      ..write(obj.noRichText)
      ..writeByte(3)
      ..write(obj.discoverable)
      ..writeByte(4)
      ..write(obj.actorType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountSourcePleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaAccountPleromaPartAdapter
    extends TypeAdapter<PleromaAccountPleromaPart> {
  @override
  final int typeId = 43;

  @override
  PleromaAccountPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaAccountPleromaPart(
      backgroundImage: fields[1] as dynamic,
      tags: (fields[2] as List)?.cast<dynamic>(),
      relationship: fields[3] as PleromaAccountRelationship,
      isAdmin: fields[4] as bool,
      isModerator: fields[5] as bool,
      confirmationPending: fields[7] as bool,
      hideFavorites: fields[8] as bool,
      hideFollowers: fields[9] as bool,
      hideFollows: fields[11] as bool,
      hideFollowersCount: fields[12] as bool,
      hideFollowsCount: fields[13] as bool,
      settingsStore: fields[14] as dynamic,
      chatToken: fields[15] as String,
      deactivated: fields[16] as bool,
      allowFollowingMove: fields[17] as bool,
      unreadConversationCount: fields[18] as int,
      notificationSettings:
          fields[19] as PleromaMyAccountPleromaPartNotificationsSettings,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaAccountPleromaPart obj) {
    writer
      ..writeByte(17)
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
      ..writeByte(14)
      ..write(obj.settingsStore)
      ..writeByte(15)
      ..write(obj.chatToken)
      ..writeByte(16)
      ..write(obj.deactivated)
      ..writeByte(17)
      ..write(obj.allowFollowingMove)
      ..writeByte(18)
      ..write(obj.unreadConversationCount)
      ..writeByte(19)
      ..write(obj.notificationSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaMyAccountAdapter extends TypeAdapter<PleromaMyAccount> {
  @override
  final int typeId = 22;

  @override
  PleromaMyAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccount(
      username: fields[0] as String,
      url: fields[1] as String,
      statusesCount: fields[2] as int,
      note: fields[3] as String,
      locked: fields[4] as bool,
      id: fields[5] as String,
      headerStatic: fields[6] as String,
      header: fields[7] as String,
      followingCount: fields[8] as int,
      followersCount: fields[9] as int,
      fields: (fields[10] as List)?.cast<PleromaField>(),
      emojis: (fields[11] as List)?.cast<PleromaEmoji>(),
      displayName: fields[12] as String,
      createdAt: fields[13] as DateTime,
      bot: fields[14] as bool,
      avatarStatic: fields[15] as String,
      avatar: fields[16] as String,
      acct: fields[17] as String,
      pleroma: fields[19] as PleromaMyAccountPleromaPart,
      lastStatusAt: fields[20] as DateTime,
      source: fields[21] as PleromaMyAccountSource,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccount obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.statusesCount)
      ..writeByte(3)
      ..write(obj.note)
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
      ..writeByte(14)
      ..write(obj.bot)
      ..writeByte(15)
      ..write(obj.avatarStatic)
      ..writeByte(16)
      ..write(obj.avatar)
      ..writeByte(17)
      ..write(obj.acct)
      ..writeByte(19)
      ..write(obj.pleroma)
      ..writeByte(20)
      ..write(obj.lastStatusAt)
      ..writeByte(21)
      ..write(obj.source);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaMyAccountPleromaPartNotificationsSettingsAdapter
    extends TypeAdapter<PleromaMyAccountPleromaPartNotificationsSettings> {
  @override
  final int typeId = 9;

  @override
  PleromaMyAccountPleromaPartNotificationsSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountPleromaPartNotificationsSettings(
      followers: fields[0] as bool,
      follows: fields[1] as bool,
      nonFollowers: fields[2] as bool,
      nonFollows: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer,
      PleromaMyAccountPleromaPartNotificationsSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.followers)
      ..writeByte(1)
      ..write(obj.follows)
      ..writeByte(2)
      ..write(obj.nonFollowers)
      ..writeByte(3)
      ..write(obj.nonFollows);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountPleromaPartNotificationsSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaMyAccountPleromaPartAdapter
    extends TypeAdapter<PleromaMyAccountPleromaPart> {
  @override
  final int typeId = 8;

  @override
  PleromaMyAccountPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaMyAccountPleromaPart(
      backgroundImage: fields[1] as dynamic,
      tags: (fields[2] as List)?.cast<dynamic>(),
      relationship: fields[3] as PleromaAccountRelationship,
      isAdmin: fields[4] as bool,
      isModerator: fields[5] as bool,
      confirmationPending: fields[7] as bool,
      hideFavorites: fields[8] as bool,
      hideFollowers: fields[9] as bool,
      hideFollows: fields[11] as bool,
      hideFollowersCount: fields[12] as bool,
      hideFollowsCount: fields[13] as bool,
      settingsStore: fields[14] as dynamic,
      chatToken: fields[15] as String,
      deactivated: fields[16] as bool,
      allowFollowingMove: fields[17] as bool,
      unreadConversationCount: fields[18] as int,
      notificationSettings:
          fields[19] as PleromaMyAccountPleromaPartNotificationsSettings,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaMyAccountPleromaPart obj) {
    writer
      ..writeByte(17)
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
      ..writeByte(14)
      ..write(obj.settingsStore)
      ..writeByte(15)
      ..write(obj.chatToken)
      ..writeByte(16)
      ..write(obj.deactivated)
      ..writeByte(17)
      ..write(obj.allowFollowingMove)
      ..writeByte(18)
      ..write(obj.unreadConversationCount)
      ..writeByte(19)
      ..write(obj.notificationSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaMyAccountEdit _$PleromaMyAccountEditFromJson(Map<String, dynamic> json) {
  return PleromaMyAccountEdit(
    bot: json['bot'] as bool,
    discoverable: json['discoverable'] as bool,
    displayName: json['display_name'] as String,
    fieldsAttributes: (json['fields_attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k),
          e == null ? null : PleromaField.fromJson(e as Map<String, dynamic>)),
    ),
    locked: json['locked'] as bool,
    note: json['note'] as String,
    source: json['source'] == null
        ? null
        : PleromaMyAccountSource.fromJson(
            json['source'] as Map<String, dynamic>),
    actorType: json['actor_type'],
    allowFollowingMove: json['allow_following_move'] as bool,
    defaultScope: json['default_scope'] as String,
    hideFavorites: json['hide_favorites'] as bool,
    hideFollowers: json['hide_followers'] as bool,
    hideFollowersCount: json['hide_followers_count'] as bool,
    hideFollows: json['hide_follows'] as bool,
    hideFollowsCount: json['hide_follows_count'] as bool,
    noRichText: json['no_rich_text'] as bool,
    pleromaBackgroundImage: json['pleroma_background_image'] as String,
    pleromaSettingsStore:
        json['pleroma_settings_store'] as Map<String, dynamic>,
    showRole: json['show_role'] as bool,
    skipThreadContainment: json['skip_thread_containment'] as bool,
  );
}

Map<String, dynamic> _$PleromaMyAccountEditToJson(
        PleromaMyAccountEdit instance) =>
    <String, dynamic>{
      'bot': instance.bot,
      'discoverable': instance.discoverable,
      'display_name': instance.displayName,
      'fields_attributes':
          instance.fieldsAttributes?.map((k, e) => MapEntry(k.toString(), e)),
      'locked': instance.locked,
      'note': instance.note,
      'source': instance.source,
      'actor_type': instance.actorType,
      'allow_following_move': instance.allowFollowingMove,
      'default_scope': instance.defaultScope,
      'hide_favorites': instance.hideFavorites,
      'hide_followers': instance.hideFollowers,
      'hide_followers_count': instance.hideFollowersCount,
      'hide_follows': instance.hideFollows,
      'hide_follows_count': instance.hideFollowsCount,
      'no_rich_text': instance.noRichText,
      'pleroma_background_image': instance.pleromaBackgroundImage,
      'pleroma_settings_store': instance.pleromaSettingsStore,
      'show_role': instance.showRole,
      'skip_thread_containment': instance.skipThreadContainment,
    };

PleromaMyAccountSource _$PleromaMyAccountSourceFromJson(
    Map<String, dynamic> json) {
  return PleromaMyAccountSource(
    privacy: json['privacy'] as String,
    sensitive: json['sensitive'] as bool,
    language: json['language'] as String,
    note: json['note'] as String,
    fields: (json['fields'] as List)
        ?.map((e) =>
            e == null ? null : PleromaField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    followRequestsCount: json['follow_requests_count'] as int,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaMyAccountSourcePleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaMyAccountSourceToJson(
        PleromaMyAccountSource instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'note': instance.note,
      'fields': instance.fields,
      'follow_requests_count': instance.followRequestsCount,
      'pleroma': instance.pleroma,
    };

PleromaMyAccountSourcePleromaPart _$PleromaMyAccountSourcePleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaMyAccountSourcePleromaPart(
    showRole: json['show_role'] as bool,
    noRichText: json['no_rich_text'] as bool,
    discoverable: json['discoverable'] as bool,
    actorType: json['actor_type'] as String,
  );
}

Map<String, dynamic> _$PleromaMyAccountSourcePleromaPartToJson(
        PleromaMyAccountSourcePleromaPart instance) =>
    <String, dynamic>{
      'show_role': instance.showRole,
      'no_rich_text': instance.noRichText,
      'discoverable': instance.discoverable,
      'actor_type': instance.actorType,
    };

PleromaAccountPleromaPart _$PleromaAccountPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaAccountPleromaPart(
    backgroundImage: json['background_image'],
    tags: json['tags'] as List,
    relationship: json['relationship'] == null
        ? null
        : PleromaAccountRelationship.fromJson(
            json['relationship'] as Map<String, dynamic>),
    isAdmin: json['is_admin'] as bool,
    isModerator: json['is_moderator'] as bool,
    confirmationPending: json['confirmation_pending'] as bool,
    hideFavorites: json['hide_favorites'] as bool,
    hideFollowers: json['hide_followers'] as bool,
    hideFollows: json['hide_follows'] as bool,
    hideFollowersCount: json['hide_followers_count'] as bool,
    hideFollowsCount: json['hide_follows_count'] as bool,
    settingsStore: json['settings_store'],
    chatToken: json['chat_token'] as String,
    deactivated: json['deactivated'] as bool,
    allowFollowingMove: json['allow_following_move'] as bool,
    unreadConversationCount: json['unread_conversation_count'] as int,
    skipThreadContainment: json['skip_thread_containment'] as bool,
    notificationSettings: json['notifications_settings'] == null
        ? null
        : PleromaMyAccountPleromaPartNotificationsSettings.fromJson(
            json['notifications_settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaAccountPleromaPartToJson(
        PleromaAccountPleromaPart instance) =>
    <String, dynamic>{
      'background_image': instance.backgroundImage,
      'tags': instance.tags,
      'relationship': instance.relationship?.toJson(),
      'is_admin': instance.isAdmin,
      'is_moderator': instance.isModerator,
      'confirmation_pending': instance.confirmationPending,
      'hide_favorites': instance.hideFavorites,
      'hide_followers': instance.hideFollowers,
      'hide_follows': instance.hideFollows,
      'hide_followers_count': instance.hideFollowersCount,
      'hide_follows_count': instance.hideFollowsCount,
      'settings_store': instance.settingsStore,
      'chat_token': instance.chatToken,
      'deactivated': instance.deactivated,
      'allow_following_move': instance.allowFollowingMove,
      'unread_conversation_count': instance.unreadConversationCount,
      'skip_thread_containment': instance.skipThreadContainment,
      'notifications_settings': instance.notificationSettings?.toJson(),
    };

PleromaMyAccount _$PleromaMyAccountFromJson(Map<String, dynamic> json) {
  return PleromaMyAccount(
    username: json['username'] as String,
    url: json['url'] as String,
    statusesCount: json['statuses_count'] as int,
    note: json['note'] as String,
    locked: json['locked'] as bool,
    id: json['id'] as String,
    headerStatic: json['header_static'] as String,
    header: json['header'] as String,
    followingCount: json['following_count'] as int,
    followersCount: json['followers_count'] as int,
    fields: (json['fields'] as List)
        ?.map((e) =>
            e == null ? null : PleromaField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map((e) =>
            e == null ? null : PleromaEmoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    displayName: json['display_name'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    bot: json['bot'] as bool,
    avatarStatic: json['avatar_static'] as String,
    avatar: json['avatar'] as String,
    acct: json['acct'] as String,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaMyAccountPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    lastStatusAt: json['last_status_at'] == null
        ? null
        : DateTime.parse(json['last_status_at'] as String),
    source: json['source'] == null
        ? null
        : PleromaMyAccountSource.fromJson(
            json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaMyAccountToJson(PleromaMyAccount instance) =>
    <String, dynamic>{
      'username': instance.username,
      'url': instance.url,
      'statuses_count': instance.statusesCount,
      'note': instance.note,
      'locked': instance.locked,
      'id': instance.id,
      'header_static': instance.headerStatic,
      'header': instance.header,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'fields': instance.fields?.map((e) => e?.toJson())?.toList(),
      'emojis': instance.emojis?.map((e) => e?.toJson())?.toList(),
      'display_name': instance.displayName,
      'created_at': instance.createdAt?.toIso8601String(),
      'bot': instance.bot,
      'avatar_static': instance.avatarStatic,
      'avatar': instance.avatar,
      'acct': instance.acct,
      'pleroma': instance.pleroma?.toJson(),
      'last_status_at': instance.lastStatusAt?.toIso8601String(),
      'source': instance.source?.toJson(),
    };

PleromaMyAccountPleromaPartNotificationsSettings
    _$PleromaMyAccountPleromaPartNotificationsSettingsFromJson(
        Map<String, dynamic> json) {
  return PleromaMyAccountPleromaPartNotificationsSettings(
    followers: json['followers'] as bool,
    follows: json['follows'] as bool,
    nonFollowers: json['non_followers'] as bool,
    nonFollows: json['non_follows'] as bool,
  );
}

Map<String, dynamic> _$PleromaMyAccountPleromaPartNotificationsSettingsToJson(
        PleromaMyAccountPleromaPartNotificationsSettings instance) =>
    <String, dynamic>{
      'followers': instance.followers,
      'follows': instance.follows,
      'non_followers': instance.nonFollowers,
      'non_follows': instance.nonFollows,
    };

PleromaMyAccountPleromaPart _$PleromaMyAccountPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaMyAccountPleromaPart(
    backgroundImage: json['background_image'],
    tags: json['tags'] as List,
    relationship: json['relationship'] == null
        ? null
        : PleromaAccountRelationship.fromJson(
            json['relationship'] as Map<String, dynamic>),
    isAdmin: json['is_admin'] as bool,
    isModerator: json['is_moderator'] as bool,
    confirmationPending: json['confirmation_pending'] as bool,
    hideFavorites: json['hide_favorites'] as bool,
    hideFollowers: json['hide_followers'] as bool,
    hideFollows: json['hide_follows'] as bool,
    hideFollowersCount: json['hide_followers_count'] as bool,
    hideFollowsCount: json['hide_follows_count'] as bool,
    settingsStore: json['settings_store'],
    chatToken: json['chat_token'] as String,
    deactivated: json['deactivated'] as bool,
    allowFollowingMove: json['allow_following_move'] as bool,
    unreadConversationCount: json['unread_conversation_count'] as int,
    skipThreadContainment: json['skip_thread_containment'] as bool,
    notificationSettings: json['notifications_settings'] == null
        ? null
        : PleromaMyAccountPleromaPartNotificationsSettings.fromJson(
            json['notifications_settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaMyAccountPleromaPartToJson(
        PleromaMyAccountPleromaPart instance) =>
    <String, dynamic>{
      'background_image': instance.backgroundImage,
      'tags': instance.tags,
      'relationship': instance.relationship?.toJson(),
      'is_admin': instance.isAdmin,
      'is_moderator': instance.isModerator,
      'confirmation_pending': instance.confirmationPending,
      'hide_favorites': instance.hideFavorites,
      'hide_followers': instance.hideFollowers,
      'hide_follows': instance.hideFollows,
      'hide_followers_count': instance.hideFollowersCount,
      'hide_follows_count': instance.hideFollowsCount,
      'settings_store': instance.settingsStore,
      'chat_token': instance.chatToken,
      'deactivated': instance.deactivated,
      'allow_following_move': instance.allowFollowingMove,
      'unread_conversation_count': instance.unreadConversationCount,
      'skip_thread_containment': instance.skipThreadContainment,
      'notifications_settings': instance.notificationSettings?.toJson(),
    };
