// To parse this JSON data, do
//
//     final clientSettings = clientSettingsFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ClientSettings.g.dart';

@HiveType()
@JsonSerializable()
class ClientSettings {
  @HiveField(0)
  @JsonKey(name: "client_id")
  String clientId;
  @HiveField(1)
  @JsonKey(name: "client_secret")
  String clientSecret;
  @HiveField(2)
  String id;
  @HiveField(3)
  String name;
  @HiveField(4)
  @JsonKey(name: "redirect_uri")
  String redirectUri;
  @HiveField(5)
  String website;
  @HiveField(6)
  @JsonKey(name: "vapid_key")
  String vapidKey;
  @HiveField(7)
  String account;
  @HiveField(8)
  String code;

  ClientSettings(
      {this.clientId,
      this.clientSecret,
      this.id,
      this.name,
      this.redirectUri,
      this.website,
      this.vapidKey,
      this.code = ""});


  factory ClientSettings.fromJson(Map<String, dynamic> json) =>
      _$ClientSettingsFromJson(json);

  factory ClientSettings.fromJsonString(String jsonString) =>
      _$ClientSettingsFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$ClientSettingsToJson(this);
  String toJsonString() => jsonEncode(_$ClientSettingsToJson(this));
}
