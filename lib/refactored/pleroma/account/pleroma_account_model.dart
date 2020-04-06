import 'dart:convert';

import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/refactored/mastodon/account/mastodon_account_model.dart';
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
  @HiveField(0)
  String username;
  @HiveField(1)
  String url;
  @HiveField(2)
  @JsonKey(name: "statuses_count")
  int statusesCount;
  @HiveField(3)
  String note;
  @HiveField(4)
  bool locked;
  @HiveField(5)
  String id;
  @HiveField(6)
  @JsonKey(name: "header_static")
  String headerStatic;
  @HiveField(7)
  String header;
  @HiveField(8)
  @JsonKey(name: "following_count")
  int followingCount;
  @HiveField(9)
  @JsonKey(name: "followers_count")
  int followersCount;
  @HiveField(10)
  List<PleromaField> fields;
  @HiveField(11)
  List<PleromaEmoji> emojis;
  @HiveField(12)
  @JsonKey(name: "display_name")
  String displayName;
  @HiveField(13)
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @HiveField(14)
  bool bot;
  @HiveField(15)
  @JsonKey(name: "avatar_static")
  String avatarStatic;
  @HiveField(16)
  String avatar;
  @HiveField(17)
  String acct;
  @HiveField(19)
  PleromaAccountPleromaPart pleroma;
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
      new List<PleromaAccount>.from(
          json.decode(str).map((x) => PleromaAccount.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountToJson(this));
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

  @JsonKey(name: "background_image")
  dynamic backgroundImage;


  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
//  List<PleromaTag> tags;
  List<dynamic> tags;


  PleromaAccountRelationship relationship;

  @JsonKey(name: "is_admin")
  bool isAdmin;

  @JsonKey(name: "is_moderator")

  bool isModerator;

  @JsonKey(name: "confirmation_pending")
  bool confirmationPending;


  // TODO: CHECK, was in previous implementation, but not exist at
  @JsonKey(name: "hide_favorites")
  bool hideFavorites;


  @JsonKey(name: "hide_followers")

  bool hideFollowers;

  @JsonKey(name: "hide_follows")
  bool hideFollows;

  @JsonKey(name: "hide_followers_count")
  bool hideFollowersCount;

  @JsonKey(name: "hide_follows_count")
  bool hideFollowsCount;

  /// The token needed for Pleroma chat. Only returned in verify_credentials

  @JsonKey(name: "chat_token")
  String chatToken;

  bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts

  @JsonKey(name: "allow_following_move")
  bool allowFollowingMove;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
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


}


abstract class IPleromaAccountRelationship
    implements IMastodonAccountRelationship {}

@HiveType()
@JsonSerializable()
class PleromaAccountRelationship implements IPleromaAccountRelationship {
  @HiveField(1)
  bool blocking;
  @JsonKey(name: "domain_blocking")
  @HiveField(2)
  bool domainBlocking;
  @HiveField(3)
  bool endorsed;
  @HiveField(4)
  @JsonKey(name: "followed_by")
  bool followedBy;
  @HiveField(5)
  bool following;
  @HiveField(6)
  String id;
  @HiveField(7)
  bool muting;
  @HiveField(8)
  @JsonKey(name: "muting_notifications")
  @HiveField(9)
  bool mutingNotifications;
  @HiveField(10)
  bool requested;
  @JsonKey(name: "showing_reblogs")
  @HiveField(11)
  bool showingReblogs;
  @HiveField(12)
  bool subscribing;

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
  });

  @override
  String toString() {
    return 'PleromaAccountRelationship{blocking: $blocking,'
        ' domainBlocking: $domainBlocking, endorsed: $endorsed,'
        ' followedBy: $followedBy, following: $following, id: $id,'
        ' muting: $muting, mutingNotifications: $mutingNotifications,'
        ' requested: $requested, showingReblogs: $showingReblogs,'
        ' subscribing: $subscribing}';
  }

  factory PleromaAccountRelationship.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountRelationshipFromJson(json);

  factory PleromaAccountRelationship.fromJsonString(String jsonString) =>
      _$PleromaAccountRelationshipFromJson(jsonDecode(jsonString));

  static List<PleromaAccountRelationship> listFromJsonString(String str) =>
      new List<PleromaAccountRelationship>.from(
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
      new List<PleromaAccountIdentityProof>.from(
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

  PleromaAccountReportRequest(
      {@required this.accountId, this.comment, this.forward, this.statusIds});

  factory PleromaAccountReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountReportRequestFromJson(json);

  factory PleromaAccountReportRequest.fromJsonString(String jsonString) =>
      _$PleromaAccountReportRequestFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaAccountReportRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAccountReportRequestToJson(this));
}
