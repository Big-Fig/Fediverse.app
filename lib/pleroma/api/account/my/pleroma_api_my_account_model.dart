import 'dart:io';

import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/account/my/mastodon_api_my_account_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/field/pleroma_api_field_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_my_account_model.g.dart';

abstract class IPleromaApiMyAccountEdit extends IMastodonApiMyAccountEdit {
  @override
  IPleromaApiMyAccountEditSource? get source;

  @override
  Map<int, IPleromaApiField>? get fieldsAttributes;

  /// if true, html tags are stripped from all statuses requested from the API
  bool? get noRichText;

  /// if true, user's followers will be hidden
  bool? get hideFollowers;

  ///  if true, user's follows will be hidden
  bool? get hideFollows;

  /// if true, user's follower count will be hidden
  bool? get hideFollowersCount;

  /// if true, user's follow count will be hidden
  bool? get hideFollowsCount;

  /// if true, user's favorites timeline will be hidden
  bool? get hideFavorites;

  /// if true, user's role (e.g admin, moderator) will be exposed to anyone in the API
  bool? get showRole;

  /// the scope returned under privacy key in Source subentity
  String? get defaultScope;

  /// Opaque user settings to be saved on the backend
  Map<String, dynamic>? get pleromaSettingsStore;

  /// if true, skip filtering out broken threads
  bool? get skipThreadContainment;

  /// if true, allows automatically follow moved following accounts
  bool? get allowFollowingMove;

  bool? get acceptsChatMessages;

  /// sets the background image of the user
  String? get pleromaBackgroundImage;

  /// the type of this account.
  dynamic get actorType;

  // array of ActivityPub IDs, needed for following move
  List<String>? get alsoKnownAs;

