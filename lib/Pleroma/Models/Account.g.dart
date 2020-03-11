// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  Account read(BinaryReader reader) {
    var obj = Account();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.username = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
        case 2:
          obj.statusesCount = reader.read() as int;
          break;
        case 3:
          obj.note = reader.read() as String;
          break;
        case 4:
          obj.locked = reader.read() as bool;
          break;
        case 5:
          obj.id = reader.read() as String;
          break;
        case 6:
          obj.headerStatic = reader.read() as String;
          break;
        case 7:
          obj.header = reader.read() as String;
          break;
        case 8:
          obj.followingCount = reader.read() as int;
          break;
        case 9:
          obj.followersCount = reader.read() as int;
          break;
        case 10:
          obj.fields = (reader.read() as List)?.cast<Field>();
          break;
        case 11:
          obj.emojis = (reader.read() as List)?.cast<Emoji>();
          break;
        case 12:
          obj.displayName = reader.read() as String;
          break;
        case 13:
          obj.createdAt = reader.read() as DateTime;
          break;
        case 14:
          obj.bot = reader.read() as bool;
          break;
        case 15:
          obj.avatarStatic = reader.read() as String;
          break;
        case 16:
          obj.avatar = reader.read() as String;
          break;
        case 17:
          obj.acct = reader.read() as String;
          break;
        case 18:
          obj.discoverable = reader.read() as bool;
          break;
        case 19:
          obj.pleroma = reader.read() as AccountPleromaPart;
          break;
        case 20:
          obj.source = reader.read() as Source;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.writeByte(21);
    writer.writeByte(0);
    writer.write(obj.username);
    writer.writeByte(1);
    writer.write(obj.url);
    writer.writeByte(2);
    writer.write(obj.statusesCount);
    writer.writeByte(3);
    writer.write(obj.note);
    writer.writeByte(4);
    writer.write(obj.locked);
    writer.writeByte(5);
    writer.write(obj.id);
    writer.writeByte(6);
    writer.write(obj.headerStatic);
    writer.writeByte(7);
    writer.write(obj.header);
    writer.writeByte(8);
    writer.write(obj.followingCount);
    writer.writeByte(9);
    writer.write(obj.followersCount);
    writer.writeByte(10);
    writer.write(obj.fields);
    writer.writeByte(11);
    writer.write(obj.emojis);
    writer.writeByte(12);
    writer.write(obj.displayName);
    writer.writeByte(13);
    writer.write(obj.createdAt);
    writer.writeByte(14);
    writer.write(obj.bot);
    writer.writeByte(15);
    writer.write(obj.avatarStatic);
    writer.writeByte(16);
    writer.write(obj.avatar);
    writer.writeByte(17);
    writer.write(obj.acct);
    writer.writeByte(18);
    writer.write(obj.discoverable);
    writer.writeByte(19);
    writer.write(obj.pleroma);
    writer.writeByte(20);
    writer.write(obj.source);
  }
}

