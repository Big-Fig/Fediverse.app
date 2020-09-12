import 'dart:convert';

import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_account_model.g.dart';

abstract class IPleromaAccount implements IMastodonAccount {
  @override
  List<IPleromaField> get fields;

  @override
  List<IPleromaEmoji> get emojis;

  IPleromaAccountPleromaPart get pleroma;
}

@HiveType()
@JsonSerializable(explicitToJson: true)
class PleromaAccount implements IPleromaAccount {
  @override
  @HiveField(0)
  String username;
  @override
  @HiveField(1)
  String url;
  @override
  @HiveField(2)
  @JsonKey(name: "statuses_count")
  int statusesCount;
  @override
  @HiveField(3)
  String note;
  @override
  @HiveField(4)
  bool locked;
  @override
  @HiveField(5)
  String id;
  @override
  @HiveField(6)
  @JsonKey(name: "header_static")
  String headerStatic;
  @override
  @HiveField(7)
  String header;
  @override
  @HiveField(8)
  @JsonKey(name: "following_count")
  int followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: "followers_count")
  int followersCount;
  @override
  @HiveField(10)
  List<PleromaField> fields;
  @override
  @HiveField(11)
  List<PleromaEmoji> emojis;
  @override
  @HiveField(12)
  @JsonKey(name: "display_name")
  String displayName;
  @override
  @HiveField(13)
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @override
  @HiveField(14)
  bool bot;
  @override
  @HiveField(15)
  @JsonKey(name: "avatar_static")
  String avatarStatic;
  @override
  @HiveField(16)
  String avatar;
  @override
  @HiveField(17)
  String acct;
  @override
  @HiveField(19)
  PleromaAccountPleromaPart pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  DateTime lastStatusAt;

  PleromaAccount(
      {this.username,
      this.url,
      this.statusesCount,
      this.note,
      this.locked,
      this.id,
      this.headerStatic,
      this.header,
      this.followingCount,
      this.followersCount,
      this.fields,
      this.emojis,
      this.displayName,
      this.createdAt,
      this.bot,
      this.avatarStatic,
      this.avatar,
      this.acct,
      this.pleroma,
      this.lastStatusAt});

  factory PleromaAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountFromJson(json);

  factory PleromaAccount.fromJsonString(String jsonString) =>
      _$PleromaAccountFromJson(jsonDecode(jsonString));

  static List<PleromaAccount> listFromJsonString(String str) =>
      List<PleromaAccount>.from(
          json.decode(str).map((x) => PleromaAccount.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountToJson(this));

  @override
  String toString() {
    return 'PleromaAccount{username: $username, url: $url,'
        ' statusesCount: $statusesCount, note: $note, locked: $locked,'
        ' id: $id, headerStatic: $headerStatic, header: $header,'
        ' followingCount: $followingCount, followersCount: $followersCount,'
        ' fields: $fields, emojis: $emojis, displayName: $displayName,'
        ' createdAt: $createdAt, bot: $bot, avatarStatic: $avatarStatic,'
        ' avatar: $avatar, acct: $acct, pleroma: $pleroma,'
        ' lastStatusAt: $lastStatusAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccount &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          url == other.url &&
          statusesCount == other.statusesCount &&
          note == other.note &&
          locked == other.locked &&
          id == other.id &&
          headerStatic == other.headerStatic &&
          header == other.header &&
          followingCount == other.followingCount &&
          followersCount == other.followersCount &&
          fields == other.fields &&
          emojis == other.emojis &&
          displayName == other.displayName &&
          createdAt == other.createdAt &&
          bot == other.bot &&
          avatarStatic == other.avatarStatic &&
          avatar == other.avatar &&
          acct == other.acct &&
          pleroma == other.pleroma &&
          lastStatusAt == other.lastStatusAt;

  @override
  int get hashCode =>
      username.hashCode ^
      url.hashCode ^
      statusesCount.hashCode ^
      note.hashCode ^
      locked.hashCode ^
      id.hashCode ^
      headerStatic.hashCode ^
      header.hashCode ^
      followingCount.hashCode ^
      followersCount.hashCode ^
      fields.hashCode ^
      emojis.hashCode ^
      displayName.hashCode ^
      createdAt.hashCode ^
      bot.hashCode ^
      avatarStatic.hashCode ^
      avatar.hashCode ^
      acct.hashCode ^
      pleroma.hashCode ^
      lastStatusAt.hashCode;
}

abstract class IPleromaAccountPleromaPart {
  dynamic get backgroundImage;

//  List<PleromaTag> tags;
  List<dynamic> get tags;

  PleromaAccountRelationship get relationship;

  bool get isAdmin;

  bool get isModerator;

  bool get confirmationPending;

  bool get hideFavorites;

  bool get hideFollowers;

  bool get hideFollows;

  bool get hideFollowersCount;

  bool get hideFollowsCount;

  bool get deactivated;

  bool get allowFollowingMove;

  bool get skipThreadContainment;
}

@JsonSerializable(explicitToJson: true)
class PleromaAccountPleromaPart implements IPleromaAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/

  @override
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
//  List<PleromaTag> tags;
  @override
  List<dynamic> tags;

  @override
  PleromaAccountRelationship relationship;

  @override
  @JsonKey(name: "is_admin")
  bool isAdmin;

  @override
  @JsonKey(name: "is_moderator")
  bool isModerator;

  @override
  @JsonKey(name: "confirmation_pending")
  bool confirmationPending;

  // TODO: CHECK, was in previous implementation, but not exist at
  @override
  @JsonKey(name: "hide_favorites")
  bool hideFavorites;

  @override
  @JsonKey(name: "hide_followers")
  bool hideFollowers;

  @override
  @JsonKey(name: "hide_follows")
  bool hideFollows;

  @override
  @JsonKey(name: "hide_followers_count")
  bool hideFollowersCount;

  @override
  @JsonKey(name: "hide_follows_count")
  bool hideFollowsCount;

  /// The token needed for Pleroma chat. Only returned in verify_credentials

  @JsonKey(name: "chat_token")
  String chatToken;

  @override
  bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts

  @override
  @JsonKey(name: "allow_following_move")
  bool allowFollowingMove;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @JsonKey(name: "skip_thread_containment")
  bool skipThreadContainment;

  PleromaAccountPleromaPart(
      {this.backgroundImage,
      this.tags,
      this.relationship,
      this.isAdmin,
      this.isModerator,
      this.confirmationPending,
      this.hideFavorites,
      this.hideFollowers,
      this.hideFollows,
      this.hideFollowersCount,
      this.hideFollowsCount,
      this.chatToken,
      this.deactivated,
      this.allowFollowingMove,
      this.skipThreadContainment});

  factory PleromaAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountPleromaPartFromJson(json);

  factory PleromaAccountPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaAccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaAccountPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountPleromaPartToJson(this));

  @override
  String toString() {
    return 'PleromaAccountPleromaPart{backgroundImage: $backgroundImage,'
        ' tags: $tags, relationship: $relationship, isAdmin: $isAdmin,'
        ' isModerator: $isModerator, confirmationPending: $confirmationPending,'
        ' hideFavorites: $hideFavorites, hideFollowers: $hideFollowers,'
        ' hideFollows: $hideFollows, hideFollowersCount: $hideFollowersCount,'
        ' hideFollowsCount: $hideFollowsCount, chatToken: $chatToken,'
        ' deactivated: $deactivated, allowFollowingMove: $allowFollowingMove,'
        ' skipThreadContainment: $skipThreadContainment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountPleromaPart &&
          runtimeType == other.runtimeType &&
          backgroundImage == other.backgroundImage &&
          tags == other.tags &&
          relationship == other.relationship &&
          isAdmin == other.isAdmin &&
          isModerator == other.isModerator &&
          confirmationPending == other.confirmationPending &&
          hideFavorites == other.hideFavorites &&
          hideFollowers == other.hideFollowers &&
          hideFollows == other.hideFollows &&
          hideFollowersCount == other.hideFollowersCount &&
          hideFollowsCount == other.hideFollowsCount &&
          chatToken == other.chatToken &&
          deactivated == other.deactivated &&
          allowFollowingMove == other.allowFollowingMove &&
          skipThreadContainment == other.skipThreadContainment;

  @override
  int get hashCode =>
      backgroundImage.hashCode ^
      tags.hashCode ^
      relationship.hashCode ^
      isAdmin.hashCode ^
      isModerator.hashCode ^
      confirmationPending.hashCode ^
      hideFavorites.hashCode ^
      hideFollowers.hashCode ^
      hideFollows.hashCode ^
      hideFollowersCount.hashCode ^
      hideFollowsCount.hashCode ^
      chatToken.hashCode ^
      deactivated.hashCode ^
      allowFollowingMove.hashCode ^
      skipThreadContainment.hashCode;
}

