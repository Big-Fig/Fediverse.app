import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_account_model.g.dart';

Function eq = const ListEquality().equals;

abstract class IPleromaAccount implements IMastodonAccount {
  @override
  List<IPleromaField> get fields;

  @override
  List<IPleromaEmoji> get emojis;

  IPleromaAccountPleromaPart get pleroma;

  String get fqn;
}

abstract class IPleromaAccountReport {
  List<IPleromaStatus> get statuses;

  IPleromaAccount get account;

  IPleromaAccount get user;
}

@JsonSerializable(explicitToJson: true)
class PleromaAccountReport implements IPleromaAccountReport {
  @override
  final PleromaAccount account;

  @override
  final List<PleromaStatus> statuses;

  @override
  final PleromaAccount user;

  PleromaAccountReport({
    @required this.account,
    @required this.statuses,
    @required this.user,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaAccountReport &&
          runtimeType == other.runtimeType &&
          account == other.account &&
          statuses == other.statuses &&
          user == other.user;

  @override
  int get hashCode => account.hashCode ^ statuses.hashCode ^ user.hashCode;

  @override
  String toString() => 'PleromaAccountReport{'
      'account: $account, '
      'statuses: $statuses, '
      'user: $user'
      '}';


  factory PleromaAccountReport.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountReportFromJson(json);

  factory PleromaAccountReport.fromJsonString(String jsonString) =>
      _$PleromaAccountReportFromJson(jsonDecode(jsonString));

  static List<PleromaAccountReport> listFromJsonString(String str) =>
      List<PleromaAccountReport>.from(
          json.decode(str).map((x) => PleromaAccountReport.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountReportToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountReportToJson(this));

}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 64)
@JsonSerializable(explicitToJson: true)
class PleromaAccount implements IPleromaAccount {
  @override
  @HiveField(0)
  final String username;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  @JsonKey(name: "statuses_count")
  final int statusesCount;
  @override
  @HiveField(3)
  final String note;
  @override
  @HiveField(4)
  final bool locked;
  @override
  @HiveField(5)
  final String id;
  @override
  @HiveField(6)
  @JsonKey(name: "header_static")
  final String headerStatic;
  @override
  @HiveField(7)
  final String header;
  @override
  @HiveField(8)
  @JsonKey(name: "following_count")
  final int followingCount;
  @override
  @HiveField(9)
  @JsonKey(name: "followers_count")
  final int followersCount;
  @override
  @HiveField(10)
  final List<PleromaField> fields;
  @override
  @HiveField(11)
  final List<PleromaEmoji> emojis;
  @override
  @HiveField(12)
  @JsonKey(name: "display_name")
  final String displayName;
  @override
  @HiveField(13)
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @HiveField(14)
  final bool bot;
  @override
  @HiveField(15)
  @JsonKey(name: "avatar_static")
  final String avatarStatic;
  @override
  @HiveField(16)
  final String avatar;
  @override
  @HiveField(17)
  final String acct;
  @override
  @HiveField(19)
  final PleromaAccountPleromaPart pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  final DateTime lastStatusAt;

  @HiveField(21)
  @override
  final String fqn;

  PleromaAccount({
    this.username,
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
    this.lastStatusAt,
    this.fqn,
  });

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
        ' avatar: $avatar, acct: $acct,'
        ' pleroma: $pleroma,'
        ' fqn: $fqn,'
        ' lastStatusAt: $lastStatusAt'
        '}';
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
          eq(fields, other.fields) &&
          eq(emojis, other.emojis) &&
          displayName == other.displayName &&
          createdAt == other.createdAt &&
          bot == other.bot &&
          avatarStatic == other.avatarStatic &&
          avatar == other.avatar &&
          acct == other.acct &&
          pleroma == other.pleroma &&
          fqn == other.fqn &&
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
      fqn.hashCode ^
      lastStatusAt.hashCode;
}

abstract class IPleromaAccountPleromaPart {
  String get backgroundImage;

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

  bool get acceptsChatMessages;

  bool get skipThreadContainment;

  bool get isConfirmed;

  String get favicon;

  String get apId;

  List<String> get alsoKnownAs;

  IPleromaAccountPleromaPart copyWith({
    String backgroundImage,
    List<dynamic> tags,
    PleromaAccountRelationship relationship,
    bool isAdmin,
    bool isModerator,
    bool confirmationPending,
    bool hideFavorites,
    bool hideFollowers,
    bool hideFollows,
    bool hideFollowersCount,
    bool hideFollowsCount,
    bool deactivated,
    bool allowFollowingMove,
    bool skipThreadContainment,
    bool acceptsChatMessages,
    bool isConfirmed,
    String favicon,
    String apId,
    List<String> alsoKnownAs,
  });
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 75)
@JsonSerializable(explicitToJson: true)
class PleromaAccountPleromaPart implements IPleromaAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @HiveField(1)
  @JsonKey(name: "background_image")
  final String backgroundImage;

  @override
  @HiveField(2)
  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
//  List<PleromaTag> tags;
  final List<dynamic> tags;

  @override
  @HiveField(3)
  final PleromaAccountRelationship relationship;
  @override
  @HiveField(4)
  @JsonKey(name: "is_admin")
  final bool isAdmin;
  @override
  @HiveField(5)
  @JsonKey(name: "is_moderator")
  final bool isModerator;

  @override
  @HiveField(7)
  @JsonKey(name: "confirmation_pending")
  final bool confirmationPending;

  @override
  @HiveField(8)
  @JsonKey(name: "hide_favorites")
  final bool hideFavorites;
  @override
  @HiveField(9)
  @JsonKey(name: "hide_followers")
  final bool hideFollowers;
  @override
  @HiveField(11)
  @JsonKey(name: "hide_follows")
  final bool hideFollows;
  @override
  @HiveField(12)
  @JsonKey(name: "hide_followers_count")
  final bool hideFollowersCount;
  @override
  @HiveField(13)
  @JsonKey(name: "hide_follows_count")
  final bool hideFollowsCount;

  @override
  @HiveField(16)
  final bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @override
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  final bool allowFollowingMove;

  @override
  @HiveField(18)
  @JsonKey(name: "skip_thread_containment")
  final bool skipThreadContainment;

  @override
  @HiveField(19)
  @JsonKey(name: "accepts_chat_messages")
  final bool acceptsChatMessages;

  @override
  @HiveField(20)
  @JsonKey(name: "is_confirmed")
  final bool isConfirmed;

  @override
  @HiveField(21)
  final String favicon;

  @override
  @HiveField(22)
  final String apId;
  @override
  @HiveField(23)
  @JsonKey(name: "also_known_as")
  final List<String> alsoKnownAs;

  PleromaAccountPleromaPart({
    this.backgroundImage,
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
    this.deactivated,
    this.allowFollowingMove,
    this.skipThreadContainment,
    this.acceptsChatMessages,
    this.isConfirmed,
    this.favicon,
    this.apId,
    this.alsoKnownAs,
  });

  factory PleromaAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountPleromaPartFromJson(json);

  factory PleromaAccountPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaAccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaAccountPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountPleromaPartToJson(this));

