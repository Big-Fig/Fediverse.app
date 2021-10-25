// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_user_token_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessUserTokenAdapter
    extends TypeAdapter<PleromaApiAccessUserToken> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessUserToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessUserToken(
      oauthToken: fields[3] as PleromaApiOAuthToken,
      scopes: fields[1] as PleromaApiAccessScopes,
      user: fields[2] as String,
      myAccount: fields[4] as PleromaApiMyAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessUserToken obj) {
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
      other is PleromaApiAccessUserTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessUserToken _$$_PleromaApiAccessUserTokenFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccessUserToken(
      oauthToken: PleromaApiOAuthToken.fromJson(
          json['oauth_token'] as Map<String, dynamic>),
      scopes: PleromaApiAccessScopes.fromJson(
          json['scopes'] as Map<String, dynamic>),
      user: json['user'] as String,
      myAccount: json['my_account'] == null
          ? null
          : PleromaApiMyAccount.fromJson(
              json['my_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiAccessUserTokenToJson(
    _$_PleromaApiAccessUserToken instance) {
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