abstract class IPleromaAccountRelationship
    implements IMastodonAccountRelationship {
  IPleromaAccountRelationship copyWith({
    int id,
    bool blocking,
    bool domainBlocking,
    bool endorsed,
    bool followedBy,
    bool following,
    bool muting,
    bool mutingNotifications,
    bool requested,
    bool showingReblogs,
    bool subscribing,
    bool blockedBy,
    bool note,
  });
}

@HiveType()
@JsonSerializable()
class PleromaAccountRelationship implements IPleromaAccountRelationship {
  @override
  @HiveField(1)
  bool blocking;
  @override
  @JsonKey(name: "domain_blocking")
  @HiveField(2)
  bool domainBlocking;
  @override
  @HiveField(3)
  bool endorsed;
  @override
  @HiveField(4)
  @JsonKey(name: "followed_by")
  bool followedBy;
  @override
  @HiveField(5)
  bool following;
  @override
  @HiveField(6)
  String id;
  @override
  @HiveField(7)
  bool muting;
  @override
  @HiveField(8)
  @JsonKey(name: "muting_notifications")
  @HiveField(9)
  bool mutingNotifications;
  @override
  @HiveField(10)
  bool requested;
  @override
  @JsonKey(name: "showing_reblogs")
  @HiveField(11)
  bool showingReblogs;
  @override
  @HiveField(12)
  bool subscribing;

