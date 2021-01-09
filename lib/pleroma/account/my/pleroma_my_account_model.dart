import 'dart:convert';
import 'dart:io';

import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/account/my/mastodon_my_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_my_account_model.g.dart';

extension IPleromaMyAccountEditExtension on IPleromaMyAccountEdit {
  PleromaVisibility get defaultScopePleroma =>
      defaultScope.toPleromaVisibility();
}

abstract class IPleromaMyAccountEdit extends IMastodonMyAccountEdit {
  @override
  IPleromaMyAccountEditSource get source;

  @override
  Map<int, IPleromaField> get fieldsAttributes;

  /// if true, html tags are stripped from all statuses requested from the API
  bool get noRichText;

  /// if true, user's followers will be hidden
  bool get hideFollowers;

  ///  if true, user's follows will be hidden
  bool get hideFollows;

  /// if true, user's follower count will be hidden
  bool get hideFollowersCount;

  /// if true, user's follow count will be hidden
  bool get hideFollowsCount;

  /// if true, user's favorites timeline will be hidden
  bool get hideFavorites;

  /// if true, user's role (e.g admin, moderator) will be exposed to anyone in the API
  bool get showRole;

  /// the scope returned under privacy key in Source subentity
  String get defaultScope;

  /// Opaque user settings to be saved on the backend
  Map<String, dynamic> get pleromaSettingsStore;

  /// if true, skip filtering out broken threads
  bool get skipThreadContainment;

  /// if true, allows automatically follow moved following accounts
  bool get allowFollowingMove;

  bool get acceptsChatMessages;

  /// sets the background image of the user
  String get pleromaBackgroundImage;

  /// the type of this account.
  dynamic get actorType;

  Map<String, dynamic> toJson();
}

@JsonSerializable(explicitToJson: true)
class PleromaMyAccountEdit extends IPleromaMyAccountEdit {
  @override
  final bool bot;

  @override
  final bool discoverable;

  @override
  @JsonKey(name: "display_name")
  final String displayName;

  @override
  @JsonKey(name: "fields_attributes")
  final Map<int, PleromaField> fieldsAttributes;

  @override
  final bool locked;

  @override
  final String note;

  @override
  final PleromaMyAccountEditSource source;

  @override
  @JsonKey(name: "actor_type")
  final dynamic actorType;

  @override
  @JsonKey(name: "allow_following_move")
  final bool allowFollowingMove;

  @override
  @JsonKey(name: "accepts_chat_messages")
  final bool acceptsChatMessages;

  @override
  @JsonKey(name: "default_scope")
  final String defaultScope;

  @override
  @JsonKey(name: "hide_favorites")
  final bool hideFavorites;

  @override
  @JsonKey(name: "hide_followers")
  final bool hideFollowers;

  @override
  @JsonKey(name: "hide_followers_count")
  final bool hideFollowersCount;

  @override
  @JsonKey(name: "hide_follows")
  final bool hideFollows;

  @override
  @JsonKey(name: "hide_follows_count")
  final bool hideFollowsCount;

  @override
  @JsonKey(name: "no_rich_text")
  final bool noRichText;

  @override
  @JsonKey(name: "pleroma_background_image")
  final String pleromaBackgroundImage;

  @override
  @JsonKey(name: "pleroma_settings_store")
  final Map<String, dynamic> pleromaSettingsStore;

  @override
  @JsonKey(name: "show_role")
  final bool showRole;

  @override
  @JsonKey(name: "skip_thread_containment")
  final bool skipThreadContainment;

  PleromaMyAccountEdit({
    this.bot,
    this.discoverable,
    this.displayName,
    this.fieldsAttributes,
    this.locked,
    this.note,
    this.source,
    this.actorType,
    this.allowFollowingMove,
    this.acceptsChatMessages,
    this.defaultScope,
    this.hideFavorites,
    this.hideFollowers,
    this.hideFollowersCount,
    this.hideFollows,
    this.hideFollowsCount,
    this.noRichText,
    this.pleromaBackgroundImage,
    this.pleromaSettingsStore,
    this.showRole,
    this.skipThreadContainment,
  });

  factory PleromaMyAccountEdit.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountEditFromJson(json);

  factory PleromaMyAccountEdit.fromJsonString(String jsonString) =>
      _$PleromaMyAccountEditFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountEditToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountEditToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountEdit &&
          runtimeType == other.runtimeType &&
          bot == other.bot &&
          discoverable == other.discoverable &&
          displayName == other.displayName &&
          fieldsAttributes == other.fieldsAttributes &&
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
          pleromaSettingsStore == other.pleromaSettingsStore &&
          showRole == other.showRole &&
          skipThreadContainment == other.skipThreadContainment;

