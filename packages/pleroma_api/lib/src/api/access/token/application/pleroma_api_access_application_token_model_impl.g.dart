// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_application_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessApplicationTokenAdapter
    extends TypeAdapter<PleromaApiAccessApplicationToken> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessApplicationToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessApplicationToken(
      scopes: fields[1] as PleromaApiAccessScopes,
      clientApplication: fields[2] as PleromaApiClientApplication,
      oauthToken: fields[3] as PleromaApiOAuthToken,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessApplicationToken obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.scopes)
      ..writeByte(2)
      ..write(obj.clientApplication)
      ..writeByte(3)
      ..write(obj.oauthToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccessApplicationTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessApplicationToken
    _$$_PleromaApiAccessApplicationTokenFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiAccessApplicationToken(
          scopes: PleromaApiAccessScopes.fromJson(
              json['scopes'] as Map<String, dynamic>),
          clientApplication: PleromaApiClientApplication.fromJson(
              json['clientApplication'] as Map<String, dynamic>),
          oauthToken: PleromaApiOAuthToken.fromJson(
              json['oauth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiAccessApplicationTokenToJson(
        _$_PleromaApiAccessApplicationToken instance) =>
    <String, dynamic>{
      'scopes': instance.scopes.toJson(),
      'clientApplication': instance.clientApplication.toJson(),
      'oauth_token': instance.oauthToken.toJson(),
    };