  @override
  PleromaAccountPleromaPart copyWith({
    String backgroundImage,
    List<dynamic> tags,
    PleromaAccountRelationship relationship,
    bool isAdmin,
    bool isModerator,
    bool confirmationPending,
    bool hideFavorites,
    bool hideFollowers,
    bool hideFollows,
    bool hideFollowersCount,
    bool hideFollowsCount,
    bool deactivated,
    bool allowFollowingMove,
    bool skipThreadContainment,
    bool acceptsChatMessages,
    bool isConfirmed,
    String favicon,
    String apId,
    List<String> alsoKnownAs,
  }) =>
      PleromaAccountPleromaPart(
        backgroundImage: backgroundImage ?? this.backgroundImage,
        tags: tags ?? this.tags,
        relationship: relationship ?? this.relationship,
        isAdmin: isAdmin ?? this.isAdmin,
        isModerator: isModerator ?? this.isModerator,
        confirmationPending: confirmationPending ?? this.confirmationPending,
        hideFavorites: hideFavorites ?? this.hideFavorites,
        hideFollowers: hideFollowers ?? this.hideFollowers,
        hideFollows: hideFollows ?? this.hideFollows,
        hideFollowersCount: hideFollowersCount ?? this.hideFollowersCount,
        hideFollowsCount: hideFollowsCount ?? this.hideFollowsCount,
        deactivated: deactivated ?? this.deactivated,
        allowFollowingMove: allowFollowingMove ?? this.allowFollowingMove,
        skipThreadContainment:
            skipThreadContainment ?? this.skipThreadContainment,
        acceptsChatMessages: acceptsChatMessages ?? this.acceptsChatMessages,
        isConfirmed: isConfirmed ?? this.isConfirmed,
        favicon: favicon ?? this.favicon,
        apId: apId ?? this.apId,
        alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
      );

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
          deactivated == other.deactivated &&
          allowFollowingMove == other.allowFollowingMove &&
          skipThreadContainment == other.skipThreadContainment &&
          acceptsChatMessages == other.acceptsChatMessages &&
          isConfirmed == other.isConfirmed &&
          favicon == other.favicon &&
          apId == other.apId &&
          alsoKnownAs == other.alsoKnownAs;

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
      deactivated.hashCode ^
      allowFollowingMove.hashCode ^
      skipThreadContainment.hashCode ^
      acceptsChatMessages.hashCode ^
      isConfirmed.hashCode ^
      favicon.hashCode ^
      apId.hashCode ^
      alsoKnownAs.hashCode;

