// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Field.dart';

part 'Account.g.dart';

@HiveType()
@JsonSerializable()
class Account {
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
  List<Field> fields;
  @HiveField(11)
  List<Emoji> emojis;
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
  @HiveField(18)
  bool discoverable;
  @HiveField(19)
  AccountPleromaPart pleroma;
  @HiveField(20)
  Source source;

  Account({
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
    this.discoverable,
    this.source,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  factory Account.fromJsonString(String jsonString) =>
      _$AccountFromJson(jsonDecode(jsonString));

  static List<Account> listFromJsonString(String str) =>
      new List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

  Map<String, dynamic> toJson() => _$AccountToJson(this);
  String toJsonString() => jsonEncode(_$AccountToJson(this));

  Future<http.Response> refreshAccount() async {
    try {
      var response = await CurrentInstance.instance.currentClient.run(
        path: Accounts.currentUser(),
        method: HTTPMethod.GET,
      );

      Account currentAccount = Account.fromJson(jsonDecode(response.body));
      String account =
          "${currentAccount.username}@${CurrentInstance.instance.currentClient.baseURL}";

      CurrentInstance.instance.currentAccount = currentAccount;
      await InstanceStorage.updateAccount(account, currentAccount);
      return response;
    } catch (e) {
      return e;
    }
  }
}


@HiveType()
@JsonSerializable()
class AccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @HiveField(1)
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  @HiveField(2)
  ///  Lists an array of tags for the user
  List<Tag> tags;

  /// Includes fields as documented for
  /// Mastodon API https://docs.joinmastodon.org/entities/relationship/
  @HiveField(3)
  Relationship relationship;
  @HiveField(4)
  @JsonKey(name: "is_admin")

  /// boolean, nullable, true if user is an admin
  bool isAdmin;
  @HiveField(5)
  @JsonKey(name: "is_moderator")

  /// boolean, nullable, true if user is a moderator
  @HiveField(6)
  bool isModerator;
  @HiveField(7)
  @JsonKey(name: "confirmation_pending")

  /// boolean, true if a new user account is waiting on email confirmation to
  /// be activated
  bool confirmationPending;

  @HiveField(8)

  /// TODO: CHECK, was in previous implementation, but not exist at
  /// https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
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
  AccountPleromaPartNotificationsSettings notificationSettings;


  AccountPleromaPart(
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
        this.notificationSettings,
      });

  factory AccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$AccountPleromaPartFromJson(json);

  factory AccountPleromaPart.fromJsonString(String jsonString) =>
      _$AccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$AccountPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$AccountPleromaPartToJson(this));
}

@HiveType()
@JsonSerializable()
class AccountPleromaPartNotificationsSettings {
  bool followers;
  bool follows;
  @JsonKey(name: "non_followers")
  bool nonFollowers;
  @JsonKey(name: "non_follows")
  bool nonFollows;

  AccountPleromaPartNotificationsSettings(
      {this.followers, this.follows, this.nonFollowers, this.nonFollows});

  factory AccountPleromaPartNotificationsSettings.fromJson(
      Map<String, dynamic> json) =>
      _$AccountPleromaPartNotificationsSettingsFromJson(json);

  factory AccountPleromaPartNotificationsSettings.fromJsonString(
      String jsonString) =>
      _$AccountPleromaPartNotificationsSettingsFromJson(
          jsonDecode(jsonString));

  static List<AccountPleromaPartNotificationsSettings>
  listFromJsonString(String str) =>
      new List<AccountPleromaPartNotificationsSettings>.from(json
          .decode(str)
          .map((x) =>
          AccountPleromaPartNotificationsSettings.fromJson(x)));

  Map<String, dynamic> toJson() =>
      _$AccountPleromaPartNotificationsSettingsToJson(this);

  String toJsonString() =>
      jsonEncode(_$AccountPleromaPartNotificationsSettingsToJson(this));
}
