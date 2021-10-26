// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_application_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessApplicationTokenAdapter
    extends TypeAdapter<MastodonApiAccessApplicationToken> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessApplicationToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessApplicationToken(
      scopes: fields[1] as MastodonApiAccessScopes,
      clientApplication: fields[2] as MastodonApiClientApplication,
      oauthToken: fields[3] as MastodonApiOAuthToken,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessApplicationToken obj) {
    writer
      ..writeByte(3)
      ..writeByte(2)
      ..write(obj.clientApplication)
      ..writeByte(1)
      ..write(obj.scopes)
      ..writeByte(3)
      ..write(obj.oauthToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiAccessApplicationTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessApplicationToken
    _$$_MastodonApiAccessApplicationTokenFromJson(Map<String, dynamic> json) =>
        _$_MastodonApiAccessApplicationToken(
          scopes: MastodonApiAccessScopes.fromJson(
              json['scopes'] as Map<String, dynamic>),
          clientApplication: MastodonApiClientApplication.fromJson(
              json['client_application'] as Map<String, dynamic>),
          oauthToken: MastodonApiOAuthToken.fromJson(
              json['oauth_token'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_MastodonApiAccessApplicationTokenToJson(
        _$_MastodonApiAccessApplicationToken instance) =>
    <String, dynamic>{
      'scopes': instance.scopes.toJson(),
      'client_application': instance.clientApplication.toJson(),
      'oauth_token': instance.oauthToken.toJson(),
    };
