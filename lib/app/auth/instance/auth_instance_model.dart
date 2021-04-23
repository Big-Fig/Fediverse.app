import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/api/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_instance_model.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_instance_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
// ignore_for_file: no-magic-number
@HiveType(typeId: -32 + 50)
@JsonSerializable(explicitToJson: true)
class AuthInstance extends IJsonObject {
  @HiveField(0)
  @JsonKey(name: "url_schema")
  final String? urlSchema;
  @HiveField(1)
  @JsonKey(name: "url_host")
  final String urlHost;
  @HiveField(2)
  final String acct;
  @HiveField(3)
  final PleromaOAuthToken? token;
  @HiveField(4)
  @JsonKey(name: "auth_code")
  final String? authCode;

  @HiveField(5)
  @JsonKey(name: "is_pleroma_instance")
  final bool isPleroma;

  bool get isMastodon => !isPleroma;

  @HiveField(6)
  final PleromaClientApplication? application;

  @HiveField(7)
  final PleromaInstance? info;

  bool get isSupportChats =>
      info?.pleroma?.metadata?.features?.contains("pleroma_chat_messages") ==
      true;

  String get userAtHost => "$acct@$urlHost";

  Uri get uri => Uri(scheme: urlSchema, host: urlHost);

  AuthInstance({
    required this.urlSchema,
    required this.urlHost,
    required this.acct,
    required this.token,
    required this.authCode,
    required this.isPleroma,
    required this.application,
    required this.info,
  });

  bool? get isSubscribeToAccountFeatureSupported => isPleroma;

  bool? get isAccountFavouritesFeatureSupported => isPleroma;

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
          isPleroma == other.isPleroma &&
          application == other.application &&
          info == other.info;

  @override
  int get hashCode =>
      urlSchema.hashCode ^
      urlHost.hashCode ^
      acct.hashCode ^
      token.hashCode ^
      authCode.hashCode ^
      isPleroma.hashCode ^
      application.hashCode ^
      info.hashCode;

  @override
  String toString() {
    return 'Instance{host: $urlHost, acct: $acct, '
        'token: $token,'
        'application: $application,'
        'instance: $info,'
        ' authCode: $authCode, isPleromaInstance: $isPleroma}';
  }

  bool isInstanceWithHostAndAcct({
    required String? host,
    required String? acct,
  }) =>
      this.acct == acct && urlHost == host;

  // ignore: long-parameter-list
  AuthInstance copyWith({
    String? urlSchema,
    String? urlHost,
    String? acct,
    PleromaOAuthToken? token,
    String? authCode,
    bool? isPleroma,
    PleromaClientApplication? application,
    IPleromaInstance? info,
  }) {
    return AuthInstance(
      urlSchema: urlSchema ?? this.urlSchema,
      urlHost: urlHost ?? this.urlHost,
      acct: acct ?? this.acct,
      token: token ?? this.token,
      authCode: authCode ?? this.authCode,
      isPleroma: isPleroma ?? this.isPleroma,
      application: application ?? this.application,
      info: info?.toPleromaInstance() ?? this.info,
    );
  }

  factory AuthInstance.fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceFromJson(json);

  factory AuthInstance.fromJsonString(String jsonString) =>
      _$AuthInstanceFromJson(jsonDecode(jsonString));

  static List<AuthInstance> listFromJsonString(String str) =>
      List<AuthInstance>.from(
        json.decode(str).map((x) => AuthInstance.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$AuthInstanceToJson(this);

  String toJsonString() => jsonEncode(_$AuthInstanceToJson(this));
}