  @override
  String toString() => 'PleromaAccountPleromaPart{'
      'backgroundImage: $backgroundImage, '
      'tags: $tags, '
      'relationship: $relationship, '
      'isAdmin: $isAdmin, '
      'isModerator: $isModerator, '
      'confirmationPending: $confirmationPending, '
      'hideFavorites: $hideFavorites, '
      'hideFollowers: $hideFollowers, '
      'hideFollows: $hideFollows, '
      'hideFollowersCount: $hideFollowersCount, '
      'hideFollowsCount: $hideFollowsCount, '
      'deactivated: $deactivated, '
      'allowFollowingMove: $allowFollowingMove, '
      'skipThreadContainment: $skipThreadContainment, '
      'acceptsChatMessages: $acceptsChatMessages, '
      'favicon: $favicon, '
      'isConfirmed: $isConfirmed, '
      'alsoKnownAs: $alsoKnownAs, '
      'apId: $apId'
      '}';
}

abstract class IPleromaAccountRelationship
    implements IMastodonAccountRelationship {
  IPleromaAccountRelationship copyWith({
    bool blocking,
    bool domainBlocking,
    bool endorsed,
    bool followedBy,
    bool following,
    String id,
    bool muting,
    bool mutingNotifications,
    bool requested,
    bool showingReblogs,
    bool subscribing,
    bool blockedBy,
    String note,
  });
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 42)
@JsonSerializable()
class PleromaAccountRelationship implements IPleromaAccountRelationship {
  @override
  @HiveField(1)
  final bool blocking;
  @override
  @JsonKey(name: "domain_blocking")
  @HiveField(2)
  final bool domainBlocking;
  @override
  @HiveField(3)
  final bool endorsed;
  @override
  @HiveField(4)
  @JsonKey(name: "followed_by")
  final bool followedBy;
  @override
  @HiveField(5)
  final bool following;
  @override
  @HiveField(6)
  final String id;
  @override
  @HiveField(7)
  final bool muting;
  @override
  @HiveField(8)
  @JsonKey(name: "muting_notifications")
  @HiveField(9)
  final bool mutingNotifications;
  @override
  @HiveField(10)
  final bool requested;
  @override
  @JsonKey(name: "showing_reblogs")
  @HiveField(11)
  final bool showingReblogs;
  @override
  @HiveField(12)
  final bool subscribing;

  @override
  @HiveField(13)
  @JsonKey(name: "blocked_by")
  final bool blockedBy;

  @override
  @HiveField(14)
  final String note;

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
    bool blocking,
    bool domainBlocking,
    bool endorsed,
    bool followedBy,
    bool following,
    String id,
    bool muting,
    bool mutingNotifications,
    bool requested,
    bool showingReblogs,
    bool subscribing,
    bool blockedBy,
    String note,
  }) =>
      PleromaAccountRelationship(
        blocking: blocking ?? this.blocking,
        domainBlocking: domainBlocking ?? this.domainBlocking,
        endorsed: endorsed ?? this.endorsed,
        followedBy: followedBy ?? this.followedBy,
        following: following ?? this.following,
        id: id ?? this.id,
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
          subscribing == other.subscribing &&
          blockedBy == other.blockedBy &&
          note == other.note;

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
      subscribing.hashCode ^
      blockedBy.hashCode ^
      note.hashCode;

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

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
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

  PleromaAccountReportRequest({
    @required this.accountId,
    this.comment,
    this.forward,
    this.statusIds,
  });

  factory PleromaAccountReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountReportRequestFromJson(json);

  factory PleromaAccountReportRequest.fromJsonString(String jsonString) =>
      _$PleromaAccountReportRequestFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaAccountReportRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaAccountReportRequestToJson(this));
}
