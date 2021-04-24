import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fedi/mastodon/api/account/mastodon_api_account_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_account_model.g.dart';

// ignore_for_file: no-magic-number
Function _listEq = const ListEquality().equals;

abstract class IPleromaApiAccount implements IMastodonApiAccount {
  @override
  List<IPleromaApiField>? get fields;

  @override
  List<IPleromaApiEmoji>? get emojis;

  IPleromaApiAccountPleromaPart? get pleroma;

  String? get fqn;

  IPleromaApiAccount copyWith({
    String? username,
    String? url,
    int? statusesCount,
    String? note,
    bool? locked,
    String? id,
    String? headerStatic,
    String? header,
    int? followingCount,
    int? followersCount,
    List<IPleromaApiField>? fields,
    List<IPleromaApiEmoji>? emojis,
    String? displayName,
    DateTime? createdAt,
    bool? bot,
    String? avatarStatic,
    String? avatar,
    String? acct,
    IPleromaApiAccountPleromaPart? pleroma,
    DateTime? lastStatusAt,
    String? fqn,
  });
}

extension IPleromaApiAccountExtension on IPleromaApiAccount {
  PleromaApiAccount toPleromaApiAccount() {
    if (this is PleromaApiAccount) {
      return this as PleromaApiAccount;
    } else {
      return PleromaApiAccount(
        pleroma: pleroma?.toPleromaApiAccountPleromaPart(),
        id: id,
        username: username,
        url: url,
        note: note,
        locked: locked,
        headerStatic: headerStatic,
        header: header,
        followingCount: followingCount,
        followersCount: followersCount,
        statusesCount: statusesCount,
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        lastStatusAt: lastStatusAt,
        fields: fields?.toPleromaApiFields(),
        emojis: emojis?.toPleromaApiEmojis(),
        fqn: fqn,
      );
    }
  }
}

extension IPleromaApiAccountListExtension on List<IPleromaApiAccount> {
  List<PleromaApiAccount> toPleromaApiAccounts() {
    if (this is List<PleromaApiAccount>) {
      return this as List<PleromaApiAccount>;
    } else {
      return map(
        (account) => account.toPleromaApiAccount(),
      ).toList();
    }
  }
}

abstract class IPleromaApiAccountReport {
  List<IPleromaApiStatus>? get statuses;

  IPleromaApiAccount? get account;

  IPleromaApiAccount? get user;
}

