// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMyAccountSourceAdapter
    extends TypeAdapter<PleromaApiMyAccountSource> {
  @override
  final int typeId = 11;

  @override
  PleromaApiMyAccountSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountSource(
      privacy: fields[1] as String?,
      sensitive: fields[2] as bool?,
      language: fields[3] as String?,
      note: fields[4] as String?,
      fields: (fields[5] as List?)?.cast<PleromaApiField>(),
      followRequestsCount: fields[6] as int?,
      pleroma: fields[7] as PleromaApiMyAccountSourcePleromaPart?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccountSource obj) {
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
      other is PleromaApiMyAccountSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMyAccountSourcePleromaPartAdapter
    extends TypeAdapter<PleromaApiMyAccountSourcePleromaPart> {
  @override
  final int typeId = 12;

  @override
  PleromaApiMyAccountSourcePleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountSourcePleromaPart(
      showRole: fields[1] as bool?,
      noRichText: fields[2] as bool?,
      discoverable: fields[3] as bool?,
      actorType: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccountSourcePleromaPart obj) {
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
      other is PleromaApiMyAccountSourcePleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMyAccountAdapter extends TypeAdapter<PleromaApiMyAccount> {
  @override
  final int typeId = 22;

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
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMyAccount obj) {
    writer
      ..writeByte(24)
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
      ..write(obj.source)
      ..writeByte(22)
      ..write(obj.discoverable)
      ..writeByte(23)
      ..write(obj.followRequestsCount)
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

class PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter
    extends TypeAdapter<PleromaApiMyAccountPleromaPartNotificationsSettings> {
  @override
  final int typeId = 9;

  @override
  PleromaApiMyAccountPleromaPartNotificationsSettings read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountPleromaPartNotificationsSettings(
      followers: fields[0] as bool?,
      follows: fields[1] as bool?,
      nonFollowers: fields[2] as bool?,
      nonFollows: fields[3] as bool?,
      blockFromStrangers: fields[4] as bool?,
      hideNotificationContents: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer,
      PleromaApiMyAccountPleromaPartNotificationsSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.followers)
      ..writeByte(1)
      ..write(obj.follows)
      ..writeByte(2)
      ..write(obj.nonFollowers)
      ..writeByte(3)
      ..write(obj.nonFollows)
      ..writeByte(4)
      ..write(obj.blockFromStrangers)
      ..writeByte(5)
      ..write(obj.hideNotificationContents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountPleromaPartNotificationsSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMyAccountPleromaPartAdapter
    extends TypeAdapter<PleromaApiMyAccountPleromaPart> {
  @override
  final int typeId = 8;

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
      skipThreadContainment: fields[20] as bool?,
      notificationSettings:
          fields[19] as PleromaApiMyAccountPleromaPartNotificationsSettings?,
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
      ..write(obj.notificationSettings)
      ..writeByte(20)
      ..write(obj.skipThreadContainment)
      ..writeByte(21)
      ..write(obj.acceptsChatMessages)
      ..writeByte(22)
      ..write(obj.isConfirmed)
      ..writeByte(23)
      ..write(obj.favicon)
      ..writeByte(24)
      ..write(obj.apId)
      ..writeByte(25)
      ..write(obj.alsoKnownAs)
      ..writeByte(26)
      ..write(obj.unreadNotificationsCount);
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

PleromaApiMyAccountEdit _$PleromaApiMyAccountEditFromJson(
    Map<String, dynamic> json) {
  return PleromaApiMyAccountEdit(
    bot: json['bot'] as bool?,
    discoverable: json['discoverable'] as bool?,
    displayName: json['display_name'] as String?,
    fieldsAttributes: (json['fields_attributes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          int.parse(k), PleromaApiField.fromJson(e as Map<String, dynamic>)),
    ),
    locked: json['locked'] as bool?,
    note: json['note'] as String?,
    source: json['source'] == null
        ? null
        : PleromaApiMyAccountEditSource.fromJson(
            json['source'] as Map<String, dynamic>),
    actorType: json['actor_type'],
    allowFollowingMove: json['allow_following_move'] as bool?,
    acceptsChatMessages: json['accepts_chat_messages'] as bool?,
    defaultScope: json['default_scope'] as String?,
    hideFavorites: json['hide_favorites'] as bool?,
    hideFollowers: json['hide_followers'] as bool?,
    hideFollowersCount: json['hide_followers_count'] as bool?,
    hideFollows: json['hide_follows'] as bool?,
    hideFollowsCount: json['hide_follows_count'] as bool?,
    noRichText: json['no_rich_text'] as bool?,
    pleromaBackgroundImage: json['pleroma_background_image'] as String?,
    pleromaSettingsStore:
        json['pleroma_settings_store'] as Map<String, dynamic>?,
    showRole: json['show_role'] as bool?,
    skipThreadContainment: json['skip_thread_containment'] as bool?,
    alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiMyAccountEditToJson(
    PleromaApiMyAccountEdit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bot', instance.bot);
  writeNotNull('discoverable', instance.discoverable);
  writeNotNull('display_name', instance.displayName);
  writeNotNull(
      'fields_attributes',
      instance.fieldsAttributes
          ?.map((k, e) => MapEntry(k.toString(), e.toJson())));
  writeNotNull('locked', instance.locked);
  writeNotNull('note', instance.note);
  writeNotNull('source', instance.source?.toJson());
  writeNotNull('actor_type', instance.actorType);
  writeNotNull('allow_following_move', instance.allowFollowingMove);
  writeNotNull('accepts_chat_messages', instance.acceptsChatMessages);
  writeNotNull('default_scope', instance.defaultScope);
  writeNotNull('hide_favorites', instance.hideFavorites);
  writeNotNull('hide_followers', instance.hideFollowers);
  writeNotNull('hide_followers_count', instance.hideFollowersCount);
  writeNotNull('hide_follows', instance.hideFollows);
  writeNotNull('hide_follows_count', instance.hideFollowsCount);
  writeNotNull('no_rich_text', instance.noRichText);
  writeNotNull('pleroma_background_image', instance.pleromaBackgroundImage);
  writeNotNull('pleroma_settings_store', instance.pleromaSettingsStore);
  writeNotNull('show_role', instance.showRole);
  writeNotNull('skip_thread_containment', instance.skipThreadContainment);
  writeNotNull('also_known_as', instance.alsoKnownAs);
  return val;
}

PleromaApiMyAccountEditSource _$PleromaApiMyAccountEditSourceFromJson(
    Map<String, dynamic> json) {
  return PleromaApiMyAccountEditSource(
    language: json['language'] as String?,
    privacy: json['privacy'] as String?,
    sensitive: json['sensitive'] as bool?,
  );
}

Map<String, dynamic> _$PleromaApiMyAccountEditSourceToJson(
        PleromaApiMyAccountEditSource instance) =>
    <String, dynamic>{
      'language': instance.language,
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
    };

PleromaApiMyAccountSource _$PleromaApiMyAccountSourceFromJson(
    Map<String, dynamic> json) {
  return PleromaApiMyAccountSource(
    privacy: json['privacy'] as String?,
    sensitive: json['sensitive'] as bool?,
    language: json['language'] as String?,
    note: json['note'] as String?,
    fields: (json['fields'] as List<dynamic>?)
        ?.map((e) => PleromaApiField.fromJson(e as Map<String, dynamic>))
        .toList(),
    followRequestsCount: json['follow_requests_count'] as int?,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaApiMyAccountSourcePleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiMyAccountSourceToJson(
        PleromaApiMyAccountSource instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'note': instance.note,
      'fields': instance.fields?.map((e) => e.toJson()).toList(),
      'follow_requests_count': instance.followRequestsCount,
      'pleroma': instance.pleroma?.toJson(),
    };

PleromaApiMyAccountSourcePleromaPart
    _$PleromaApiMyAccountSourcePleromaPartFromJson(Map<String, dynamic> json) {
  return PleromaApiMyAccountSourcePleromaPart(
    showRole: json['show_role'] as bool?,
    noRichText: json['no_rich_text'] as bool?,
    discoverable: json['discoverable'] as bool?,
    actorType: json['actor_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiMyAccountSourcePleromaPartToJson(
        PleromaApiMyAccountSourcePleromaPart instance) =>
    <String, dynamic>{
      'show_role': instance.showRole,
      'no_rich_text': instance.noRichText,
      'discoverable': instance.discoverable,
      'actor_type': instance.actorType,
    };

PleromaApiMyAccount _$PleromaApiMyAccountFromJson(Map<String, dynamic> json) {
  return PleromaApiMyAccount(
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
    pleroma: PleromaApiMyAccountPleromaPart.fromJsonOrNullOnError(
        json['pleroma'] as Map<String, dynamic>?),
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
  );
}

Map<String, dynamic> _$PleromaApiMyAccountToJson(
        PleromaApiMyAccount instance) =>
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
      'fields': instance.fields?.map((e) => e.toJson()).toList(),
      'emojis': instance.emojis?.map((e) => e.toJson()).toList(),
      'display_name': instance.displayName,
      'created_at': instance.createdAt.toIso8601String(),
      'bot': instance.bot,
      'avatar_static': instance.avatarStatic,
      'avatar': instance.avatar,
      'acct': instance.acct,
      'pleroma': instance.pleroma?.toJson(),
      'last_status_at': instance.lastStatusAt?.toIso8601String(),
      'source': instance.source?.toJson(),
      'discoverable': instance.discoverable,
      'follow_requests_count': instance.followRequestsCount,
      'fqn': instance.fqn,
    };

PleromaApiMyAccountPleromaPartNotificationsSettings
    _$PleromaApiMyAccountPleromaPartNotificationsSettingsFromJson(
        Map<String, dynamic> json) {
  return PleromaApiMyAccountPleromaPartNotificationsSettings(
    followers: json['followers'] as bool?,
    follows: json['follows'] as bool?,
    nonFollowers: json['non_followers'] as bool?,
    nonFollows: json['non_follows'] as bool?,
    blockFromStrangers: json['block_from_strangers'] as bool?,
    hideNotificationContents: json['hide_notification_contents'] as bool?,
  );
}

Map<String, dynamic>
    _$PleromaApiMyAccountPleromaPartNotificationsSettingsToJson(
            PleromaApiMyAccountPleromaPartNotificationsSettings instance) =>
        <String, dynamic>{
          'followers': instance.followers,
          'follows': instance.follows,
          'non_followers': instance.nonFollowers,
          'non_follows': instance.nonFollows,
          'block_from_strangers': instance.blockFromStrangers,
          'hide_notification_contents': instance.hideNotificationContents,
        };

PleromaApiMyAccountPleromaPart _$PleromaApiMyAccountPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiMyAccountPleromaPart(
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
    skipThreadContainment: json['skip_thread_containment'] as bool?,
    notificationSettings: json['notifications_settings'] == null
        ? null
        : PleromaApiMyAccountPleromaPartNotificationsSettings.fromJson(
            json['notifications_settings'] as Map<String, dynamic>),
    acceptsChatMessages: json['accepts_chat_messages'] as bool?,
    isConfirmed: json['is_confirmed'] as bool?,
    favicon: json['favicon'] as String?,
    apId: json['apId'] as String?,
    alsoKnownAs: (json['also_known_as'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    unreadNotificationsCount: json['unread_notifications_count'] as int?,
  );
}

Map<String, dynamic> _$PleromaApiMyAccountPleromaPartToJson(
        PleromaApiMyAccountPleromaPart instance) =>
    <String, dynamic>{
      'background_image': instance.backgroundImage,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
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
      'notifications_settings': instance.notificationSettings?.toJson(),
      'skip_thread_containment': instance.skipThreadContainment,
      'accepts_chat_messages': instance.acceptsChatMessages,
      'is_confirmed': instance.isConfirmed,
      'favicon': instance.favicon,
      'apId': instance.apId,
      'also_known_as': instance.alsoKnownAs,
      'unread_notifications_count': instance.unreadNotificationsCount,
    };
