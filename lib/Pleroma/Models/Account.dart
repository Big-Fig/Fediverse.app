// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';
part 'Account.g.dart';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));
List<Account> accountsFromJson(String str) => new List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));


String accountToJson(Account data) => json.encode(data.toJson());

@HiveType()
class Account {
    @HiveField(0)
    String username;
    @HiveField(1)
    String url;
    @HiveField(2)
    int statusesCount;
    @HiveField(3)
    String note;
    @HiveField(4)
    bool locked;
    @HiveField(5)
    String id;
    @HiveField(6)
    String headerStatic;
    @HiveField(7)
    String header;
    @HiveField(8)
    int followingCount;
    @HiveField(9)
    int followersCount;
    @HiveField(10)
    List<dynamic> fields;
    @HiveField(11)
    List<dynamic> emojis;
    @HiveField(12)
    String displayName;
    @HiveField(13)
    DateTime createdAt;
    @HiveField(14)
    bool bot;
    @HiveField(15)
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

    factory Account.fromJson(Map<String, dynamic> json) => new Account(
        username: json["username"],
        url: json["url"],
        statusesCount: json["statuses_count"],
        note: json["note"],
        locked: json["locked"],
        id: json["id"],
        headerStatic: json["header_static"],
        header: json["header"],
        followingCount: json["following_count"],
        followersCount: json["followers_count"],
        fields: new List<dynamic>.from(json["fields"].map((x) => x)),
        emojis: new List<dynamic>.from(json["emojis"].map((x) => x)),
        displayName: json["display_name"],
        createdAt: DateTime.parse(json["created_at"]),
        bot: json["bot"],
        avatarStatic: json["avatar_static"],
        avatar: json["avatar"],
        acct: json["acct"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "url": url,
        "statuses_count": statusesCount,
        "note": note,
        "locked": locked,
        "id": id,
        "header_static": headerStatic,
        "header": header,
        "following_count": followingCount,
        "followers_count": followersCount,
        "fields": new List<dynamic>.from(fields.map((x) => x)),
        "emojis": new List<dynamic>.from(emojis.map((x) => x)),
        "display_name": displayName,
        "created_at": createdAt.toIso8601String(),
        "bot": bot,
        "avatar_static": avatarStatic,
        "avatar": avatar,
        "acct": acct,
    };
}
