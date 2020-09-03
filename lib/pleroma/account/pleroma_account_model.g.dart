// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaAccountAdapter extends TypeAdapter<PleromaAccount> {
  @override
  PleromaAccount read(BinaryReader reader) {
    var obj = PleromaAccount();
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
          obj.fields = (reader.read() as List)?.cast<PleromaField>();
          break;
        case 11:
          obj.emojis = (reader.read() as List)?.cast<PleromaEmoji>();
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
        case 19:
          obj.pleroma = reader.read() as PleromaAccountPleromaPart;
          break;
        case 20:
          obj.lastStatusAt = reader.read() as DateTime;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaAccount obj) {
    writer.writeByte(20);
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
    writer.writeByte(19);
    writer.write(obj.pleroma);
    writer.writeByte(20);
    writer.write(obj.lastStatusAt);
  }
}

class PleromaAccountRelationshipAdapter
    extends TypeAdapter<PleromaAccountRelationship> {
  @override
  PleromaAccountRelationship read(BinaryReader reader) {
    var obj = PleromaAccountRelationship();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.blocking = reader.read() as bool;
          break;
        case 2:
          obj.domainBlocking = reader.read() as bool;
          break;
        case 3:
          obj.endorsed = reader.read() as bool;
          break;
        case 4:
          obj.followedBy = reader.read() as bool;
          break;
        case 5:
          obj.following = reader.read() as bool;
          break;
        case 6:
          obj.id = reader.read() as String;
          break;
        case 7:
          obj.muting = reader.read() as bool;
          break;
        case 8:
          obj.mutingNotifications = reader.read() as bool;
          break;
        case 10:
          obj.requested = reader.read() as bool;
          break;
        case 11:
          obj.showingReblogs = reader.read() as bool;
          break;
        case 12:
          obj.subscribing = reader.read() as bool;
          break;
        case 13:
          obj.blockedBy = reader.read() as bool;
          break;
        case 14:
          obj.note = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaAccountRelationship obj) {
    writer.writeByte(13);
    writer.writeByte(1);
    writer.write(obj.blocking);
    writer.writeByte(2);
    writer.write(obj.domainBlocking);
    writer.writeByte(3);
    writer.write(obj.endorsed);
    writer.writeByte(4);
    writer.write(obj.followedBy);
    writer.writeByte(5);
    writer.write(obj.following);
    writer.writeByte(6);
    writer.write(obj.id);
    writer.writeByte(7);
    writer.write(obj.muting);
    writer.writeByte(8);
    writer.write(obj.mutingNotifications);
    writer.writeByte(10);
    writer.write(obj.requested);
    writer.writeByte(11);
    writer.write(obj.showingReblogs);
    writer.writeByte(12);
    writer.write(obj.subscribing);
    writer.writeByte(13);
    writer.write(obj.blockedBy);
    writer.writeByte(14);
    writer.write(obj.note);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaAccount _$PleromaAccountFromJson(Map<String, dynamic> json) {
  return PleromaAccount(
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
        : PleromaAccountPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    lastStatusAt: json['last_status_at'] == null
        ? null
        : DateTime.parse(json['last_status_at'] as String),
  );
}

Map<String, dynamic> _$PleromaAccountToJson(PleromaAccount instance) =>
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
    chatToken: json['chat_token'] as String,
    deactivated: json['deactivated'] as bool,
    allowFollowingMove: json['allow_following_move'] as bool,
    skipThreadContainment: json['skip_thread_containment'] as bool,
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
      'chat_token': instance.chatToken,
      'deactivated': instance.deactivated,
      'allow_following_move': instance.allowFollowingMove,
      'skip_thread_containment': instance.skipThreadContainment,
    };

PleromaAccountRelationship _$PleromaAccountRelationshipFromJson(
    Map<String, dynamic> json) {
  return PleromaAccountRelationship(
    blocking: json['blocking'] as bool,
    domainBlocking: json['domain_blocking'] as bool,
    endorsed: json['endorsed'] as bool,
    followedBy: json['followed_by'] as bool,
    following: json['following'] as bool,
    id: json['id'] as String,
    muting: json['muting'] as bool,
    mutingNotifications: json['muting_notifications'] as bool,
    requested: json['requested'] as bool,
    showingReblogs: json['showing_reblogs'] as bool,
    subscribing: json['subscribing'] as bool,
    blockedBy: json['blocked_by'] as bool,
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$PleromaAccountRelationshipToJson(
        PleromaAccountRelationship instance) =>
    <String, dynamic>{
      'blocking': instance.blocking,
      'domain_blocking': instance.domainBlocking,
      'endorsed': instance.endorsed,
      'followed_by': instance.followedBy,
      'following': instance.following,
      'id': instance.id,
      'muting': instance.muting,
      'muting_notifications': instance.mutingNotifications,
      'requested': instance.requested,
      'showing_reblogs': instance.showingReblogs,
      'subscribing': instance.subscribing,
      'blocked_by': instance.blockedBy,
      'note': instance.note,
    };

PleromaAccountIdentityProof _$PleromaAccountIdentityProofFromJson(
    Map<String, dynamic> json) {
  return PleromaAccountIdentityProof(
    profileUrl: json['profileUrl'] as String,
    proofUrl: json['proofUrl'] as String,
    provider: json['provider'] as String,
    providerUsername: json['providerUsername'] as String,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$PleromaAccountIdentityProofToJson(
        PleromaAccountIdentityProof instance) =>
    <String, dynamic>{
      'profileUrl': instance.profileUrl,
      'proofUrl': instance.proofUrl,
      'provider': instance.provider,
      'providerUsername': instance.providerUsername,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

PleromaAccountReportRequest _$PleromaAccountReportRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaAccountReportRequest(
    accountId: json['account_id'] as String,
    comment: json['comment'] as String,
    forward: json['forward'] as bool,
    statusIds: (json['status_ids'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PleromaAccountReportRequestToJson(
        PleromaAccountReportRequest instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'comment': instance.comment,
      'forward': instance.forward,
      'status_ids': instance.statusIds,
    };