  @override
  int get hashCode =>
      bot.hashCode ^
      discoverable.hashCode ^
      displayName.hashCode ^
      fieldsAttributes.hashCode ^
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
      pleromaSettingsStore.hashCode ^
      showRole.hashCode ^
      skipThreadContainment.hashCode;

  @override
  String toString() => 'PleromaMyAccountEdit{'
      'bot: $bot, discoverable: $discoverable, displayName: $displayName,'
      ' fieldsAttributes: $fieldsAttributes, locked: $locked, note: $note,'
      ' source: $source, actorType: $actorType,'
      ' allowFollowingMove: $allowFollowingMove,'
      ' acceptsChatMessages: $acceptsChatMessages, defaultScope: $defaultScope,'
      ' hideFavorites: $hideFavorites, hideFollowers: $hideFollowers,'
      ' hideFollowersCount: $hideFollowersCount, hideFollows: $hideFollows,'
      ' hideFollowsCount: $hideFollowsCount, noRichText: $noRichText,'
      ' pleromaBackgroundImage: $pleromaBackgroundImage,'
      ' pleromaSettingsStore: $pleromaSettingsStore, showRole: $showRole,'
      ' skipThreadContainment: $skipThreadContainment'
      '}';
}

abstract class IPleromaMyAccount
    implements IMastodonMyAccount, IPleromaAccount {
  @override
  IPleromaMyAccountSource get source;

  @override
  IPleromaMyAccountPleromaPart get pleroma;
}

abstract class IPleromaMyAccountEditSource
    implements IMastodonMyAccountEditSource {}

@JsonSerializable(explicitToJson: true)
class PleromaMyAccountEditSource
    implements IPleromaMyAccountEditSource, IJsonObject {
  @override
  final String language;

  @override
  final String privacy;

  @override
  final bool sensitive;

  PleromaMyAccountEditSource({
    this.language,
    this.privacy,
    this.sensitive,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountEditSource &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          privacy == other.privacy &&
          sensitive == other.sensitive;

  @override
  int get hashCode => language.hashCode ^ privacy.hashCode ^ sensitive.hashCode;

  @override
  String toString() {
    return 'PleromaMyAccountEditSource{'
        'language: $language, privacy: $privacy, sensitive: $sensitive}';
  }

  factory PleromaMyAccountEditSource.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountEditSourceFromJson(json);

  factory PleromaMyAccountEditSource.fromJsonString(String jsonString) =>
      _$PleromaMyAccountEditSourceFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountEditSourceToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountEditSourceToJson(this));
}

abstract class IPleromaMyAccountSource implements IMastodonMyAccountSource {
  @override
  List<IPleromaField> get fields;

  PleromaMyAccountSourcePleromaPart get pleroma;
}

extension IPleromaMyAccountSourceExtension on IPleromaMyAccountSource {
  PleromaVisibility get privacyPleroma => privacy.toPleromaVisibility();
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 43)
@JsonSerializable()
class PleromaMyAccountSource implements IPleromaMyAccountSource {
  @override
  @HiveField(1)
  final String privacy;
  @override
  @HiveField(2)
  final bool sensitive;
  @override
  @HiveField(3)
  final String language;
  @override
  @HiveField(4)
  final String note;
  @override
  @HiveField(5)
  final List<PleromaField> fields;
  @override
  @HiveField(6)
  @JsonKey(name: "follow_requests_count")
  final int followRequestsCount;
  @override
  @HiveField(7)
  final PleromaMyAccountSourcePleromaPart pleroma;

  PleromaMyAccountSource(
      {this.privacy,
      this.sensitive,
      this.language,
      this.note,
      this.fields,
      this.followRequestsCount,
      this.pleroma});

  factory PleromaMyAccountSource.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountSourceFromJson(json);

  factory PleromaMyAccountSource.fromJsonString(String jsonString) =>
      _$PleromaMyAccountSourceFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaMyAccountSourceToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountSourceToJson(this));
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 44)
@JsonSerializable()
class PleromaMyAccountSourcePleromaPart {
  //  show_role: boolean, nullable, true when the user wants his role (e.g admin, moderator) to be shown
  @HiveField(1)
  @JsonKey(name: "show_role")
  final bool showRole;

  //  no_rich_text - boolean, nullable, true when html tags are stripped from all statuses requested from the API
  @HiveField(2)
  @JsonKey(name: "no_rich_text")
  final bool noRichText;

  //  discoverable: boolean, true when the user allows discovery of the account in search results and other services.
  @HiveField(3)
  final bool discoverable;

  // actor_type: string, the type of this account.
  @HiveField(4)
  @JsonKey(name: "actor_type")
  final String actorType;

