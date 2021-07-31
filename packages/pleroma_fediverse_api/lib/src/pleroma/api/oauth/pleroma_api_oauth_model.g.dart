// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_oauth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiOAuthTokenAdapter extends TypeAdapter<PleromaApiOAuthToken> {
  @override
  final int typeId = 19;

  @override
  PleromaApiOAuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiOAuthToken(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiOAuthToken obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiOAuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiOAuthToken _$PleromaApiOAuthTokenFromJson(Map<String, dynamic> json) {
  return PleromaApiOAuthToken(
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String,
  );
}

Map<String, dynamic> _$PleromaApiOAuthTokenToJson(
        PleromaApiOAuthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };

PleromaApiOAuthAuthorizeRequest _$PleromaApiOAuthAuthorizeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiOAuthAuthorizeRequest(
    forceLogin: json['force_login'] as bool?,
    clientId: json['client_id'] as String?,
    redirectUri: json['redirect_uri'] as String?,
    scope: json['scope'] as String?,
    responseType: json['response_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiOAuthAuthorizeRequestToJson(
        PleromaApiOAuthAuthorizeRequest instance) =>
    <String, dynamic>{
      'force_login': instance.forceLogin,
      'response_type': instance.responseType,
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
    };

PleromaApiOAuthAccountTokenRequest _$PleromaApiOAuthAccountTokenRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiOAuthAccountTokenRequest(
    code: json['code'] as String?,
    scope: json['scope'] as String?,
    redirectUri: json['redirect_uri'] as String?,
    clientId: json['client_id'] as String?,
    clientSecret: json['client_secret'] as String?,
    grantType: json['grant_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiOAuthAccountTokenRequestToJson(
        PleromaApiOAuthAccountTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'code': instance.code,
      'scope': instance.scope,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };

PleromaApiOAuthAppTokenRequest _$PleromaApiOAuthAppTokenRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiOAuthAppTokenRequest(
    scope: json['scope'] as String?,
    redirectUri: json['redirect_uri'] as String?,
    clientId: json['client_id'] as String?,
    clientSecret: json['client_secret'] as String?,
    grantType: json['grant_type'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiOAuthAppTokenRequestToJson(
        PleromaApiOAuthAppTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'scope': instance.scope,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };

PleromaApiOAuthAppTokenRevokeRequest
    _$PleromaApiOAuthAppTokenRevokeRequestFromJson(Map<String, dynamic> json) {
  return PleromaApiOAuthAppTokenRevokeRequest(
    clientId: json['client_id'] as String?,
    clientSecret: json['client_secret'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiOAuthAppTokenRevokeRequestToJson(
        PleromaApiOAuthAppTokenRevokeRequest instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'token': instance.token,
    };
