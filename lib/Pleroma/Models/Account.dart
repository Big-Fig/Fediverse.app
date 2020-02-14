// To parse this JSON data, do
//
//     account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:fedi/Pleroma/Models/Relationship.dart';
import 'package:fedi/Pleroma/Models/Source.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'Account.g.dart';

@HiveType()
@JsonSerializable()
class MastodonAccount {
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

  // Note the extra source property,
  // which is not visible on accounts other than your own.
  // Also note that plain-text is used within source and
  // HTML is used for their corresponding properties such as note and fields.
  @HiveField(18)
  Source source;

  MastodonAccount({
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
    this.source,
  });

  factory MastodonAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonAccountFromJson(json);

  factory MastodonAccount.fromJsonString(String jsonString) =>
      _$MastodonAccountFromJson(jsonDecode(jsonString));

  static List<MastodonAccount> listFromJsonString(String str) =>
      new List<MastodonAccount>.from(
          json.decode(str).map((x) => MastodonAccount.fromJson(x)));

  Map<String, dynamic> toJson() => _$MastodonAccountToJson(this);

  String toJsonString() => jsonEncode(_$MastodonAccountToJson(this));
}


@JsonSerializable()
class Account extends MastodonAccount {
  @HiveField(19)
  AccountPleroma pleroma;

  Account({
    String username,
    String url,
    int statusesCount,
    String note,
    bool locked,
    String id,
    String headerStatic,
    String header,
    int followingCount,
    int followersCount,
    List<Field> fields,
    List<Emoji> emojis,
    String displayName,
    DateTime createdAt,
    bool bot,
    String avatarStatic,
    String avatar,
    String acct,
    this.pleroma,
  }) : super(
          username: username,
          url: url,
          statusesCount: statusesCount,
          note: note,
          locked: locked,
          id: id,
          headerStatic: headerStatic,
          header: header,
          followingCount: followingCount,
          followersCount: followersCount,
          fields: fields,
          emojis: emojis,
          displayName: displayName,
          createdAt: createdAt,
          bot: bot,
          avatarStatic: avatarStatic,
          avatar: avatar,
          acct: acct,
        );

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
class AccountPleromaNotificationsSettings {
bool followers;
bool follows;
@JsonKey(name:"non_followers")
bool nonFollowers;
@JsonKey(name:"non_follows")
bool nonFollows;

AccountPleromaNotificationsSettings({this.followers, this.follows,
  this.nonFollowers, this.nonFollows});


factory AccountPleromaNotificationsSettings.fromJson(Map<String, dynamic> json) =>
    _$AccountPleromaNotificationsSettingsFromJson(json);

factory AccountPleromaNotificationsSettings.fromJsonString(String jsonString) =>
    _$AccountPleromaNotificationsSettingsFromJson(jsonDecode(jsonString));

static List<AccountPleromaNotificationsSettings> listFromJsonString(String str) =>
    new List<AccountPleromaNotificationsSettings>.from(json.decode(str).map((x) => AccountPleromaNotificationsSettings.fromJson(x)));

Map<String, dynamic> toJson() => _$AccountPleromaNotificationsSettingsToJson(this);

String toJsonString() => jsonEncode(_$AccountPleromaNotificationsSettingsToJson(this));



}

@HiveType()
@JsonSerializable()
class AccountPleroma {
  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  @HiveField(1)
  @JsonKey(name: "background_image")
  dynamic backgroundImage;

  @HiveField(2)
  //  Lists an array of tags for the user
  List<Tag> tags;

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
  dynamic notificationSettings;

  AccountPleroma({
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

  factory AccountPleroma.fromJson(Map<String, dynamic> json) =>
      _$AccountPleromaFromJson(json);

  factory AccountPleroma.fromJsonString(String jsonString) =>
      _$AccountPleromaFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$AccountPleromaToJson(this);

  String toJsonString() => jsonEncode(_$AccountPleromaToJson(this));
}



// TODO: HIVE doesn't supported inheritance
class AccountAdapter extends TypeAdapter<Account> {
  @override
  Account read(BinaryReader reader) {
    var obj = Account();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.username = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
        case 2:
          obj.statusesCount = reader.read() as int;
          break;
        case 3:
          obj.note = reader.read() as String;
          break;
        case 4:
          obj.locked = reader.read() as bool;
          break;
        case 5:
          obj.id = reader.read() as String;
          break;
        case 6:
          obj.headerStatic = reader.read() as String;
          break;
        case 7:
          obj.header = reader.read() as String;
          break;
        case 8:
          obj.followingCount = reader.read() as int;
          break;
        case 9:
          obj.followersCount = reader.read() as int;
          break;
        case 10:
          obj.fields = (reader.read() as List)?.cast<Field>();
          break;
        case 11:
          obj.emojis = (reader.read() as List)?.cast<Emoji>();
          break;
        case 12:
          obj.displayName = reader.read() as String;
          break;
        case 13:
          obj.createdAt = reader.read() as DateTime;
          break;
        case 14:
          obj.bot = reader.read() as bool;
          break;
        case 15:
          obj.avatarStatic = reader.read() as String;
          break;
        case 16:
          obj.avatar = reader.read() as String;
          break;
        case 17:
          obj.acct = reader.read() as String;
          break;
        case 18:
          obj.source = reader.read() as Source;
          break;
        case 19:
          obj.pleroma = reader.read() as AccountPleroma;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.writeByte(20);
    writer.writeByte(0);
    writer.write(obj.username);
    writer.writeByte(1);
    writer.write(obj.url);
    writer.writeByte(2);
    writer.write(obj.statusesCount);
    writer.writeByte(3);
    writer.write(obj.note);
    writer.writeByte(4);
    writer.write(obj.locked);
    writer.writeByte(5);
    writer.write(obj.id);
    writer.writeByte(6);
    writer.write(obj.headerStatic);
    writer.writeByte(7);
    writer.write(obj.header);
    writer.writeByte(8);
    writer.write(obj.followingCount);
    writer.writeByte(9);
    writer.write(obj.followersCount);
    writer.writeByte(10);
    writer.write(obj.fields);
    writer.writeByte(11);
    writer.write(obj.emojis);
    writer.writeByte(12);
    writer.write(obj.displayName);
    writer.writeByte(13);
    writer.write(obj.createdAt);
    writer.writeByte(14);
    writer.write(obj.bot);
    writer.writeByte(15);
    writer.write(obj.avatarStatic);
    writer.writeByte(16);
    writer.write(obj.avatar);
    writer.writeByte(17);
    writer.write(obj.acct);
    writer.writeByte(18);
    writer.write(obj.source);
    writer.writeByte(19);
    writer.write(obj.pleroma);
  }
}