  PleromaMyAccountSourcePleromaPart({
    this.showRole,
    this.noRichText,
    this.discoverable,
    this.actorType,
  });

  factory PleromaMyAccountSourcePleromaPart.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaMyAccountSourcePleromaPartFromJson(json);

  factory PleromaMyAccountSourcePleromaPart.fromJsonString(String jsonString) =>
      _$PleromaMyAccountSourcePleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaMyAccountSourcePleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaMyAccountSourcePleromaPartToJson(this));
}

class PleromaMyAccountFilesRequest {
  final File avatar;
  final File header;
  final File pleromaBackgroundImage;

  PleromaMyAccountFilesRequest({
    @required this.avatar,
    @required this.header,
    @required this.pleromaBackgroundImage,
  });

  @override
  String toString() {
    return 'PleromaMyAccountFilesRequest{avatar: $avatar, header: $header,'
        ' pleromaBackgroundImage: $pleromaBackgroundImage}';
  }
}

abstract class IPleromaMyAccountPleromaPart
    implements IPleromaAccountPleromaPart {
  dynamic get settingsStore;

  int get unreadConversationCount;

  String get chatToken;

  PleromaMyAccountPleromaPartNotificationsSettings get notificationSettings;
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 54)
@JsonSerializable(explicitToJson: true)
class PleromaMyAccount implements IPleromaMyAccount, IJsonObject {
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
  final PleromaMyAccountPleromaPart pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  final DateTime lastStatusAt;
  @override
  @HiveField(21)
  final PleromaMyAccountSource source;
  @override
  @HiveField(22)
  final bool discoverable;

  PleromaMyAccount({
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
    this.source,
    this.discoverable,
  });

  factory PleromaMyAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountFromJson(json);

  factory PleromaMyAccount.fromJsonString(String jsonString) =>
      _$PleromaMyAccountFromJson(jsonDecode(jsonString));

