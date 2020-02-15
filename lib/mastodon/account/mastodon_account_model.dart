import 'dart:convert';

import 'package:fedi/Pleroma/Models/Emoji.dart';
import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:fedi/Pleroma/Models/Source.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_account_model.g.dart';

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
  MastodonSource source;

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
