import 'dart:convert';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/Pleroma/tag/pleroma_tag_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:fedi/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/Pleroma/source/pleroma_source_model.dart';
import 'package:fedi/Pleroma/field/pleroma_field_model.dart';


part 'pleroma_account_model.g.dart';

abstract class IPleromaAccount implements IMastodonAccount {
  @override
  List<IPleromaField> get fields;
  @override
  List<IPleromaEmoji> get emojis;
  @override
  IPleromaSource get source;
  PleromaAccountPleromaPart get pleroma;
}

@HiveType()
@JsonSerializable()
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
  @HiveField(18)
  PleromaSource source;
  @HiveField(19)
  PleromaAccountPleromaPart pleroma;


  PleromaAccount({this.username, this.url, this.statusesCount, this.note,
    this.locked, this.id, this.headerStatic, this.header, this.followingCount,
    this.followersCount, this.fields, this.emojis, this.displayName,
    this.createdAt, this.bot, this.avatarStatic, this.avatar, this.acct,
    this.source, this.pleroma});

  factory PleromaAccount.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountFromJson(json);

  factory PleromaAccount.fromJsonString(String jsonString) =>
      _$PleromaAccountFromJson(jsonDecode(jsonString));

  static List<PleromaAccount> listFromJsonString(String str) =>
      new List<PleromaAccount>.from(json.decode(str).map((x) => PleromaAccount.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountToJson(this));

  Future<http.Response> refreshAccount() async {
    try {
      var response = await CurrentInstance.instance.currentClient.run(
        path: Accounts.currentUser(),
        method: HTTPMethod.GET,
      );

      PleromaAccount currentAccount = PleromaAccount.fromJson(jsonDecode(response.body));
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
class PleromaAccountPleromaPart {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @HiveField(1)
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  @HiveField(2)
  //  Lists an array of tags for the user
  List<PleromaTag> tags;

  // Includes fields as documented for
  // Mastodon API https://docs.joinmastodon.org/entities/relationship/
  @HiveField(3)
  Relationship relationship;
  @HiveField(4)
  @JsonKey(name: "is_admin")
  // boolean, nullable, true if user is an admin
  bool isAdmin;
  @HiveField(5)
  @JsonKey(name: "is_moderator")
  // boolean, nullable, true if user is a moderator
  @HiveField(6)
  bool isModerator;
  @HiveField(7)
  @JsonKey(name: "confirmation_pending")
  // boolean, true if a new user account is waiting on email confirmation to be activated
  bool confirmationPending;

  @HiveField(8)
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
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

  //  A generic map of settings for frontends.
  //  Opaque to the backend.
  //  Only returned in verify_credentials and update_credentials
  @HiveField(14)
  @JsonKey(name: "settings_store")
  dynamic settingsStore;

  // The token needed for Pleroma chat. Only returned in verify_credentials
  @HiveField(15)
  @JsonKey(name: "chat_token")
  String chatToken;
  @HiveField(16)
  bool deactivated;

  //  boolean, true when the user allows automatically follow moved following accounts
  @HiveField(17)
  @JsonKey(name: "allow_following_move")
  bool allowFollowingMove;

  // The count of unread conversations. Only returned to the account owner.
  @HiveField(18)
  @JsonKey(name: "unread_conversation_count")
  int unreadConversationCount;

  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @JsonKey(name: "skip_thread_containment")
  bool skipThreadContainment;

  @HiveField(19)
  @JsonKey(name: "notifications_settings")
  PleromaAccountPleromaPartNotificationsSettings notificationSettings;

  PleromaAccountPleromaPart({
    this.hideFollowersCount,
    this.hideFollowsCount,
    this.settingsStore,
    this.chatToken,
    this.deactivated,
    this.allowFollowingMove,
    this.unreadConversationCount,
    this.backgroundImage,
    this.confirmationPending,
    this.hideFavorites,
    this.hideFollowers,
    this.hideFollows,
    this.isAdmin,
    this.isModerator,
    this.relationship,
    this.skipThreadContainment,
    this.tags,
  });

  factory PleromaAccountPleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountPleromaPartFromJson(json);

  factory PleromaAccountPleromaPart.fromJsonString(String jsonString) =>
      _$PleromaAccountPleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaAccountPleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountPleromaPartToJson(this));
}



@HiveType()
@JsonSerializable()
class PleromaAccountPleromaPartNotificationsSettings {
  bool followers;
  bool follows;
  @JsonKey(name:"non_followers")
  bool nonFollowers;
  @JsonKey(name:"non_follows")
  bool nonFollows;

  PleromaAccountPleromaPartNotificationsSettings({this.followers, this.follows,
    this.nonFollowers, this.nonFollows});


  factory PleromaAccountPleromaPartNotificationsSettings.fromJson(Map<String, dynamic> json) =>
      _$PleromaAccountPleromaPartNotificationsSettingsFromJson(json);

  factory PleromaAccountPleromaPartNotificationsSettings.fromJsonString(String jsonString) =>
      _$PleromaAccountPleromaPartNotificationsSettingsFromJson(jsonDecode(jsonString));

  static List<PleromaAccountPleromaPartNotificationsSettings> listFromJsonString(String str) =>
      new List<PleromaAccountPleromaPartNotificationsSettings>.from(json.decode(str).map((x) => PleromaAccountPleromaPartNotificationsSettings.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaAccountPleromaPartNotificationsSettingsToJson(this);

  String toJsonString() => jsonEncode(_$PleromaAccountPleromaPartNotificationsSettingsToJson(this));



}