  static List<PleromaMyAccount> listFromJsonString(String str) =>
      List<PleromaMyAccount>.from(
          json.decode(str).map((x) => PleromaMyAccount.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountToJson(this));

  PleromaMyAccount copyWith({
    String id,
    String username,
    String url,
    String note,
    bool locked,
    String headerStatic,
    String header,
    int followingCount,
    int followersCount,
    int statusesCount,
    String displayName,
    DateTime createdAt,
    bool bot,
    String avatarStatic,
    String avatar,
    String acct,
    DateTime lastStatusAt,
    List<PleromaField> fields,
    List<PleromaEmoji> emojis,
    List<PleromaTag> pleromaTags,
    PleromaAccountRelationship pleromaRelationship,
    bool pleromaIsAdmin,
    bool pleromaIsModerator,
    bool pleromaConfirmationPending,
    bool pleromaHideFavorites,
    bool pleromaHideFollowers,
    bool pleromaHideFollows,
    bool pleromaHideFollowersCount,
    bool pleromaHideFollowsCount,
    bool pleromaDeactivated,
    bool pleromaAllowFollowingMove,
    bool pleromaSkipThreadContainment,
    PleromaMyAccountPleromaPart pleroma,
    bool discoverable,
  }) {
    return PleromaMyAccount(
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
      fields: fields ?? this.fields,
      emojis: emojis ?? this.emojis,
      pleroma: pleroma ?? this.pleroma,
      discoverable: discoverable ?? this.discoverable,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccount &&
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
          lastStatusAt == other.lastStatusAt &&
          source == other.source &&
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
      fields.hashCode ^
      emojis.hashCode ^
      displayName.hashCode ^
      createdAt.hashCode ^
      bot.hashCode ^
      avatarStatic.hashCode ^
      avatar.hashCode ^
      acct.hashCode ^
      pleroma.hashCode ^
      lastStatusAt.hashCode ^
      source.hashCode ^
      discoverable.hashCode;

  @override
  String toString() => 'PleromaMyAccount{'
      'username: $username, url: $url, statusesCount: $statusesCount,'
      ' note: $note, locked: $locked, id: $id, headerStatic: $headerStatic,'
      ' header: $header, followingCount: $followingCount,'
      ' followersCount: $followersCount, fields: $fields, emojis: $emojis,'
      ' displayName: $displayName, createdAt: $createdAt, bot: $bot,'
      ' avatarStatic: $avatarStatic, avatar: $avatar, acct: $acct,'
      ' pleroma: $pleroma, lastStatusAt: $lastStatusAt, source: $source,'
      ' discoverable: $discoverable'
      '}';
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 41)
@JsonSerializable()
class PleromaMyAccountPleromaPartNotificationsSettings {
  @HiveField(0)
  final bool followers;
  @HiveField(1)
  final bool follows;
  @JsonKey(name: "non_followers")
  @HiveField(2)
  final bool nonFollowers;
  @JsonKey(name: "non_follows")
  @HiveField(3)
  final bool nonFollows;

  PleromaMyAccountPleromaPartNotificationsSettings(
      {this.followers, this.follows, this.nonFollowers, this.nonFollows});

  factory PleromaMyAccountPleromaPartNotificationsSettings.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaMyAccountPleromaPartNotificationsSettingsFromJson(json);

  factory PleromaMyAccountPleromaPartNotificationsSettings.fromJsonString(
          String jsonString) =>
      _$PleromaMyAccountPleromaPartNotificationsSettingsFromJson(
          jsonDecode(jsonString));

  static List<PleromaMyAccountPleromaPartNotificationsSettings>
      listFromJsonString(String str) =>
          List<PleromaMyAccountPleromaPartNotificationsSettings>.from(json
              .decode(str)
              .map((x) =>
                  PleromaMyAccountPleromaPartNotificationsSettings.fromJson(
                      x)));

  Map<String, dynamic> toJson() =>
      _$PleromaMyAccountPleromaPartNotificationsSettingsToJson(this);

  String toJsonString() => jsonEncode(
      _$PleromaMyAccountPleromaPartNotificationsSettingsToJson(this));
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 40)
@JsonSerializable(explicitToJson: true)
class PleromaMyAccountPleromaPart implements IPleromaMyAccountPleromaPart {
  @override
  @HiveField(1)
  @JsonKey(name: "background_image")
  final dynamic backgroundImage;

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

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @override
  @HiveField(14)
  @JsonKey(name: "settings_store")
  final dynamic settingsStore;

  /// The token needed for Pleroma chat. Only returned in verify_credentials
  @override
  @HiveField(15)
  @JsonKey(name: "chat_token")
  final String chatToken;
  @override
  @HiveField(16)
  final bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @override
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  final bool allowFollowingMove;

  /// The count of unread conversations. Only returned to the account owner.
  @override
  @HiveField(18)
  @JsonKey(name: "unread_conversation_count")
  final int unreadConversationCount;

  @override
  @HiveField(19)
  @JsonKey(name: "notifications_settings")
  final PleromaMyAccountPleromaPartNotificationsSettings notificationSettings;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @HiveField(20)
  @JsonKey(name: "skip_thread_containment")
  final bool skipThreadContainment;

  @override
  @HiveField(21)
  @JsonKey(name: "accepts_chat_messages")
  final bool acceptsChatMessages;

  PleromaMyAccountPleromaPart({
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
    this.settingsStore,
    this.chatToken,
    this.deactivated,
    this.allowFollowingMove,
    this.unreadConversationCount,
    this.skipThreadContainment,
    this.notificationSettings,
    this.acceptsChatMessages,
  });

  factory PleromaMyAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountPleromaPartFromJson(json);

  factory PleromaMyAccountPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaMyAccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaMyAccountPleromaPartToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaMyAccountPleromaPartToJson(this));

  @override
  String toString() {
    return 'PleromaMyAccountPleromaPart{backgroundImage: $backgroundImage,'
        ' tags: $tags, relationship: $relationship, isAdmin: $isAdmin,'
        ' isModerator: $isModerator, confirmationPending: $confirmationPending,'
        ' hideFavorites: $hideFavorites, hideFollowers: $hideFollowers,'
        ' hideFollows: $hideFollows, hideFollowersCount: $hideFollowersCount,'
        ' hideFollowsCount: $hideFollowsCount, settingsStore: $settingsStore,'
        ' chatToken: $chatToken, deactivated: $deactivated,'
        ' allowFollowingMove: $allowFollowingMove,'
        ' unreadConversationCount: $unreadConversationCount,'
        ' skipThreadContainment: $skipThreadContainment,'
        ' acceptsChatMessages: $acceptsChatMessages,'
        ' notificationSettings: $notificationSettings'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountPleromaPart &&
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
          settingsStore == other.settingsStore &&
          chatToken == other.chatToken &&
          deactivated == other.deactivated &&
          allowFollowingMove == other.allowFollowingMove &&
          unreadConversationCount == other.unreadConversationCount &&
          notificationSettings == other.notificationSettings &&
          skipThreadContainment == other.skipThreadContainment &&
          acceptsChatMessages == other.acceptsChatMessages;

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
      settingsStore.hashCode ^
      chatToken.hashCode ^
      deactivated.hashCode ^
      allowFollowingMove.hashCode ^
      unreadConversationCount.hashCode ^
      notificationSettings.hashCode ^
      skipThreadContainment.hashCode ^
      acceptsChatMessages.hashCode;
}
