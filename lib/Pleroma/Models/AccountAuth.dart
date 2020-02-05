// To parse this JSON data, do
//
//     final accountAuth = accountAuthFromJson(jsonString);

import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AccountAuth.g.dart';

@JsonSerializable()
@HiveType()
class AccountAuth {
  @HiveField(0)
  @JsonKey(name: "token_type")
  String tokenType;
  @HiveField(1)
  String scope;
  @HiveField(2)
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @HiveField(3)
  String me;
  @HiveField(4)
  @JsonKey(name: "expires_in")
  int expiresIn;
  @HiveField(5)
  @JsonKey(name: "created_at")
  int createdAt;
  @HiveField(6)
  @JsonKey(name: "access_token")
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


  factory AccountAuth.fromJson(Map<String, dynamic> json) =>
      _$AccountAuthFromJson(json);

  factory AccountAuth.fromJsonString(String jsonString) =>
      _$AccountAuthFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$AccountAuthToJson(this);
  String toJsonString() => jsonEncode(_$AccountAuthToJson(this));

}