  @override
  @HiveField(13)
  @JsonKey(name: "blocked_by")
  bool blockedBy;

  @override
  @HiveField(14)
  String note;

  PleromaAccountRelationship({
    this.blocking,
    this.domainBlocking,
    this.endorsed,
    this.followedBy,
    this.following,
    this.id,
    this.muting,
    this.mutingNotifications,
    this.requested,
    this.showingReblogs,
    this.subscribing,
    this.blockedBy,
    this.note,
  });

  @override
  PleromaAccountRelationship copyWith({
    int id,
    bool blocking,
    bool domainBlocking,
    bool endorsed,
    bool followedBy,
    bool following,
    bool muting,
    bool mutingNotifications,
    bool requested,
    bool showingReblogs,
    bool subscribing,
    bool blockedBy,
    bool note,
  }) =>
      PleromaAccountRelationship(
        id: id ?? this.id,
        blocking: blocking ?? this.blocking,
        domainBlocking: domainBlocking ?? this.domainBlocking,
        endorsed: endorsed ?? this.endorsed,
        followedBy: followedBy ?? this.followedBy,
        following: following ?? this.following,
        muting: muting ?? this.muting,
        mutingNotifications: mutingNotifications ?? this.mutingNotifications,
        requested: requested ?? this.requested,
        showingReblogs: showingReblogs ?? this.showingReblogs,
        subscribing: subscribing ?? this.subscribing,
        blockedBy: blockedBy ?? this.blockedBy,
        note: note ?? this.note,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountRelationship &&
          runtimeType == other.runtimeType &&
          blocking == other.blocking &&
          domainBlocking == other.domainBlocking &&
          endorsed == other.endorsed &&
          followedBy == other.followedBy &&
          following == other.following &&
          id == other.id &&
          muting == other.muting &&
          mutingNotifications == other.mutingNotifications &&
          requested == other.requested &&
          showingReblogs == other.showingReblogs &&
          blockedBy == other.blockedBy &&
          note == other.note &&
          subscribing == other.subscribing;

  @override
  int get hashCode =>
      blocking.hashCode ^
      domainBlocking.hashCode ^
      endorsed.hashCode ^
      followedBy.hashCode ^
      following.hashCode ^
      id.hashCode ^
      muting.hashCode ^
      mutingNotifications.hashCode ^
      requested.hashCode ^
      showingReblogs.hashCode ^
      blockedBy.hashCode ^
      note.hashCode ^
      subscribing.hashCode;

  @override
  String toString() {
    return 'PleromaAccountRelationship{blocking: $blocking,'
        ' domainBlocking: $domainBlocking, endorsed: $endorsed,'
        ' followedBy: $followedBy, following: $following, id: $id,'
        ' muting: $muting, mutingNotifications: $mutingNotifications,'
        ' requested: $requested, showingReblogs: $showingReblogs,'
        ' subscribing: $subscribing,'
        ' note: $note,'
        ' blockedBy: $blockedBy'
        '}';
  }

  factory PleromaAccountRelationship.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountRelationshipFromJson(json);

  factory PleromaAccountRelationship.fromJsonString(String jsonString) =>
      _$PleromaAccountRelationshipFromJson(jsonDecode(jsonString));

  static List<PleromaAccountRelationship> listFromJsonString(String str) =>
      List<PleromaAccountRelationship>.from(
          json.decode(str).map((x) => PleromaAccountRelationship.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountRelationshipToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountRelationshipToJson(this));
}

abstract class IPleromaAccountIdentityProof
    extends IMastodonAccountIdentityProof {}

@JsonSerializable()
class PleromaAccountIdentityProof extends IPleromaAccountIdentityProof {
  @override
  final String profileUrl;

  @override
  final String proofUrl;

  @override
  final String provider;

  @override
  final String providerUsername;

  @override
  final DateTime updatedAt;

  PleromaAccountIdentityProof(
      {this.profileUrl,
      this.proofUrl,
      this.provider,
      this.providerUsername,
      this.updatedAt});

  @override
  String toString() {
    return 'PleromaAccountIdentityProof{profileUrl: $profileUrl, proofUrl: $proofUrl,'
        ' provider: $provider, providerUsername: $providerUsername,'
        ' updatedAt: $updatedAt}';
  }

  factory PleromaAccountIdentityProof.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountIdentityProofFromJson(json);

  factory PleromaAccountIdentityProof.fromJsonString(String jsonString) =>
      _$PleromaAccountIdentityProofFromJson(jsonDecode(jsonString));

  static List<PleromaAccountIdentityProof> listFromJsonString(String str) =>
      List<PleromaAccountIdentityProof>.from(
          json.decode(str).map((x) => PleromaAccountIdentityProof.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountIdentityProofToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAccountIdentityProofToJson(this));
}

abstract class IPleromaAccountReportRequest
    implements IMastodonAccountReportRequest {
  Map<String, dynamic> toJson();
}

@JsonSerializable()
class PleromaAccountReportRequest implements IPleromaAccountReportRequest {
  @JsonKey(name: "account_id")
  @override
  final String accountId;

  @override
  final String comment;

  @override
  final bool forward;

  @JsonKey(name: "status_ids")
  @override
  final List<String> statusIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountReportRequest &&
          runtimeType == other.runtimeType &&
          accountId == other.accountId &&
          comment == other.comment &&
          forward == other.forward &&
          statusIds == other.statusIds;

  @override
  int get hashCode =>
      accountId.hashCode ^
      comment.hashCode ^
      forward.hashCode ^
      statusIds.hashCode;

  PleromaAccountReportRequest(
      {@required this.accountId, this.comment, this.forward, this.statusIds});

  factory PleromaAccountReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountReportRequestFromJson(json);

  factory PleromaAccountReportRequest.fromJsonString(String jsonString) =>
      _$PleromaAccountReportRequestFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaAccountReportRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAccountReportRequestToJson(this));
}