extension IPleromaApiAccountReportExtension on IPleromaApiAccountReport {
  PleromaApiAccountReport toPleromaApiAccountReport() {
    if (this is PleromaApiAccountReport) {
      return this as PleromaApiAccountReport;
    } else {
      return PleromaApiAccountReport(
        account: account?.toPleromaApiAccount(),
        statuses: statuses?.toPleromaApiStatuses(),
        user: user?.toPleromaApiAccount(),
      );
    }
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiAccountReport implements IPleromaApiAccountReport {
  @override
  final PleromaApiAccount? account;

  @override
  final List<PleromaApiStatus>? statuses;

  @override
  final PleromaApiAccount? user;

  PleromaApiAccountReport({
    required this.account,
    required this.statuses,
    required this.user,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountReport &&
          runtimeType == other.runtimeType &&
          account == other.account &&
          _listEq(statuses, other.statuses) &&
          user == other.user;

  @override
  int get hashCode => account.hashCode ^ statuses.hashCode ^ user.hashCode;

  @override
  String toString() => 'PleromaApiAccountReport{'
      'account: $account, '
      'statuses: $statuses, '
      'user: $user'
      '}';

  factory PleromaApiAccountReport.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountReportFromJson(json);

  factory PleromaApiAccountReport.fromJsonString(String jsonString) =>
      _$PleromaApiAccountReportFromJson(jsonDecode(jsonString));

  static List<PleromaApiAccountReport> listFromJsonString(String str) =>
      List<PleromaApiAccountReport>.from(
        json.decode(str).map((x) => PleromaApiAccountReport.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiAccountReportToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiAccountReportToJson(this));
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 64)
@JsonSerializable(explicitToJson: true)
class PleromaApiAccount implements IPleromaApiAccount {
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
  final String? note;
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
  final List<PleromaApiField>? fields;
  @override
  @HiveField(11)
  final List<PleromaApiEmoji>? emojis;
  @override
  @HiveField(12)
  @JsonKey(name: "display_name")
  final String? displayName;
  @override
  @HiveField(13)
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @HiveField(14)
  final bool? bot;
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
  final PleromaApiAccountPleromaPart? pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  final DateTime? lastStatusAt;

  @HiveField(21)
  @override
  final String? fqn;

  PleromaApiAccount({
    required this.username,
    required this.url,
    required this.statusesCount,
    required this.note,
    required this.locked,
    required this.id,
    required this.headerStatic,
    required this.header,
    required this.followingCount,
    required this.followersCount,
    required this.fields,
    required this.emojis,
    required this.displayName,
    required this.createdAt,
    required this.bot,
    required this.avatarStatic,
    required this.avatar,
    required this.acct,
    required this.pleroma,
    required this.lastStatusAt,
    required this.fqn,
  });

  static PleromaApiAccount fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiAccountToJson(this);

  @override
  String toString() {
    return 'PleromaApiAccount{'
        'username: $username, '
        'url: $url, '
        'statusesCount: $statusesCount, '
        'note: $note, '
        'locked: $locked, '
        'id: $id, '
        'headerStatic: $headerStatic, '
        'header: $header,'
        'followingCount: $followingCount, '
        'followersCount: $followersCount,'
        'fields: $fields, '
        'emojis: $emojis, '
        'displayName: $displayName,'
        'createdAt: $createdAt, '
        'bot: $bot, '
        'avatarStatic: $avatarStatic,'
        'avatar: $avatar, '
        'acct: $acct,'
        'pleroma: $pleroma,'
        'fqn: $fqn,'
        'lastStatusAt: $lastStatusAt'
        '}';
  }

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccount &&
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
          _listEq(fields, other.fields) &&
          _listEq(emojis, other.emojis) &&
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

  @override
  // ignore: long-parameter-list, code-metrics
  PleromaApiAccount copyWith({
    String? username,
    String? url,
    int? statusesCount,
    String? note,
    bool? locked,
    String? id,
    String? headerStatic,
    String? header,
    int? followingCount,
    int? followersCount,
    List<IPleromaApiField>? fields,
    List<IPleromaApiEmoji>? emojis,
    String? displayName,
    DateTime? createdAt,
    bool? bot,
    String? avatarStatic,
    String? avatar,
    String? acct,
    IPleromaApiAccountPleromaPart? pleroma,
    DateTime? lastStatusAt,
    String? fqn,
  }) {
    if ((username == null || identical(username, this.username)) &&
        (url == null || identical(url, this.url)) &&
        (statusesCount == null ||
            identical(statusesCount, this.statusesCount)) &&
        (note == null || identical(note, this.note)) &&
        (locked == null || identical(locked, this.locked)) &&
        (id == null || identical(id, this.id)) &&
        (headerStatic == null || identical(headerStatic, this.headerStatic)) &&
        (header == null || identical(header, this.header)) &&
        (followingCount == null ||
            identical(followingCount, this.followingCount)) &&
        (followersCount == null ||
            identical(followersCount, this.followersCount)) &&
        (fields == null || identical(fields, this.fields)) &&
        (emojis == null || identical(emojis, this.emojis)) &&
        (displayName == null || identical(displayName, this.displayName)) &&
        (createdAt == null || identical(createdAt, this.createdAt)) &&
        (bot == null || identical(bot, this.bot)) &&
        (avatarStatic == null || identical(avatarStatic, this.avatarStatic)) &&
        (avatar == null || identical(avatar, this.avatar)) &&
        (acct == null || identical(acct, this.acct)) &&
        (pleroma == null || identical(pleroma, this.pleroma)) &&
        (lastStatusAt == null || identical(lastStatusAt, this.lastStatusAt)) &&
        (fqn == null || identical(fqn, this.fqn))) {
      return this;
    }

    return PleromaApiAccount(
      username: username ?? this.username,
      url: url ?? this.url,
      statusesCount: statusesCount ?? this.statusesCount,
      note: note ?? this.note,
      locked: locked ?? this.locked,
      id: id ?? this.id,
      headerStatic: headerStatic ?? this.headerStatic,
      header: header ?? this.header,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      fields: fields?.toPleromaApiFields() ?? this.fields,
      emojis: emojis?.toPleromaApiEmojis() ?? this.emojis,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      bot: bot ?? this.bot,
      avatarStatic: avatarStatic ?? this.avatarStatic,
      avatar: avatar ?? this.avatar,
      acct: acct ?? this.acct,
      pleroma: pleroma?.toPleromaApiAccountPleromaPart() ?? this.pleroma,
      lastStatusAt: lastStatusAt ?? this.lastStatusAt,
      fqn: fqn ?? this.fqn,
    );
  }
}

abstract class IPleromaApiAccountPleromaPart {
  String? get backgroundImage;

  List<PleromaApiTag>? get tags;

  PleromaApiAccountRelationship? get relationship;

  bool? get isAdmin;

  bool? get isModerator;

  bool? get confirmationPending;

  bool? get hideFavorites;

  bool? get hideFollowers;

  bool? get hideFollows;

  bool? get hideFollowersCount;

  bool? get hideFollowsCount;

  bool? get deactivated;

  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  bool? get skipThreadContainment;

  bool? get isConfirmed;

  String? get favicon;

  String? get apId;

  List<String>? get alsoKnownAs;

  IPleromaApiAccountPleromaPart copyWith({
    String? backgroundImage,
    List<IPleromaApiTag>? tags,
    IPleromaApiAccountRelationship? relationship,
    bool? isAdmin,
    bool? isModerator,
    bool? confirmationPending,
    bool? hideFavorites,
    bool? hideFollowers,
    bool? hideFollows,
    bool? hideFollowersCount,
    bool? hideFollowsCount,
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    bool? acceptsChatMessages,
    bool? isConfirmed,
    String? favicon,
    String? apId,
    List<String>? alsoKnownAs,
  });
}

extension IPleromaApiAccountPleromaPartExtension
    on IPleromaApiAccountPleromaPart {
  PleromaApiAccountPleromaPart toPleromaApiAccountPleromaPart() {
    if (this is PleromaApiAccountPleromaPart) {
      return this as PleromaApiAccountPleromaPart;
    } else {
      return PleromaApiAccountPleromaPart(
        backgroundImage: backgroundImage,
        tags: tags,
        relationship: relationship,
        isAdmin: isAdmin,
        isModerator: isModerator,
        confirmationPending: confirmationPending,
        hideFavorites: hideFavorites,
        hideFollowers: hideFollowers,
        hideFollows: hideFollows,
        hideFollowersCount: hideFollowersCount,
        hideFollowsCount: hideFollowsCount,
        deactivated: deactivated,
        allowFollowingMove: allowFollowingMove,
        skipThreadContainment: skipThreadContainment,
        acceptsChatMessages: acceptsChatMessages,
        apId: apId,
        isConfirmed: isConfirmed,
        alsoKnownAs: alsoKnownAs,
        favicon: favicon,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 75)
@JsonSerializable(explicitToJson: true)
class PleromaApiAccountPleromaPart implements IPleromaApiAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @HiveField(1)
  @JsonKey(name: "background_image")
  final String? backgroundImage;

  @override
  @HiveField(2)
  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
  final List<PleromaApiTag>? tags;

  @override
  @HiveField(3)
  final PleromaApiAccountRelationship? relationship;
  @override
  @HiveField(4)
  @JsonKey(name: "is_admin")
  final bool? isAdmin;
  @override
  @HiveField(5)
  @JsonKey(name: "is_moderator")
  final bool? isModerator;

  @override
  @HiveField(7)
  @JsonKey(name: "confirmation_pending")
  final bool? confirmationPending;

  @override
  @HiveField(8)
  @JsonKey(name: "hide_favorites")
  final bool? hideFavorites;
  @override
  @HiveField(9)
  @JsonKey(name: "hide_followers")
  final bool? hideFollowers;
  @override
  @HiveField(11)
  @JsonKey(name: "hide_follows")
  final bool? hideFollows;
  @override
  @HiveField(12)
  @JsonKey(name: "hide_followers_count")
  final bool? hideFollowersCount;
  @override
  @HiveField(13)
  @JsonKey(name: "hide_follows_count")
  final bool? hideFollowsCount;

  @override
  @HiveField(16)
  final bool? deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @override
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  final bool? allowFollowingMove;

  @override
  @HiveField(18)
  @JsonKey(name: "skip_thread_containment")
  final bool? skipThreadContainment;

  @override
  @HiveField(19)
  @JsonKey(name: "accepts_chat_messages")
  final bool? acceptsChatMessages;

  @override
  @HiveField(20)
  @JsonKey(name: "is_confirmed")
  final bool? isConfirmed;

  @override
  @HiveField(21)
  final String? favicon;

  @override
  @HiveField(22)
  final String? apId;
  @override
  @HiveField(23)
  @JsonKey(name: "also_known_as")
  final List<String>? alsoKnownAs;

  PleromaApiAccountPleromaPart({
    required this.backgroundImage,
    required this.tags,
    required this.relationship,
    required this.isAdmin,
    required this.isModerator,
    required this.confirmationPending,
    required this.hideFavorites,
    required this.hideFollowers,
    required this.hideFollows,
    required this.hideFollowersCount,
    required this.hideFollowsCount,
    required this.deactivated,
    required this.allowFollowingMove,
    required this.skipThreadContainment,
    required this.acceptsChatMessages,
    required this.isConfirmed,
    required this.favicon,
    required this.apId,
    required this.alsoKnownAs,
  });

  factory PleromaApiAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountPleromaPartFromJson(json);

  factory PleromaApiAccountPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaApiAccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApiAccountPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiAccountPleromaPartToJson(this));

  @override
  // ignore: long-parameter-list, code-metrics
  PleromaApiAccountPleromaPart copyWith({
    String? backgroundImage,
    List<IPleromaApiTag>? tags,
    IPleromaApiAccountRelationship? relationship,
    bool? isAdmin,
    bool? isModerator,
    bool? confirmationPending,
    bool? hideFavorites,
    bool? hideFollowers,
    bool? hideFollows,
    bool? hideFollowersCount,
    bool? hideFollowsCount,
    bool? deactivated,
    bool? allowFollowingMove,
    bool? skipThreadContainment,
    bool? acceptsChatMessages,
    bool? isConfirmed,
    String? favicon,
    String? apId,
    List<String>? alsoKnownAs,
  }) =>
      PleromaApiAccountPleromaPart(
        backgroundImage: backgroundImage ?? this.backgroundImage,
        tags: tags?.toPleromaApiTags() ?? this.tags,
        relationship: relationship?.toPleromaApiAccountRelationship() ??
            this.relationship,
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
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountPleromaPart &&
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
  String toString() => 'PleromaApiAccountPleromaPart{'
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

abstract class IPleromaApiAccountRelationship
    implements IMastodonAccountRelationship {
  IPleromaApiAccountRelationship copyWith({
    bool? blocking,
    bool? domainBlocking,
    bool? endorsed,
    bool? followedBy,
    bool? following,
    String? id,
    bool? muting,
    bool? mutingNotifications,
    bool? requested,
    bool? showingReblogs,
    bool? subscribing,
    bool? blockedBy,
    String? note,
  });
}

extension IPleromaApiAccountRelationshipExtension
    on IPleromaApiAccountRelationship {
  PleromaApiAccountRelationship toPleromaApiAccountRelationship() {
    if (this is PleromaApiAccountRelationship) {
      return this as PleromaApiAccountRelationship;
    } else {
      return PleromaApiAccountRelationship(
        blocking: blocking,
        domainBlocking: domainBlocking,
        endorsed: endorsed,
        followedBy: followedBy,
        following: following,
        id: id,
        muting: muting,
        mutingNotifications: mutingNotifications,
        requested: requested,
        showingReblogs: showingReblogs,
        subscribing: subscribing,
        blockedBy: blockedBy,
        note: note,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 42)
@JsonSerializable()
class PleromaApiAccountRelationship implements IPleromaApiAccountRelationship {
  @override
  @HiveField(1)
  final bool? blocking;
  @override
  @JsonKey(name: "domain_blocking")
  @HiveField(2)
  final bool? domainBlocking;
  @override
  @HiveField(3)
  final bool? endorsed;
  @override
  @HiveField(4)
  @JsonKey(name: "followed_by")
  final bool? followedBy;
  @override
  @HiveField(5)
  final bool? following;
  @override
  @HiveField(6)
  final String? id;
  @override
  @HiveField(7)
  final bool? muting;
  @override
  @HiveField(8)
  @JsonKey(name: "muting_notifications")
  @HiveField(9)
  final bool? mutingNotifications;
  @override
  @HiveField(10)
  final bool? requested;
  @override
  @JsonKey(name: "showing_reblogs")
  @HiveField(11)
  final bool? showingReblogs;
  @override
  @HiveField(12)
  final bool? subscribing;

  @override
  @HiveField(13)
  @JsonKey(name: "blocked_by")
  final bool? blockedBy;

  @override
  @HiveField(14)
  final String? note;

  PleromaApiAccountRelationship({
    required this.blocking,
    required this.domainBlocking,
    required this.endorsed,
    required this.followedBy,
    required this.following,
    required this.id,
    required this.muting,
    required this.mutingNotifications,
    required this.requested,
    required this.showingReblogs,
    required this.subscribing,
    required this.blockedBy,
    required this.note,
  });

  @override
  // ignore: long-parameter-list
  PleromaApiAccountRelationship copyWith({
    bool? blocking,
    bool? domainBlocking,
    bool? endorsed,
    bool? followedBy,
    bool? following,
    String? id,
    bool? muting,
    bool? mutingNotifications,
    bool? requested,
    bool? showingReblogs,
    bool? subscribing,
    bool? blockedBy,
    String? note,
  }) =>
      PleromaApiAccountRelationship(
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
      other is PleromaApiAccountRelationship &&
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
    return 'PleromaApiAccountRelationship{'
        'blocking: $blocking,'
        'domainBlocking: $domainBlocking, '
        'endorsed: $endorsed, '
        'followedBy: $followedBy, '
        'following: $following, '
        'id: $id, '
        'muting: $muting, '
        'mutingNotifications: $mutingNotifications, '
        'requested: $requested, '
        'showingReblogs: $showingReblogs, '
        'subscribing: $subscribing, '
        'note: $note, '
        'blockedBy: $blockedBy'
        '}';
  }

  static PleromaApiAccountRelationship fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountRelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiAccountRelationshipToJson(this);
}

abstract class IPleromaApiAccountIdentityProof
    extends IMastodonApiAccountIdentityProof {}

@JsonSerializable()
class PleromaApiAccountIdentityProof extends IPleromaApiAccountIdentityProof {
  @override
  final String? profileUrl;

  @override
  final String? proofUrl;

  @override
  final String? provider;

  @override
  final String? providerUsername;

  @override
  final DateTime? updatedAt;

  PleromaApiAccountIdentityProof({
    this.profileUrl,
    this.proofUrl,
    this.provider,
    this.providerUsername,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'PleromaApiAccountIdentityProof{'
        'profileUrl: $profileUrl, '
        'proofUrl: $proofUrl, '
        'provider: $provider, '
        'providerUsername: $providerUsername, '
        'updatedAt: $updatedAt'
        '}';
  }

  static PleromaApiAccountIdentityProof fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountIdentityProofFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiAccountIdentityProofToJson(this);
}

abstract class IPleromaApiAccountReportRequest
    implements IMastodonApiAccountReportRequest {
  Map<String, dynamic> toJson();
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PleromaApiAccountReportRequest
    implements IPleromaApiAccountReportRequest {
  @JsonKey(name: "account_id")
  @override
  final String accountId;

  @override
  final String? comment;

  @override
  final bool? forward;

  @JsonKey(name: "status_ids")
  @override
  final List<String>? statusIds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountReportRequest &&
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

  PleromaApiAccountReportRequest({
    required this.accountId,
    this.comment,
    this.forward,
    this.statusIds,
  });

  factory PleromaApiAccountReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiAccountReportRequestFromJson(json);

  factory PleromaApiAccountReportRequest.fromJsonString(String jsonString) =>
      _$PleromaApiAccountReportRequestFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaApiAccountReportRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaApiAccountReportRequestToJson(this));
}
