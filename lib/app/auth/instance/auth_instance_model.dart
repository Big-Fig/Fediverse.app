import 'dart:convert';

import 'package:fedi/local_preferences/local_preferences_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_instance_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 50)
@JsonSerializable(explicitToJson: true)
class AuthInstance extends IPreferencesObject {
  @HiveField(0)
  @JsonKey(name: "url_schema")
  final String urlSchema;
  @HiveField(1)
  @JsonKey(name: "url_host")
  final String urlHost;
  @HiveField(2)
  final String acct;
  @HiveField(3)
  final PleromaOAuthToken token;
  @HiveField(4)
  @JsonKey(name: "auth_code")
  final String authCode;

  @HiveField(5)
  @JsonKey(name: "is_pleroma_instance")
  final bool isPleromaInstance;

  @HiveField(6)
  final PleromaClientApplication application;

  @HiveField(7)
  final PleromaInstance info;

  bool get isSupportChats =>
      info?.pleroma?.metadata?.features?.contains("pleroma_chat_messages") ==
      true;

  String get userAtHost => "$acct@$urlHost";

  Uri get url => Uri(scheme: urlSchema, host: urlHost);

  AuthInstance({
    this.urlSchema,
    this.urlHost,
    this.acct,
    this.token,
    this.authCode,
    this.isPleromaInstance,
    this.application,
    this.info,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInstance &&
          runtimeType == other.runtimeType &&
          urlSchema == other.urlSchema &&
          urlHost == other.urlHost &&
          acct == other.acct &&
          token == other.token &&
          authCode == other.authCode &&
          isPleromaInstance == other.isPleromaInstance &&
          application == other.application &&
          info == other.info;

  @override
  int get hashCode =>
      urlSchema.hashCode ^
      urlHost.hashCode ^
      acct.hashCode ^
      token.hashCode ^
      authCode.hashCode ^
      isPleromaInstance.hashCode ^
      application.hashCode ^
      info.hashCode;

  @override
  String toString() {
    return 'Instance{host: $urlHost, acct: $acct, '
        'token: $token,'
        'application: $application,'
        'instance: $info,'
        ' authCode: $authCode, isPleromaInstance: $isPleromaInstance}';
  }

  bool isInstanceWithHostAndAcct(
          {@required String host, @required String acct}) =>
      this.acct == acct && urlHost == host;

  AuthInstance copyWith({
    String urlSchema,
    String urlHost,
    String acct,
    PleromaOAuthToken token,
    String authCode,
    bool isPleromaInstance,
    PleromaClientApplication application,
    PleromaInstance info,
  }) {
    return AuthInstance(
      urlSchema: urlSchema ?? this.urlSchema,
      urlHost: urlHost ?? this.urlHost,
      acct: acct ?? this.acct,
      token: token ?? this.token,
      authCode: authCode ?? this.authCode,
      isPleromaInstance: isPleromaInstance ?? this.isPleromaInstance,
      application: application ?? this.application,
      info: info ?? this.info,
    );
  }

  factory AuthInstance.fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceFromJson(json);

  factory AuthInstance.fromJsonString(String jsonString) =>
      _$AuthInstanceFromJson(jsonDecode(jsonString));

  static List<AuthInstance> listFromJsonString(String str) =>
      List<AuthInstance>.from(
          json.decode(str).map((x) => AuthInstance.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$AuthInstanceToJson(this);

  String toJsonString() => jsonEncode(_$AuthInstanceToJson(this));
}
