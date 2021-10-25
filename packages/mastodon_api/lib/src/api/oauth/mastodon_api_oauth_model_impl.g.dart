// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_oauth_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiOAuthTokenAdapter extends TypeAdapter<MastodonApiOAuthToken> {
  @override
  final int typeId = 0;

  @override
  MastodonApiOAuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiOAuthToken(
      accessToken: fields[0] as String,
      tokenType: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiOAuthToken obj) {
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
      other is MastodonApiOAuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiOAuthToken _$$_MastodonApiOAuthTokenFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiOAuthToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$$_MastodonApiOAuthTokenToJson(
        _$_MastodonApiOAuthToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
