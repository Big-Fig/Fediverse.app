// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_user_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessUserTokenAdapter
    extends TypeAdapter<UnifediApiAccessUserToken> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessUserToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessUserToken(
      oauthToken: fields[3] as UnifediApiOAuthToken,
      scopes: fields[1] as UnifediApiAccessScopes,
      user: fields[2] as String,
      myAccount: fields[4] as UnifediApiMyAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessUserToken obj) {
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
      other is UnifediApiAccessUserTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessUserToken _$$_UnifediApiAccessUserTokenFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessUserToken(
      oauthToken: UnifediApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: UnifediApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
      user: json['user'] as String,
      myAccount: json['my_account'] == null
          ? null
          : UnifediApiMyAccount.fromJson(
              json['my_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiAccessUserTokenToJson(
    _$_UnifediApiAccessUserToken instance) {
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
