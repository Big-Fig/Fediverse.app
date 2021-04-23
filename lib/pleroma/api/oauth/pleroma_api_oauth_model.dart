import 'dart:convert';

import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_oauth_model.g.dart';

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 51)
class PleromaApiOAuthToken implements IJsonObject {
  @HiveField(0)
  @JsonKey(name: "access_token")
  final String accessToken;
  @HiveField(1)
  @JsonKey(name: "token_type")
  final String tokenType;

  @HiveField(2)
  final dynamic scope;
  @JsonKey(name: "created_at")
  @HiveField(3)
  final dynamic createdAt;

  PleromaApiOAuthToken({
    required this.accessToken,
    required this.tokenType,
    required this.scope,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'PleromaApiOAuthToken{'
        'accessToken: $accessToken, '
        'tokenType: $tokenType, '
        'scope: $scope, '
        'createdAt: $createdAt'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthToken &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          tokenType == other.tokenType &&
          scope == other.scope &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      accessToken.hashCode ^
      tokenType.hashCode ^
      scope.hashCode ^
      createdAt.hashCode;

  factory PleromaApiOAuthToken.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiOAuthTokenFromJson(json);

  factory PleromaApiOAuthToken.fromJsonString(String jsonString) =>
      _$PleromaApiOAuthTokenFromJson(jsonDecode(jsonString));

  @override
  Map<String, dynamic> toJson() => _$PleromaApiOAuthTokenToJson(this);
}

@JsonSerializable()
class PleromaApiOAuthAuthorizeRequest {
  @JsonKey(name: "force_login")

  /// Forces the user to re-login,
  /// which is necessary for authorizing with multiple accounts from the same instance.

  final bool? forceLogin;
  @JsonKey(name: "response_type")

  ///  should be always code for this request

  final String? responseType;

  /// from application object
  @JsonKey(name: "client_id")
  final String? clientId;
  @JsonKey(name: "redirect_uri")

  /// Set a URI to redirect the user to.
  /// If this parameter is set to urn:ietf:wg:oauth:2.0:oob
  /// then the authorization code will be shown instead.
  /// Must match one of the redirect URIs declared during app registration.

  final String? redirectUri;

  /// List of requested OAuth scopes, separated by spaces (or by pluses,
  /// if using query parameters). Must be a subset of scopes declared during
  /// app registration. If not provided, defaults to read.
  final String? scope;

  PleromaApiOAuthAuthorizeRequest({
    required this.forceLogin,
    required this.clientId,
    required this.redirectUri,
    required this.scope,
    this.responseType = "code",
  });

  factory PleromaApiOAuthAuthorizeRequest.fromJsonString(String jsonString) =>
      _$PleromaApiOAuthAuthorizeRequestFromJson(jsonDecode(jsonString));

  factory PleromaApiOAuthAuthorizeRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiOAuthAuthorizeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiOAuthAuthorizeRequestToJson(this);

  @override
  String toString() {
    return 'PleromaApiOAuthAuthorizeRequest{'
        'forceLogin: $forceLogin, '
        'responseType: $responseType, '
        'clientId: $clientId, '
        'redirectUri: $redirectUri, '
        'scope: $scope'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthAuthorizeRequest &&
          runtimeType == other.runtimeType &&
          forceLogin == other.forceLogin &&
          responseType == other.responseType &&
          clientId == other.clientId &&
          redirectUri == other.redirectUri &&
          scope == other.scope;

  @override
  int get hashCode =>
      forceLogin.hashCode ^
      responseType.hashCode ^
      clientId.hashCode ^
      redirectUri.hashCode ^
      scope.hashCode;
}

@JsonSerializable()
class PleromaApiOAuthAccountTokenRequest {
  @JsonKey(name: "grant_type")
  final String? grantType;

  /// A user authorization code, obtained via /oauth/authorize
  final String? code;

  final String? scope;

  @JsonKey(name: "redirect_uri")
  final String? redirectUri;

  @JsonKey(name: "client_id")
  String? clientId;
  @JsonKey(name: "client_secret")
  String? clientSecret;

  PleromaApiOAuthAccountTokenRequest({
    required this.code,
    required this.scope,
    required this.redirectUri,
    required this.clientId,
    required this.clientSecret,
    this.grantType = "authorization_code",
  });

  @override
  String toString() {
    return 'PleromaOAuthAuthTokenRequest{'
        'grantType: $grantType, '
        'code: $code, '
        'scope: $scope, '
        'redirectUri: $redirectUri, '
        'clientId: $clientId, '
        'clientSecret: $clientSecret'
        '}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthAccountTokenRequest &&
          runtimeType == other.runtimeType &&
          grantType == other.grantType &&
          code == other.code &&
          scope == other.scope &&
          redirectUri == other.redirectUri &&
          clientId == other.clientId &&
          clientSecret == other.clientSecret;

  @override
  int get hashCode =>
      grantType.hashCode ^
      code.hashCode ^
      scope.hashCode ^
      redirectUri.hashCode ^
      clientId.hashCode ^
      clientSecret.hashCode;

  factory PleromaApiOAuthAccountTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiOAuthAccountTokenRequestFromJson(json);

  factory PleromaApiOAuthAccountTokenRequest.fromJsonString(String jsonString) =>
      _$PleromaApiOAuthAccountTokenRequestFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaApiOAuthAccountTokenRequestToJson(this);
}

@JsonSerializable()
class PleromaApiOAuthAppTokenRequest {
  @JsonKey(name: "grant_type")
  final String? grantType;

  final String? scope;

  @JsonKey(name: "redirect_uri")
  final String? redirectUri;

  @JsonKey(name: "client_id")
  String? clientId;
  @JsonKey(name: "client_secret")
  String? clientSecret;

  PleromaApiOAuthAppTokenRequest({
    this.scope,
    this.redirectUri,
    this.clientId,
    this.clientSecret,
    this.grantType = "client_credentials",
  });

  @override
  String toString() {
    return 'PleromaApiOAuthAppTokenRequest{'
        'grantType: $grantType, '
        'scope: $scope, '
        'redirectUri: $redirectUri, '
        'clientId: $clientId, '
        'clientSecret: $clientSecret'
        '}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthAppTokenRequest &&
          runtimeType == other.runtimeType &&
          grantType == other.grantType &&
          scope == other.scope &&
          redirectUri == other.redirectUri &&
          clientId == other.clientId &&
          clientSecret == other.clientSecret;

  @override
  int get hashCode =>
      grantType.hashCode ^
      scope.hashCode ^
      redirectUri.hashCode ^
      clientId.hashCode ^
      clientSecret.hashCode;

  factory PleromaApiOAuthAppTokenRequest.fromJsonString(String jsonString) =>
      _$PleromaApiOAuthAppTokenRequestFromJson(jsonDecode(jsonString));

  factory PleromaApiOAuthAppTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiOAuthAppTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiOAuthAppTokenRequestToJson(this);
}

@JsonSerializable()
class PleromaApiOAuthAppTokenRevokeRequest {
  @JsonKey(name: "client_id")
  final String? clientId;
  @JsonKey(name: "client_secret")
  final String? clientSecret;

  final String? token;

  PleromaApiOAuthAppTokenRevokeRequest({
    required this.clientId,
    required this.clientSecret,
    required this.token,
  });

  @override
  String toString() {
    return 'PleromaApiOAuthAppTokenRevokeRequest{'
        'clientId: $clientId, '
        'clientSecret: $clientSecret, '
        'token: $token'
        '}';
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthAppTokenRevokeRequest &&
          runtimeType == other.runtimeType &&
          clientId == other.clientId &&
          clientSecret == other.clientSecret &&
          token == other.token;

  @override
  int get hashCode =>
      clientId.hashCode ^ clientSecret.hashCode ^ token.hashCode;

  factory PleromaApiOAuthAppTokenRevokeRequest.fromJsonString(String jsonString) =>
      _$PleromaApiOAuthAppTokenRevokeRequestFromJson(jsonDecode(jsonString));

  factory PleromaApiOAuthAppTokenRevokeRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiOAuthAppTokenRevokeRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PleromaApiOAuthAppTokenRevokeRequestToJson(this);
}