class AccountPleromaPartAdapter extends TypeAdapter<AccountPleromaPart> {
  @override
  AccountPleromaPart read(BinaryReader reader) {
    var obj = AccountPleromaPart();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.backgroundImage = reader.read() as dynamic;
          break;
        case 2:
          obj.tags = (reader.read() as List)?.cast<dynamic>();
          break;
        case 3:
          obj.relationship = reader.read() as Relationship;
          break;
        case 4:
          obj.isAdmin = reader.read() as bool;
          break;
        case 5:
          obj.isModerator = reader.read() as bool;
          break;
        case 7:
          obj.confirmationPending = reader.read() as bool;
          break;
        case 8:
          obj.hideFavorites = reader.read() as bool;
          break;
        case 9:
          obj.hideFollowers = reader.read() as bool;
          break;
        case 11:
          obj.hideFollows = reader.read() as bool;
          break;
        case 12:
          obj.hideFollowersCount = reader.read() as bool;
          break;
        case 13:
          obj.hideFollowsCount = reader.read() as bool;
          break;
        case 14:
          obj.settingsStore = reader.read() as dynamic;
          break;
        case 15:
          obj.chatToken = reader.read() as String;
          break;
        case 16:
          obj.deactivated = reader.read() as bool;
          break;
        case 17:
          obj.allowFollowingMove = reader.read() as bool;
          break;
        case 18:
          obj.unreadConversationCount = reader.read() as int;
          break;
        case 19:
          obj.notificationSettings =
              reader.read() as AccountPleromaPartNotificationsSettings;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, AccountPleromaPart obj) {
    writer.writeByte(17);
    writer.writeByte(1);
    writer.write(obj.backgroundImage);
    writer.writeByte(2);
    writer.write(obj.tags);
    writer.writeByte(3);
    writer.write(obj.relationship);
    writer.writeByte(4);
    writer.write(obj.isAdmin);
    writer.writeByte(5);
    writer.write(obj.isModerator);
    writer.writeByte(7);
    writer.write(obj.confirmationPending);
    writer.writeByte(8);
    writer.write(obj.hideFavorites);
    writer.writeByte(9);
    writer.write(obj.hideFollowers);
    writer.writeByte(11);
    writer.write(obj.hideFollows);
    writer.writeByte(12);
    writer.write(obj.hideFollowersCount);
    writer.writeByte(13);
    writer.write(obj.hideFollowsCount);
    writer.writeByte(14);
    writer.write(obj.settingsStore);
    writer.writeByte(15);
    writer.write(obj.chatToken);
    writer.writeByte(16);
    writer.write(obj.deactivated);
    writer.writeByte(17);
    writer.write(obj.allowFollowingMove);
    writer.writeByte(18);
    writer.write(obj.unreadConversationCount);
    writer.writeByte(19);
    writer.write(obj.notificationSettings);
  }
}

class AccountPleromaPartNotificationsSettingsAdapter
    extends TypeAdapter<AccountPleromaPartNotificationsSettings> {
  @override
  AccountPleromaPartNotificationsSettings read(BinaryReader reader) {
    var obj = AccountPleromaPartNotificationsSettings();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, AccountPleromaPartNotificationsSettings obj) {
    writer.writeByte(0);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
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
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map(
            (e) => e == null ? null : Emoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    displayName: json['display_name'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    bot: json['bot'] as bool,
    avatarStatic: json['avatar_static'] as String,
    avatar: json['avatar'] as String,
    acct: json['acct'] as String,
    discoverable: json['discoverable'] as bool,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
  )..pleroma = json['pleroma'] == null
      ? null
      : AccountPleromaPart.fromJson(json['pleroma'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
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
      'fields': instance.fields,
      'emojis': instance.emojis,
      'display_name': instance.displayName,
      'created_at': instance.createdAt?.toIso8601String(),
      'bot': instance.bot,
      'avatar_static': instance.avatarStatic,
      'avatar': instance.avatar,
      'acct': instance.acct,
      'discoverable': instance.discoverable,
      'pleroma': instance.pleroma,
      'source': instance.source,
    };

AccountPleromaPart _$AccountPleromaPartFromJson(Map<String, dynamic> json) {
  return AccountPleromaPart(
    backgroundImage: json['background_image'],
    tags: json['tags'] as List,
    relationship: json['relationship'] == null
        ? null
        : Relationship.fromJson(json['relationship'] as Map<String, dynamic>),
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
        : AccountPleromaPartNotificationsSettings.fromJson(
            json['notifications_settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountPleromaPartToJson(AccountPleromaPart instance) =>
    <String, dynamic>{
      'background_image': instance.backgroundImage,
      'tags': instance.tags,
      'relationship': instance.relationship,
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
      'notifications_settings': instance.notificationSettings,
    };

AccountPleromaPartNotificationsSettings
    _$AccountPleromaPartNotificationsSettingsFromJson(
        Map<String, dynamic> json) {
  return AccountPleromaPartNotificationsSettings(
    followers: json['followers'] as bool,
    follows: json['follows'] as bool,
    nonFollowers: json['non_followers'] as bool,
    nonFollows: json['non_follows'] as bool,
  );
}

Map<String, dynamic> _$AccountPleromaPartNotificationsSettingsToJson(
        AccountPleromaPartNotificationsSettings instance) =>
    <String, dynamic>{
      'followers': instance.followers,
      'follows': instance.follows,
      'non_followers': instance.nonFollowers,
      'non_follows': instance.nonFollows,
    };
