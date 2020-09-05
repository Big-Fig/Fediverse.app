import 'dart:convert';
import 'dart:io';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/mastodon/account/my/mastodon_my_account_model.dart';
import 'package:fedi/mastodon/visibility/mastodon_visibility_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_my_account_model.g.dart';

abstract class IPleromaMyAccountEdit extends IMastodonMyAccountEdit {
  @override
  IPleromaMyAccountSource get source;

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

  PleromaVisibility get defaultScopePleroma =>
      defaultScope.toPleromaVisibility();

  /// Opaque user settings to be saved on the backend
  Map<String, dynamic> get pleromaSettingsStore;

  /// if true, skip filtering out broken threads
  bool get skipThreadContainment;

  /// if true, allows automatically follow moved following accounts
  bool get allowFollowingMove;

  /// sets the background image of the user
  String get pleromaBackgroundImage;

  /// if true, discovery of this account in search results and other services is allowed.
  @override
  bool get discoverable;

  /// the type of this account.
  dynamic get actorType;

  Map<String, dynamic> toJson();
}

@JsonSerializable()
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
  final PleromaMyAccountSource source;

  @override
  @JsonKey(name: "actor_type")
  final dynamic actorType;

  @override
  @JsonKey(name: "allow_following_move")
  final bool allowFollowingMove;

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

  PleromaMyAccountEdit(
      {this.bot,
      this.discoverable,
      this.displayName,
      this.fieldsAttributes,
      this.locked,
      this.note,
      this.source,
      this.actorType,
      this.allowFollowingMove,
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
      this.skipThreadContainment});

  factory PleromaMyAccountEdit.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountEditFromJson(json);

  factory PleromaMyAccountEdit.fromJsonString(String jsonString) =>
      _$PleromaMyAccountEditFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountEditToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountEditToJson(this));
}

abstract class IPleromaMyAccount
    implements IMastodonMyAccount, IPleromaAccount {
  @override
  IPleromaMyAccountSource get source;

  @override
  IPleromaMyAccountPleromaPart get pleroma;
}

abstract class IPleromaMyAccountSource implements IMastodonMyAccountSource {
  @override
  List<IPleromaField> get fields;

  PleromaMyAccountSourcePleromaPart get pleroma;

  PleromaVisibility get privacyPleroma;
}

@HiveType()
@JsonSerializable()
class PleromaMyAccountSource implements IPleromaMyAccountSource {
  @override
  MastodonVisibility get privacyMastodon =>
      mastodonVisibilityValues.valueToEnumMap[privacy];

  @override
  PleromaVisibility get privacyPleroma => privacy.toPleromaVisibility();

  @override
  @HiveField(1)
  String privacy;
  @override
  @HiveField(2)
  bool sensitive;
  @override
  @HiveField(3)
  String language;
  @override
  @HiveField(4)
  String note;
  @override
  @HiveField(5)
  List<PleromaField> fields;
  @override
  @HiveField(6)
  @JsonKey(name: "follow_requests_count")
  int followRequestsCount;
  @override
  @HiveField(7)
  PleromaMyAccountSourcePleromaPart pleroma;

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

@HiveType()
@JsonSerializable()
class PleromaMyAccountSourcePleromaPart {
  //  show_role: boolean, nullable, true when the user wants his role (e.g admin, moderator) to be shown
  @HiveField(1)
  @JsonKey(name: "show_role")
  bool showRole;

  //  no_rich_text - boolean, nullable, true when html tags are stripped from all statuses requested from the API
  @HiveField(2)
  @JsonKey(name: "no_rich_text")
  bool noRichText;

  //  discoverable: boolean, true when the user allows discovery of the account in search results and other services.
  @HiveField(3)
  bool discoverable;

  // actor_type: string, the type of this account.
  @HiveField(4)
  @JsonKey(name: "actor_type")
  String actorType;

  PleromaMyAccountSourcePleromaPart(
      {this.showRole, this.noRichText, this.discoverable, this.actorType});

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

@HiveType()
@JsonSerializable(explicitToJson: true)
class PleromaAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @HiveField(1)
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  @HiveField(2)
  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
//  List<PleromaTag> tags;
  List<dynamic> tags;

  @HiveField(3)
  PleromaAccountRelationship relationship;
  @HiveField(4)
  @JsonKey(name: "is_admin")
  bool isAdmin;
  @HiveField(5)
  @JsonKey(name: "is_moderator")
  @HiveField(6)
  bool isModerator;

  @HiveField(7)
  @JsonKey(name: "confirmation_pending")
  bool confirmationPending;

  @HiveField(8)
  // TODO: CHECK, was in previous implementation, but not exist at
  @JsonKey(name: "hide_favorites")
  bool hideFavorites;

  @HiveField(9)
  @JsonKey(name: "hide_followers")
  @HiveField(10)
  bool hideFollowers;
  @HiveField(11)
  @JsonKey(name: "hide_follows")
  bool hideFollows;
  @HiveField(12)
  @JsonKey(name: "hide_followers_count")
  bool hideFollowersCount;
  @HiveField(13)
  @JsonKey(name: "hide_follows_count")
  bool hideFollowsCount;

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @HiveField(14)
  @JsonKey(name: "settings_store")
  dynamic settingsStore;

  /// The token needed for Pleroma chat. Only returned in verify_credentials
  @HiveField(15)
  @JsonKey(name: "chat_token")
  String chatToken;
  @HiveField(16)
  bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  bool allowFollowingMove;

