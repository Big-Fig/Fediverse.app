// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_user_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessUserTokenAdapter
    extends TypeAdapter<MastodonApiAccessUserToken> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessUserToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessUserToken(
      oauthToken: fields[3] as MastodonApiOAuthToken,
      scopes: fields[1] as MastodonApiAccessScopes,
      user: fields[2] as String,
      myAccount: fields[4] as MastodonApiMyAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessUserToken obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.scopes)
      ..writeByte(4)
      ..write(obj.myAccount)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.oauthToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiAccessUserTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessUserToken _$$_MastodonApiAccessUserTokenFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiAccessUserToken(
      oauthToken: MastodonApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: MastodonApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
      user: json['user'] as String,
      myAccount: json['my_account'] == null
          ? null
          : MastodonApiMyAccount.fromJson(
              json['my_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiAccessUserTokenToJson(
    _$_MastodonApiAccessUserToken instance) {
  final val = <String, dynamic>{
    'oauth_token': instance.oauthToken.toJson(),
    'scopes': instance.scopes.toJson(),
    'user': instance.user,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('my_account', instance.myAccount?.toJson());
  return val;
}