  Map<String, dynamic> toJson();
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PleromaApiMyAccountEdit extends IPleromaApiMyAccountEdit
    implements IJsonObject {
  @override
  final bool? bot;

  @override
  final bool? discoverable;

  @override
  @JsonKey(name: "display_name")
  final String? displayName;

  @override
  @JsonKey(name: "fields_attributes")
  final Map<int, PleromaApiField>? fieldsAttributes;

  @override
  final bool? locked;

  @override
  final String? note;

  @override
  final PleromaApiMyAccountEditSource? source;

  @override
  @JsonKey(name: "actor_type")
  final dynamic actorType;

  @override
  @JsonKey(name: "allow_following_move")
  final bool? allowFollowingMove;

  @override
  @JsonKey(name: "accepts_chat_messages")
  final bool? acceptsChatMessages;

  @override
  @JsonKey(name: "default_scope")
  final String? defaultScope;

  @override
  @JsonKey(name: "hide_favorites")
  final bool? hideFavorites;

  @override
  @JsonKey(name: "hide_followers")
  final bool? hideFollowers;

  @override
  @JsonKey(name: "hide_followers_count")
  final bool? hideFollowersCount;

  @override
  @JsonKey(name: "hide_follows")
  final bool? hideFollows;

  @override
  @JsonKey(name: "hide_follows_count")
  final bool? hideFollowsCount;

  @override
  @JsonKey(name: "no_rich_text")
  final bool? noRichText;

  @override
  @JsonKey(name: "pleroma_background_image")
  final String? pleromaBackgroundImage;

  @override
  @JsonKey(name: "pleroma_settings_store")
  final Map<String, dynamic>? pleromaSettingsStore;

  @override
  @JsonKey(name: "show_role")
  final bool? showRole;

  @override
  @JsonKey(name: "skip_thread_containment")
  final bool? skipThreadContainment;

  @override
  @JsonKey(name: "also_known_as")
  final List<String>? alsoKnownAs;

  PleromaApiMyAccountEdit({
    required this.bot,
    required this.discoverable,
    required this.displayName,
    required this.fieldsAttributes,
    required this.locked,
    required this.note,
    required this.source,
    required this.actorType,
    required this.allowFollowingMove,
    required this.acceptsChatMessages,
    required this.defaultScope,
    required this.hideFavorites,
    required this.hideFollowers,
    required this.hideFollowersCount,
    required this.hideFollows,
    required this.hideFollowsCount,
    required this.noRichText,
    required this.pleromaBackgroundImage,
    required this.pleromaSettingsStore,
    required this.showRole,
    required this.skipThreadContainment,
    required this.alsoKnownAs,
  });

  static PleromaApiMyAccountEdit fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountEditFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMyAccountEditToJson(this);

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountEdit &&
          runtimeType == other.runtimeType &&
          bot == other.bot &&
          discoverable == other.discoverable &&
          displayName == other.displayName &&
          mapEquals(fieldsAttributes, other.fieldsAttributes) &&
          locked == other.locked &&
          note == other.note &&
          source == other.source &&
          actorType == other.actorType &&
          allowFollowingMove == other.allowFollowingMove &&
          acceptsChatMessages == other.acceptsChatMessages &&
          defaultScope == other.defaultScope &&
          hideFavorites == other.hideFavorites &&
          hideFollowers == other.hideFollowers &&
          hideFollowersCount == other.hideFollowersCount &&
          hideFollows == other.hideFollows &&
          hideFollowsCount == other.hideFollowsCount &&
          noRichText == other.noRichText &&
          pleromaBackgroundImage == other.pleromaBackgroundImage &&
          mapEquals(pleromaSettingsStore, other.pleromaSettingsStore) &&
          showRole == other.showRole &&
          listEquals(alsoKnownAs, other.alsoKnownAs) &&
          skipThreadContainment == other.skipThreadContainment;

  @override
  int get hashCode =>
      bot.hashCode ^
      discoverable.hashCode ^
      displayName.hashCode ^
      mapHash(fieldsAttributes) ^
      locked.hashCode ^
      note.hashCode ^
      source.hashCode ^
      actorType.hashCode ^
      allowFollowingMove.hashCode ^
      acceptsChatMessages.hashCode ^
      defaultScope.hashCode ^
      hideFavorites.hashCode ^
      hideFollowers.hashCode ^
      hideFollowersCount.hashCode ^
      hideFollows.hashCode ^
      hideFollowsCount.hashCode ^
      noRichText.hashCode ^
      pleromaBackgroundImage.hashCode ^
      mapHash(pleromaSettingsStore) ^
      showRole.hashCode ^
      listHash(alsoKnownAs) ^
      skipThreadContainment.hashCode;

  @override
  String toString() => 'PleromaApiMyAccountEdit{'
      'bot: $bot, '
      'discoverable: $discoverable, '
      'displayName: $displayName, '
      'fieldsAttributes: $fieldsAttributes, '
      'locked: $locked, '
      'note: $note, '
      'source: $source, '
      'actorType: $actorType, '
      'allowFollowingMove: $allowFollowingMove, '
      'acceptsChatMessages: $acceptsChatMessages, '
      'defaultScope: $defaultScope,'
      'hideFavorites: $hideFavorites, '
      'hideFollowers: $hideFollowers, '
      'hideFollowersCount: $hideFollowersCount, '
      'hideFollows: $hideFollows, '
      'hideFollowsCount: $hideFollowsCount, '
      'noRichText: $noRichText, '
      'pleromaBackgroundImage: $pleromaBackgroundImage, '
      'pleromaSettingsStore: $pleromaSettingsStore, '
      'showRole: $showRole, '
      'alsoKnownAs: $alsoKnownAs, '
      'skipThreadContainment: $skipThreadContainment'
      '}';

  // ignore: long-parameter-list, code-metrics
  PleromaApiMyAccountEdit copyWith({
    bool? bot,
    bool? discoverable,
    String? displayName,
    Map<int, PleromaApiField>? fieldsAttributes,
    bool? locked,
    String? note,
    PleromaApiMyAccountEditSource? source,
    dynamic actorType,
    bool? allowFollowingMove,
    bool? acceptsChatMessages,
    String? defaultScope,
    bool? hideFavorites,
    bool? hideFollowers,
    bool? hideFollowersCount,
    bool? hideFollows,
    bool? hideFollowsCount,
    bool? noRichText,
    String? pleromaBackgroundImage,
    Map<String, dynamic>? pleromaSettingsStore,
    bool? showRole,
    bool? skipThreadContainment,
    List<String>? alsoKnownAs,
  }) =>
      PleromaApiMyAccountEdit(
        bot: bot ?? this.bot,
        discoverable: discoverable ?? this.discoverable,
        displayName: displayName ?? this.displayName,
        fieldsAttributes: fieldsAttributes ?? this.fieldsAttributes,
        locked: locked ?? this.locked,
        note: note ?? this.note,
        source: source ?? this.source,
        actorType: actorType ?? this.actorType,
        allowFollowingMove: allowFollowingMove ?? this.allowFollowingMove,
        acceptsChatMessages: acceptsChatMessages ?? this.acceptsChatMessages,
        defaultScope: defaultScope ?? this.defaultScope,
        hideFavorites: hideFavorites ?? this.hideFavorites,
        hideFollowers: hideFollowers ?? this.hideFollowers,
        hideFollowersCount: hideFollowersCount ?? this.hideFollowersCount,
        hideFollows: hideFollows ?? this.hideFollows,
        hideFollowsCount: hideFollowsCount ?? this.hideFollowsCount,
        noRichText: noRichText ?? this.noRichText,
        pleromaBackgroundImage:
            pleromaBackgroundImage ?? this.pleromaBackgroundImage,
        pleromaSettingsStore: pleromaSettingsStore ?? this.pleromaSettingsStore,
        showRole: showRole ?? this.showRole,
        skipThreadContainment:
            skipThreadContainment ?? this.skipThreadContainment,
        alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
      );
}

abstract class IPleromaApiMyAccount
    implements IMastodonApiMyAccount, IPleromaApiAccount {
  @override
  IPleromaApiMyAccountSource? get source;

  @override
  IPleromaApiMyAccountPleromaPart? get pleroma;

  int? get followRequestsCount;

  @override
  IPleromaApiMyAccount copyWith({
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
    IPleromaApiMyAccountPleromaPart? myAccountPleroma,
    bool? discoverable,
    int? followRequestsCount,
    IPleromaApiMyAccountSource? source,
  });
}

extension IPleromaApiMyAccountExtension on IPleromaApiMyAccount {
  PleromaApiMyAccount toPleromaApiMyAccount({bool forceNewObject = false}) {
    if (this is PleromaApiMyAccount && !forceNewObject) {
      return this as PleromaApiMyAccount;
    } else {
      return PleromaApiMyAccount(
        header: header,
        headerStatic: headerStatic,
        username: username,
        url: url,
        statusesCount: statusesCount,
        note: note,
        locked: locked,
        id: id,
        followingCount: followingCount,
        followersCount: followersCount,
        fields: fields?.toPleromaApiFields(forceNewObject: forceNewObject),
        emojis: emojis?.toPleromaApiEmojis(forceNewObject: forceNewObject),
        displayName: displayName,
        createdAt: createdAt,
        bot: bot,
        avatarStatic: avatarStatic,
        avatar: avatar,
        acct: acct,
        pleroma: pleroma?.toPleromaApiMyAccountPleromaPart(
          forceNewObject: forceNewObject,
        ),
        lastStatusAt: lastStatusAt,
        source:
            source?.toPleromaApiMyAccountSource(forceNewObject: forceNewObject),
        discoverable: discoverable,
        followRequestsCount: followRequestsCount,
        fqn: fqn,
      );
    }
  }
}

abstract class IPleromaApiMyAccountEditSource
    implements IMastodonApiMyAccountEditSource {}

@JsonSerializable(explicitToJson: true)
class PleromaApiMyAccountEditSource
    implements IPleromaApiMyAccountEditSource, IJsonObject {
  @override
  final String? language;

  @override
  final String? privacy;

  @override
  final bool? sensitive;

  PleromaApiMyAccountEditSource({
    required this.language,
    required this.privacy,
    required this.sensitive,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountEditSource &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          privacy == other.privacy &&
          sensitive == other.sensitive;

  @override
  int get hashCode => language.hashCode ^ privacy.hashCode ^ sensitive.hashCode;

  @override
  String toString() {
    return 'PleromaApiMyAccountEditSource{'
        'language: $language, '
        'privacy: $privacy, '
        'sensitive: $sensitive'
        '}';
  }

  static PleromaApiMyAccountEditSource fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountEditSourceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMyAccountEditSourceToJson(this);
}

abstract class IPleromaApiMyAccountSource
    implements IMastodonApiMyAccountSource {
  @override
  List<IPleromaApiField>? get fields;

  PleromaApiMyAccountSourcePleromaPart? get pleroma;
}

extension IPleromaApiMyAccountSourceExtension on IPleromaApiMyAccountSource {
  PleromaApiMyAccountSource toPleromaApiMyAccountSource({
    bool forceNewObject = false,
  }) {
    if (this is PleromaApiMyAccountSource && !forceNewObject) {
      return this as PleromaApiMyAccountSource;
    } else {
      return PleromaApiMyAccountSource(
        privacy: privacy,
        sensitive: sensitive,
        language: language,
        note: note,
        fields: fields?.toPleromaApiFields(forceNewObject: forceNewObject),
        followRequestsCount: followRequestsCount,
        pleroma: pleroma,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 43)
@JsonSerializable(explicitToJson: true)
class PleromaApiMyAccountSource
    implements IPleromaApiMyAccountSource, IJsonObject {
  @override
  @HiveField(1)
  final String? privacy;
  @override
  @HiveField(2)
  final bool? sensitive;
  @override
  @HiveField(3)
  final String? language;
  @override
  @HiveField(4)
  final String? note;
  @override
  @HiveField(5)
  final List<PleromaApiField>? fields;
  @override
  @HiveField(6)
  @JsonKey(name: "follow_requests_count")
  final int? followRequestsCount;
  @override
  @HiveField(7)
  final PleromaApiMyAccountSourcePleromaPart? pleroma;

  PleromaApiMyAccountSource({
    required this.privacy,
    required this.sensitive,
    required this.language,
    required this.note,
    required this.fields,
    required this.followRequestsCount,
    required this.pleroma,
  });

  static PleromaApiMyAccountSource fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountSourceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMyAccountSourceToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountSource &&
          runtimeType == other.runtimeType &&
          privacy == other.privacy &&
          sensitive == other.sensitive &&
          language == other.language &&
          note == other.note &&
          listEquals(fields, other.fields) &&
          followRequestsCount == other.followRequestsCount &&
          pleroma == other.pleroma;

  @override
  int get hashCode =>
      privacy.hashCode ^
      sensitive.hashCode ^
      language.hashCode ^
      note.hashCode ^
      listHash(fields) ^
      followRequestsCount.hashCode ^
      pleroma.hashCode;

  @override
  String toString() {
    return 'PleromaApiMyAccountSource{'
        'privacy: $privacy, '
        'sensitive: $sensitive, '
        'language: $language, '
        'note: $note, '
        'fields: $fields, '
        'followRequestsCount: $followRequestsCount, '
        'pleroma: $pleroma'
        '}';
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 44)
@JsonSerializable()
class PleromaApiMyAccountSourcePleromaPart implements IJsonObject {
  //  show_role: boolean, nullable, true when the user wants his role (e.g admin, moderator) to be shown
  @HiveField(1)
  @JsonKey(name: "show_role")
  final bool? showRole;

  //  no_rich_text - boolean, nullable, true when html tags are stripped from all statuses requested from the API
  @HiveField(2)
  @JsonKey(name: "no_rich_text")
  final bool? noRichText;

  //  discoverable: boolean, true when the user allows discovery of the account in search results and other services.
  @HiveField(3)
  final bool? discoverable;

  // actor_type: string, the type of this account.
  @HiveField(4)
  @JsonKey(name: "actor_type")
  final String? actorType;

  PleromaApiMyAccountSourcePleromaPart({
    required this.showRole,
    required this.noRichText,
    required this.discoverable,
    required this.actorType,
  });

  static PleromaApiMyAccountSourcePleromaPart fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountSourcePleromaPartFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiMyAccountSourcePleromaPartToJson(this);

  @override
  String toString() {
    return 'PleromaApiMyAccountSourcePleromaPart{'
        'showRole: $showRole, '
        'noRichText: $noRichText, '
        'discoverable: $discoverable, '
        'actorType: $actorType'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountSourcePleromaPart &&
          runtimeType == other.runtimeType &&
          showRole == other.showRole &&
          noRichText == other.noRichText &&
          discoverable == other.discoverable &&
          actorType == other.actorType;

  @override
  int get hashCode =>
      showRole.hashCode ^
      noRichText.hashCode ^
      discoverable.hashCode ^
      actorType.hashCode;
}

class PleromaApiMyAccountFilesRequest {
  final File? avatar;
  final File? header;
  final File? pleromaBackgroundImage;

  PleromaApiMyAccountFilesRequest({
    required this.avatar,
    required this.header,
    required this.pleromaBackgroundImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountFilesRequest &&
          runtimeType == other.runtimeType &&
          avatar == other.avatar &&
          header == other.header &&
          pleromaBackgroundImage == other.pleromaBackgroundImage;

  @override
  int get hashCode =>
      avatar.hashCode ^ header.hashCode ^ pleromaBackgroundImage.hashCode;

  @override
  String toString() {
    return 'PleromaApiMyAccountFilesRequest{'
        'avatar: $avatar, '
        'header: $header, '
        'pleromaBackgroundImage: $pleromaBackgroundImage'
        '}';
  }
}

abstract class IPleromaApiMyAccountPleromaPart
    implements IPleromaApiAccountPleromaPart {
  Map<String, dynamic>? get settingsStore;

  int? get unreadConversationCount;

  int? get unreadNotificationsCount;

  String? get chatToken;

  PleromaApiMyAccountPleromaPartNotificationsSettings? get notificationSettings;

  @override
  IPleromaApiMyAccountPleromaPart copyWith({
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
    Map<String, dynamic>? settingsStore,
    String? chatToken,
    bool? deactivated,
    bool? allowFollowingMove,
    PleromaApiMyAccountPleromaPartNotificationsSettings? notificationSettings,
    bool? skipThreadContainment,
    bool? acceptsChatMessages,
    bool? isConfirmed,
    String? favicon,
    String? apId,
    List<String>? alsoKnownAs,
    int? unreadConversationCount,
    int? unreadNotificationsCount,
  });
}

extension IPleromaApiMyAccountPleromaPartExtension
    on IPleromaApiMyAccountPleromaPart {
  PleromaApiMyAccountPleromaPart toPleromaApiMyAccountPleromaPart({
    bool forceNewObject = false,
  }) {
    if (this is PleromaApiMyAccountPleromaPart && !forceNewObject) {
      return this as PleromaApiMyAccountPleromaPart;
    } else {
      return PleromaApiMyAccountPleromaPart(
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
        settingsStore: settingsStore,
        chatToken: chatToken,
        deactivated: deactivated,
        allowFollowingMove: allowFollowingMove,
        unreadConversationCount: unreadConversationCount,
        skipThreadContainment: skipThreadContainment,
        notificationSettings: notificationSettings,
        acceptsChatMessages: acceptsChatMessages,
        isConfirmed: isConfirmed,
        favicon: favicon,
        apId: apId,
        alsoKnownAs: alsoKnownAs,
        unreadNotificationsCount: unreadNotificationsCount,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 54)
@JsonSerializable(explicitToJson: true)
class PleromaApiMyAccount implements IPleromaApiMyAccount, IJsonObject {
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
  final PleromaApiMyAccountPleromaPart? pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  final DateTime? lastStatusAt;
  @override
  @HiveField(21)
  final PleromaApiMyAccountSource? source;
  @override
  @HiveField(22)
  final bool? discoverable;

  @override
  @HiveField(23)
  @JsonKey(name: "follow_requests_count")
  final int? followRequestsCount;

  @override
  @HiveField(24)
  final String? fqn;

  PleromaApiMyAccount({
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
    required this.source,
    required this.discoverable,
    required this.followRequestsCount,
    required this.fqn,
  });

  static PleromaApiMyAccount fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMyAccountToJson(this);

  @override
  // ignore: long-parameter-list, code-metrics
  PleromaApiMyAccount copyWith({
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
    IPleromaApiMyAccountPleromaPart? myAccountPleroma,
    bool? discoverable,
    int? followRequestsCount,
    IPleromaApiMyAccountSource? source,
  }) {
    if (pleroma != null) {
      assert(true, "use myAccountPleroma");
    }
    return PleromaApiMyAccount(
      id: id ?? this.id,
      username: username ?? this.username,
      url: url ?? this.url,
      note: note ?? this.note,
      locked: locked ?? this.locked,
      headerStatic: headerStatic ?? this.headerStatic,
      header: header ?? this.header,
      followingCount: followingCount ?? this.followingCount,
      followersCount: followersCount ?? this.followersCount,
      statusesCount: statusesCount ?? this.statusesCount,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt ?? this.createdAt,
      bot: bot ?? this.bot,
      avatarStatic: avatarStatic ?? this.avatarStatic,
      avatar: avatar ?? this.avatar,
      acct: acct ?? this.acct,
      lastStatusAt: lastStatusAt ?? this.lastStatusAt,
      fields: fields?.toPleromaApiFields() ?? this.fields,
      emojis: emojis?.toPleromaApiEmojis() ?? this.emojis,
      pleroma:
          myAccountPleroma?.toPleromaApiMyAccountPleromaPart() ?? this.pleroma,
      discoverable: discoverable ?? this.discoverable,
      followRequestsCount: followRequestsCount ?? this.followRequestsCount,
      fqn: fqn ?? this.fqn,
      source: source?.toPleromaApiMyAccountSource() ?? this.source,
    );
  }

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccount &&
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
          listEquals(fields, other.fields) &&
          listEquals(emojis, other.emojis) &&
          displayName == other.displayName &&
          createdAt == other.createdAt &&
          bot == other.bot &&
          avatarStatic == other.avatarStatic &&
          avatar == other.avatar &&
          acct == other.acct &&
          pleroma == other.pleroma &&
          lastStatusAt == other.lastStatusAt &&
          source == other.source &&
          fqn == other.fqn &&
          followRequestsCount == other.followRequestsCount &&
          discoverable == other.discoverable;

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
      listHash(fields) ^
      listHash(emojis) ^
      displayName.hashCode ^
      createdAt.hashCode ^
      bot.hashCode ^
      avatarStatic.hashCode ^
      avatar.hashCode ^
      acct.hashCode ^
      pleroma.hashCode ^
      lastStatusAt.hashCode ^
      source.hashCode ^
      fqn.hashCode ^
      followRequestsCount.hashCode ^
      discoverable.hashCode;

  @override
  String toString() => 'PleromaApiMyAccount{'
      'username: $username, '
      'url: $url, '
      'statusesCount: $statusesCount, '
      'note: $note, '
      'locked: $locked, '
      'id: $id, '
      'headerStatic: $headerStatic, '
      'header: $header, '
      'followingCount: $followingCount,'
      'followersCount: $followersCount, '
      'fields: $fields, '
      'emojis: $emojis, '
      'displayName: $displayName, '
      'createdAt: $createdAt, '
      'bot: $bot, '
      'avatarStatic: $avatarStatic, '
      'avatar: $avatar, '
      'acct: $acct, '
      'pleroma: $pleroma, '
      'lastStatusAt: $lastStatusAt, '
      'source: $source, '
      'fqn: $fqn, '
      'followRequestsCount: $followRequestsCount, '
      'discoverable: $discoverable'
      '}';
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 41)
@JsonSerializable()
class PleromaApiMyAccountPleromaPartNotificationsSettings
    implements IJsonObject {
  @HiveField(0)
  final bool? followers;
  @HiveField(1)
  final bool? follows;
  @JsonKey(name: "non_followers")
  @HiveField(2)
  final bool? nonFollowers;
  @JsonKey(name: "non_follows")
  @HiveField(3)
  final bool? nonFollows;
  @JsonKey(name: "block_from_strangers")
  @HiveField(4)
  final bool? blockFromStrangers;
  @JsonKey(name: "hide_notification_contents")
  @HiveField(5)
  final bool? hideNotificationContents;

  PleromaApiMyAccountPleromaPartNotificationsSettings({
    required this.followers,
    required this.follows,
    required this.nonFollowers,
    required this.nonFollows,
    required this.blockFromStrangers,
    required this.hideNotificationContents,
  });

  static PleromaApiMyAccountPleromaPartNotificationsSettings fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMyAccountPleromaPartNotificationsSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiMyAccountPleromaPartNotificationsSettingsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountPleromaPartNotificationsSettings &&
          runtimeType == other.runtimeType &&
          followers == other.followers &&
          follows == other.follows &&
          nonFollowers == other.nonFollowers &&
          nonFollows == other.nonFollows &&
          blockFromStrangers == other.blockFromStrangers &&
          hideNotificationContents == other.hideNotificationContents;

  @override
  int get hashCode =>
      followers.hashCode ^
      follows.hashCode ^
      nonFollowers.hashCode ^
      nonFollows.hashCode ^
      blockFromStrangers.hashCode ^
      hideNotificationContents.hashCode;

  @override
  String toString() {
    return 'PleromaApiMyAccountPleromaPartNotificationsSettings{'
        'followers: $followers, '
        'follows: $follows, '
        'nonFollowers: $nonFollowers, '
        'nonFollows: $nonFollows, '
        'blockFromStrangers: $blockFromStrangers, '
        'hideNotificationContents: $hideNotificationContents'
        '}';
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 40)
@JsonSerializable(explicitToJson: true)
class PleromaApiMyAccountPleromaPart
    implements IPleromaApiMyAccountPleromaPart {
  @override
  @HiveField(1)
  @JsonKey(name: "background_image")
  final String? backgroundImage;

  @override
  @HiveField(2)
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

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @override
  @HiveField(14)
  @JsonKey(name: "settings_store")
  final Map<String, dynamic>? settingsStore;

  /// The token needed for Pleroma chat. Only returned in verify_credentials
  @override
  @HiveField(15)
  @JsonKey(name: "chat_token")
  final String? chatToken;
  @override
  @HiveField(16)
  final bool? deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @override
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  final bool? allowFollowingMove;

  /// The count of unread conversations. Only returned to the account owner.
  @override
  @HiveField(18)
  @JsonKey(name: "unread_conversation_count")
  final int? unreadConversationCount;

  @override
  @HiveField(19)
  @JsonKey(name: "notifications_settings")
  final PleromaApiMyAccountPleromaPartNotificationsSettings?
      notificationSettings;

  @override
  @HiveField(20)
  @JsonKey(name: "skip_thread_containment")
  final bool? skipThreadContainment;

  @override
  @HiveField(21)
  @JsonKey(name: "accepts_chat_messages")
  final bool? acceptsChatMessages;

  @override
  @HiveField(22)
  @JsonKey(name: "is_confirmed")
  final bool? isConfirmed;

  @override
  @HiveField(23)
  final String? favicon;

  @override
  @HiveField(24)
  final String? apId;
  @override
  @HiveField(25)
  @JsonKey(name: "also_known_as")
  final List<String>? alsoKnownAs;

  @override
  @HiveField(26)
  @JsonKey(name: "unread_notifications_count")
  final int? unreadNotificationsCount;

  PleromaApiMyAccountPleromaPart({
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
    required this.settingsStore,
    required this.chatToken,
    required this.deactivated,
    required this.allowFollowingMove,
    required this.unreadConversationCount,
    required this.skipThreadContainment,
    required this.notificationSettings,
    required this.acceptsChatMessages,
    required this.isConfirmed,
    required this.favicon,
    required this.apId,
    required this.alsoKnownAs,
    required this.unreadNotificationsCount,
  });

  static PleromaApiMyAccountPleromaPart fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMyAccountPleromaPartFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiMyAccountPleromaPartToJson(this);

  @override
  // ignore: long-parameter-list, code-metrics
  PleromaApiMyAccountPleromaPart copyWith({
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
    Map<String, dynamic>? settingsStore,
    String? chatToken,
    bool? deactivated,
    bool? allowFollowingMove,
    int? unreadConversationCount,
    PleromaApiMyAccountPleromaPartNotificationsSettings? notificationSettings,
    bool? skipThreadContainment,
    bool? acceptsChatMessages,
    bool? isConfirmed,
    String? favicon,
    String? apId,
    List<String>? alsoKnownAs,
    int? unreadNotificationsCount,
  }) =>
      PleromaApiMyAccountPleromaPart(
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
        settingsStore: settingsStore ?? this.settingsStore,
        chatToken: chatToken ?? this.chatToken,
        deactivated: deactivated ?? this.deactivated,
        allowFollowingMove: allowFollowingMove ?? this.allowFollowingMove,
        unreadConversationCount:
            unreadConversationCount ?? this.unreadConversationCount,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        skipThreadContainment:
            skipThreadContainment ?? this.skipThreadContainment,
        acceptsChatMessages: acceptsChatMessages ?? this.acceptsChatMessages,
        isConfirmed: isConfirmed ?? this.isConfirmed,
        favicon: favicon ?? this.favicon,
        apId: apId ?? this.apId,
        alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
        unreadNotificationsCount:
            unreadNotificationsCount ?? this.unreadNotificationsCount,
      );

  @override
  String toString() {
    return 'PleromaApiMyAccountPleromaPart{'
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
        'settingsStore: $settingsStore, '
        'chatToken: $chatToken, '
        'deactivated: $deactivated, '
        'allowFollowingMove: $allowFollowingMove, '
        'unreadConversationCount: $unreadConversationCount, '
        'notificationSettings: $notificationSettings, '
        'skipThreadContainment: $skipThreadContainment, '
        'acceptsChatMessages: $acceptsChatMessages, '
        'isConfirmed: $isConfirmed, '
        'favicon: $favicon, '
        'apId: $apId, '
        'alsoKnownAs: $alsoKnownAs, '
        'unreadNotificationsCount: $unreadNotificationsCount'
        '}';
  }

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountPleromaPart &&
          runtimeType == other.runtimeType &&
          backgroundImage == other.backgroundImage &&
          listEquals(tags, other.tags) &&
          relationship == other.relationship &&
          isAdmin == other.isAdmin &&
          isModerator == other.isModerator &&
          confirmationPending == other.confirmationPending &&
          hideFavorites == other.hideFavorites &&
          hideFollowers == other.hideFollowers &&
          hideFollows == other.hideFollows &&
          hideFollowersCount == other.hideFollowersCount &&
          hideFollowsCount == other.hideFollowsCount &&
          mapEquals(settingsStore, other.settingsStore) &&
          chatToken == other.chatToken &&
          deactivated == other.deactivated &&
          allowFollowingMove == other.allowFollowingMove &&
          unreadConversationCount == other.unreadConversationCount &&
          notificationSettings == other.notificationSettings &&
          skipThreadContainment == other.skipThreadContainment &&
          acceptsChatMessages == other.acceptsChatMessages &&
          isConfirmed == other.isConfirmed &&
          favicon == other.favicon &&
          apId == other.apId &&
          listEquals(alsoKnownAs, other.alsoKnownAs) &&
          unreadNotificationsCount == other.unreadNotificationsCount;

  @override
  int get hashCode =>
      backgroundImage.hashCode ^
      listHash(tags) ^
      relationship.hashCode ^
      isAdmin.hashCode ^
      isModerator.hashCode ^
      confirmationPending.hashCode ^
      hideFavorites.hashCode ^
      hideFollowers.hashCode ^
      hideFollows.hashCode ^
      hideFollowersCount.hashCode ^
      hideFollowsCount.hashCode ^
      mapHash(settingsStore) ^
      chatToken.hashCode ^
      deactivated.hashCode ^
      allowFollowingMove.hashCode ^
      unreadConversationCount.hashCode ^
      notificationSettings.hashCode ^
      skipThreadContainment.hashCode ^
      acceptsChatMessages.hashCode ^
      isConfirmed.hashCode ^
      favicon.hashCode ^
      apId.hashCode ^
      listHash(alsoKnownAs) ^
      unreadNotificationsCount.hashCode;
}
