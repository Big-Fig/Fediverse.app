// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_oauth_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaOAuthTokenAdapter extends TypeAdapter<PleromaOAuthToken> {
  @override
  PleromaOAuthToken read(BinaryReader reader) {
    var obj = PleromaOAuthToken();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.accessToken = reader.read() as String;
          break;
        case 1:
          obj.tokenType = reader.read() as String;
          break;
        case 2:
          obj.scope = reader.read() as String;
          break;
        case 3:
          obj.createdAt = reader.read() as dynamic;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaOAuthToken obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.accessToken);
    writer.writeByte(1);
    writer.write(obj.tokenType);
    writer.writeByte(2);
    writer.write(obj.scope);
    writer.writeByte(3);
    writer.write(obj.createdAt);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaOAuthToken _$PleromaOAuthTokenFromJson(Map<String, dynamic> json) {
  return PleromaOAuthToken(
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String,
    scope: json['scope'] as String,
    createdAt: json['created_at'],
  );
}

Map<String, dynamic> _$PleromaOAuthTokenToJson(PleromaOAuthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'scope': instance.scope,
      'created_at': instance.createdAt,
    };

PleromaOAuthAuthorizeRequest _$PleromaOAuthAuthorizeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaOAuthAuthorizeRequest(
    forceLogin: json['force_login'] as bool,
    clientId: json['client_id'] as String,
    redirectUri: json['redirect_uri'] as String,
    scope: json['scope'] as String,
    responseType: json['response_type'] as String,
  );
}

Map<String, dynamic> _$PleromaOAuthAuthorizeRequestToJson(
        PleromaOAuthAuthorizeRequest instance) =>
    <String, dynamic>{
      'force_login': instance.forceLogin,
      'response_type': instance.responseType,
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
    };

PleromaOAuthAccountTokenRequest _$PleromaOAuthAccountTokenRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaOAuthAccountTokenRequest(
    code: json['code'] as String,
    scope: json['scope'] as String,
    redirectUri: json['redirect_uri'] as String,
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    grantType: json['grant_type'] as String,
  );
}

Map<String, dynamic> _$PleromaOAuthAccountTokenRequestToJson(
        PleromaOAuthAccountTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'code': instance.code,
      'scope': instance.scope,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };

PleromaOAuthAppTokenRequest _$PleromaOAuthAppTokenRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaOAuthAppTokenRequest(
    scope: json['scope'] as String,
    redirectUri: json['redirect_uri'] as String,
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    grantType: json['grant_type'] as String,
  );
}

Map<String, dynamic> _$PleromaOAuthAppTokenRequestToJson(
        PleromaOAuthAppTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'scope': instance.scope,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };

PleromaOAuthAppTokenRevokeRequest _$PleromaOAuthAppTokenRevokeRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaOAuthAppTokenRevokeRequest(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$PleromaOAuthAppTokenRevokeRequestToJson(
        PleromaOAuthAppTokenRevokeRequest instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'token': instance.token,
    };