  /// The count of unread conversations. Only returned to the account owner.
  @HiveField(18)
  @JsonKey(name: "unread_conversation_count")
  int unreadConversationCount;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @JsonKey(name: "skip_thread_containment")
  bool skipThreadContainment;

  @HiveField(19)
  @JsonKey(name: "notifications_settings")
  PleromaMyAccountPleromaPartNotificationsSettings notificationSettings;

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
      this.settingsStore,
      this.chatToken,
      this.deactivated,
      this.allowFollowingMove,
      this.unreadConversationCount,
      this.skipThreadContainment,
      this.notificationSettings});

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
        ' hideFollowsCount: $hideFollowsCount, settingsStore: $settingsStore,'
        ' chatToken: $chatToken, deactivated: $deactivated,'
        ' allowFollowingMove: $allowFollowingMove,'
        ' unreadConversationCount: $unreadConversationCount,'
        ' skipThreadContainment: $skipThreadContainment,'
        ' notificationSettings: $notificationSettings}';
  }
}

abstract class IPleromaMyAccountPleromaPart
    implements IPleromaAccountPleromaPart {
  dynamic get settingsStore;

  int get unreadConversationCount;

  String get chatToken;

  PleromaMyAccountPleromaPartNotificationsSettings get notificationSettings;
}

@HiveType()
@JsonSerializable(explicitToJson: true)
class PleromaMyAccount implements IPleromaMyAccount, IPreferencesObject {
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
  PleromaMyAccountPleromaPart pleroma;
  @override
  @HiveField(20)
  @JsonKey(name: "last_status_at")
  DateTime lastStatusAt;
  @override
  @HiveField(21)
  PleromaMyAccountSource source;

  PleromaMyAccount(
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
      this.lastStatusAt,
      this.source});

  factory PleromaMyAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountFromJson(json);

  factory PleromaMyAccount.fromJsonString(String jsonString) =>
      _$PleromaMyAccountFromJson(jsonDecode(jsonString));

  static List<PleromaMyAccount> listFromJsonString(String str) =>
      List<PleromaMyAccount>.from(
          json.decode(str).map((x) => PleromaMyAccount.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaMyAccountToJson(this);

  String toJsonString() => jsonEncode(_$PleromaMyAccountToJson(this));

  PleromaMyAccount copyWith(
      {String id,
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
      PleromaMyAccountPleromaPart pleroma}) {
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
        pleroma: pleroma ?? this.pleroma);
  }
}

@HiveType()
@JsonSerializable()
class PleromaMyAccountPleromaPartNotificationsSettings {
  bool followers;
  bool follows;
  @JsonKey(name: "non_followers")
  bool nonFollowers;
  @JsonKey(name: "non_follows")
  bool nonFollows;

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

@HiveType()
@JsonSerializable(explicitToJson: true)
class PleromaMyAccountPleromaPart implements IPleromaMyAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @HiveField(1)
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  @override
  @HiveField(2)
  // todo: remove hack, Pleroma return List<String> instead of List<PleromaTag>
  // for example at accounts/verify_credentials endpoint
//  List<PleromaTag> tags;
  List<dynamic> tags;

  @override
  @HiveField(3)
  PleromaAccountRelationship relationship;
  @override
  @HiveField(4)
  @JsonKey(name: "is_admin")
  bool isAdmin;
  @override
  @HiveField(5)
  @JsonKey(name: "is_moderator")
  @HiveField(6)
  bool isModerator;

  @override
  @HiveField(7)
  @JsonKey(name: "confirmation_pending")
  bool confirmationPending;

  @override
  @HiveField(8)
  // TODO: CHECK, was in previous implementation, but not exist at
  @JsonKey(name: "hide_favorites")
  bool hideFavorites;

  @override
  @HiveField(9)
  @JsonKey(name: "hide_followers")
  @HiveField(10)
  bool hideFollowers;
  @override
  @HiveField(11)
  @JsonKey(name: "hide_follows")
  bool hideFollows;
  @override
  @HiveField(12)
  @JsonKey(name: "hide_followers_count")
  bool hideFollowersCount;
  @override
  @HiveField(13)
  @JsonKey(name: "hide_follows_count")
  bool hideFollowsCount;

  ///  A generic map of settings for frontends.
  ///  Opaque to the backend.
  ///  Only returned in verify_credentials and update_credentials
  @override
  @HiveField(14)
  @JsonKey(name: "settings_store")
  dynamic settingsStore;

  /// The token needed for Pleroma chat. Only returned in verify_credentials
  @override
  @HiveField(15)
  @JsonKey(name: "chat_token")
  String chatToken;
  @override
  @HiveField(16)
  bool deactivated;

  ///  boolean, true when the user allows automatically follow moved
  ///  following accounts
  @override
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  bool allowFollowingMove;

  /// The count of unread conversations. Only returned to the account owner.
  @override
  @HiveField(18)
  @JsonKey(name: "unread_conversation_count")
  int unreadConversationCount;

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @override
  @JsonKey(name: "skip_thread_containment")
  bool skipThreadContainment;

  @override
  @HiveField(19)
  @JsonKey(name: "notifications_settings")
  PleromaMyAccountPleromaPartNotificationsSettings notificationSettings;

  PleromaMyAccountPleromaPart(
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
      this.settingsStore,
      this.chatToken,
      this.deactivated,
      this.allowFollowingMove,
      this.unreadConversationCount,
      this.skipThreadContainment,
      this.notificationSettings});

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
        ' notificationSettings: $notificationSettings}';
  }
}
