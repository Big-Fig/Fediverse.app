// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessTokenAdapter extends TypeAdapter<UnifediApiAccessToken> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessToken(
      oauthToken: fields[0] as UnifediApiOAuthToken,
      scopes: fields[1] as UnifediApiAccessScopes,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessToken obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.scopes)
      ..writeByte(0)
      ..write(obj.oauthToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessToken _$$_UnifediApiAccessTokenFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessToken(
      oauthToken: UnifediApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: UnifediApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiAccessTokenToJson(
        _$_UnifediApiAccessToken instance) =>
    <String, dynamic>{
      'oauth_token': instance.oauthToken.toJson(),
      'scopes': instance.scopes.toJson(),
    };
