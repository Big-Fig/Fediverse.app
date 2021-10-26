// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_application_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessApplicationTokenAdapter
    extends TypeAdapter<UnifediApiAccessApplicationToken> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessApplicationToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessApplicationToken(
      scopes: fields[1] as UnifediApiAccessScopes,
      clientApplication: fields[2] as UnifediApiClientApplication,
      oauthToken: fields[3] as UnifediApiOAuthToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessApplicationToken obj) {
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
      other is UnifediApiAccessApplicationTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessApplicationToken
    _$$_UnifediApiAccessApplicationTokenFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiAccessApplicationToken(
          scopes: UnifediApiAccessScopes.fromJson(
              json['scopes'] as Map<String, dynamic>),
          clientApplication: UnifediApiClientApplication.fromJson(
              json['client_application'] as Map<String, dynamic>),
          oauthToken: UnifediApiOAuthToken.fromJson(
              json['oauth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessApplicationTokenToJson(
        _$_UnifediApiAccessApplicationToken instance) =>
    <String, dynamic>{
      'scopes': instance.scopes.toJson(),
      'client_application': instance.clientApplication.toJson(),
      'oauth_token': instance.oauthToken.toJson(),
    };
