// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccountAdapter extends TypeAdapter<PleromaApiAccount> {
  @override
  final int typeId = 32;

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
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccount obj) {
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
      ..write(obj.fqn);
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
  final int typeId = 43;

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
      ..writeByte(18)
      ..write(obj.skipThreadContainment)
      ..writeByte(19)
      ..write(obj.acceptsChatMessages)
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

class PleromaApiAccountRelationshipAdapter
    extends TypeAdapter<PleromaApiAccountRelationship> {
  @override
  final int typeId = 10;

  @override
  PleromaApiAccountRelationship read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccountRelationship(
      blocking: fields[1] as bool?,
      domainBlocking: fields[2] as bool?,
      endorsed: fields[3] as bool?,
      followedBy: fields[4] as bool?,
      following: fields[5] as bool?,
      id: fields[6] as String?,
      muting: fields[7] as bool?,
      mutingNotifications: fields[8] as bool?,
      requested: fields[10] as bool?,
      showingReblogs: fields[11] as bool?,
      subscribing: fields[12] as bool?,
      blockedBy: fields[13] as bool?,
      note: fields[14] as String?,
      notifying: fields[15] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccountRelationship obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.blocking)
      ..writeByte(2)
      ..write(obj.domainBlocking)
      ..writeByte(3)
      ..write(obj.endorsed)
      ..writeByte(4)
      ..write(obj.followedBy)
      ..writeByte(5)
      ..write(obj.following)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.muting)
      ..writeByte(8)
      ..write(obj.mutingNotifications)
      ..writeByte(10)
      ..write(obj.requested)
      ..writeByte(11)
      ..write(obj.showingReblogs)
      ..writeByte(12)
      ..write(obj.subscribing)
      ..writeByte(13)
      ..write(obj.blockedBy)
      ..writeByte(14)
      ..write(obj.note)
      ..writeByte(15)
      ..write(obj.notifying);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountRelationshipAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiAccountReport _$PleromaApiAccountReportFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountReport(
    account: json['account'] == null
        ? null
        : PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
    statuses: (json['statuses'] as List<dynamic>?)
        ?.map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
    user: json['user'] == null
        ? null
        : PleromaApiAccount.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiAccountReportToJson(
        PleromaApiAccountReport instance) =>
    <String, dynamic>{
      'account': instance.account?.toJson(),
      'statuses': instance.statuses?.map((e) => e.toJson()).toList(),
      'user': instance.user?.toJson(),
    };

PleromaApiAccount _$PleromaApiAccountFromJson(Map<String, dynamic> json) {
  return PleromaApiAccount(
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
    pleroma: PleromaApiAccountPleromaPart.fromJsonOrNullOnError(
        json['pleroma'] as Map<String, dynamic>?),
    lastStatusAt: json['last_status_at'] == null
        ? null
        : DateTime.parse(json['last_status_at'] as String),
    fqn: json['fqn'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiAccountToJson(PleromaApiAccount instance) =>
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
      'fqn': instance.fqn,
    };

PleromaApiAccountPleromaPart _$PleromaApiAccountPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountPleromaPart(
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
    apId: json['apId'] as String?,
    alsoKnownAs:
        PleromaApiAccountPleromaPart.fromJsonAlsoKnownAsListOrNullOnError(
            json['also_known_as']),
  );
}

Map<String, dynamic> _$PleromaApiAccountPleromaPartToJson(
        PleromaApiAccountPleromaPart instance) =>
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
      'deactivated': instance.deactivated,
      'allow_following_move': instance.allowFollowingMove,
      'skip_thread_containment': instance.skipThreadContainment,
      'accepts_chat_messages': instance.acceptsChatMessages,
      'is_confirmed': instance.isConfirmed,
      'favicon': instance.favicon,
      'apId': instance.apId,
      'also_known_as': instance.alsoKnownAs,
    };

PleromaApiAccountRelationship _$PleromaApiAccountRelationshipFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountRelationship(
    blocking: json['blocking'] as bool?,
    domainBlocking: json['domain_blocking'] as bool?,
    endorsed: json['endorsed'] as bool?,
    followedBy: json['followed_by'] as bool?,
    following: json['following'] as bool?,
    id: json['id'] as String?,
    muting: json['muting'] as bool?,
    mutingNotifications: json['muting_notifications'] as bool?,
    requested: json['requested'] as bool?,
    showingReblogs: json['showing_reblogs'] as bool?,
    subscribing: json['subscribing'] as bool?,
    blockedBy: json['blocked_by'] as bool?,
    note: json['note'] as String?,
    notifying: json['notifying'] as bool?,
  );
}

Map<String, dynamic> _$PleromaApiAccountRelationshipToJson(
        PleromaApiAccountRelationship instance) =>
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
      'notifying': instance.notifying,
    };

PleromaApiAccountIdentityProof _$PleromaApiAccountIdentityProofFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountIdentityProof(
    profileUrl: json['profileUrl'] as String?,
    proofUrl: json['proofUrl'] as String?,
    provider: json['provider'] as String?,
    providerUsername: json['providerUsername'] as String?,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$PleromaApiAccountIdentityProofToJson(
        PleromaApiAccountIdentityProof instance) =>
    <String, dynamic>{
      'profileUrl': instance.profileUrl,
      'proofUrl': instance.proofUrl,
      'provider': instance.provider,
      'providerUsername': instance.providerUsername,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

PleromaApiAccountReportRequest _$PleromaApiAccountReportRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiAccountReportRequest(
    accountId: json['account_id'] as String,
    comment: json['comment'] as String?,
    forward: json['forward'] as bool?,
    statusIds: (json['status_ids'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiAccountReportRequestToJson(
    PleromaApiAccountReportRequest instance) {
  final val = <String, dynamic>{
    'account_id': instance.accountId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  writeNotNull('forward', instance.forward);
  writeNotNull('status_ids', instance.statusIds);
  return val;
}
