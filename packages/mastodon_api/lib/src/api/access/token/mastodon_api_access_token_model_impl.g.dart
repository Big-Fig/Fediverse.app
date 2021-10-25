// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessTokenAdapter
    extends TypeAdapter<MastodonApiAccessToken> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessToken(
      oauthToken: fields[0] as MastodonApiOAuthToken,
      scopes: fields[1] as MastodonApiAccessScopes,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessToken obj) {
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
      other is MastodonApiAccessTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessToken _$$_MastodonApiAccessTokenFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiAccessToken(
      oauthToken: MastodonApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: MastodonApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiAccessTokenToJson(
        _$_MastodonApiAccessToken instance) =>
    <String, dynamic>{
      'oauth_token': instance.oauthToken.toJson(),
      'scopes': instance.scopes.toJson(),
    };
