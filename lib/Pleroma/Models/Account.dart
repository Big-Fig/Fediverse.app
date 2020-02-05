// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/InstanceStorage.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Accounts.dart';
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
