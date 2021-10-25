// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessTokenAdapter extends TypeAdapter<PleromaApiAccessToken> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessToken(
      oauthToken: fields[0] as PleromaApiOAuthToken,
      scopes: fields[1] as PleromaApiAccessScopes,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessToken obj) {
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
      other is PleromaApiAccessTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessToken _$$_PleromaApiAccessTokenFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccessToken(
      oauthToken: PleromaApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: PleromaApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiAccessTokenToJson(
        _$_PleromaApiAccessToken instance) =>
    <String, dynamic>{
      'oauth_token': instance.oauthToken.toJson(),
      'scopes': instance.scopes.toJson(),
    };
