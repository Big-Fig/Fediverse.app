// To parse this JSON data, do
//
//     final accountAuth = accountAuthFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';

part 'AccountAuth.g.dart';
AccountAuth accountAuthFromJson(String str) =>
    AccountAuth.fromJson(json.decode(str));

String accountAuthToJson(AccountAuth data) => json.encode(data.toJson());

@HiveType()
class AccountAuth {
  @HiveField(0)
  String tokenType;
  @HiveField(1)
  String scope;
  @HiveField(2)
  String refreshToken;
  @HiveField(3)
  String me;
  @HiveField(4)
  int expiresIn;
  @HiveField(5)
  int createdAt;
  @HiveField(6)
  String accessToken;

  AccountAuth({
    this.tokenType,
    this.scope,
    this.refreshToken,
    this.me,
    this.expiresIn,
    this.createdAt,
    this.accessToken,
  });

  factory AccountAuth.fromJson(Map<String, dynamic> json) => new AccountAuth(
        tokenType: json["token_type"],
        scope: json["scope"],
        refreshToken: json["refresh_token"],
        me: json["me"],
        expiresIn: json["expires_in"],
        createdAt: json["created_at"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "scope": scope,
        "refresh_token": refreshToken,
        "me": me,
        "expires_in": expiresIn,
        "created_at": createdAt,
        "access_token": accessToken,
      };
}
