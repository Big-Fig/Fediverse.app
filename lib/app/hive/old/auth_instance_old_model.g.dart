// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_old_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceOldAdapter extends TypeAdapter<AuthInstanceOld> {
  @override
  final int typeId = 18;

  @override
  AuthInstanceOld read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstanceOld(
      urlSchema: fields[0] as String?,
      urlHost: fields[1] as String,
      acct: fields[2] as String,
      token: fields[3] as PleromaApiOAuthToken?,
      authCode: fields[4] as String?,
      isPleroma: fields[5] as bool,
      application: fields[6] as PleromaApiClientApplication?,
      info: fields[7] as PleromaApiInstance?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstanceOld obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.urlSchema)
      ..writeByte(1)
      ..write(obj.urlHost)
      ..writeByte(2)
      ..write(obj.acct)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.authCode)
      ..writeByte(5)
      ..write(obj.isPleroma)
      ..writeByte(6)
      ..write(obj.application)
      ..writeByte(7)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInstanceOldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInstanceOld _$AuthInstanceOldFromJson(Map<String, dynamic> json) {
  return AuthInstanceOld(
    urlSchema: json['url_schema'] as String?,
    urlHost: json['url_host'] as String,
    acct: json['acct'] as String,
    token: json['token'] == null
        ? null
        : PleromaApiOAuthToken.fromJson(json['token'] as Map<String, dynamic>),
    authCode: json['auth_code'] as String?,
    isPleroma: json['is_pleroma_instance'] as bool,
    application: json['application'] == null
        ? null
        : PleromaApiClientApplication.fromJson(
            json['application'] as Map<String, dynamic>),
    info: json['info'] == null
        ? null
        : PleromaApiInstance.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthInstanceOldToJson(AuthInstanceOld instance) =>
    <String, dynamic>{
      'url_schema': instance.urlSchema,
      'url_host': instance.urlHost,
      'acct': instance.acct,
      'token': instance.token?.toJson(),
      'auth_code': instance.authCode,
      'is_pleroma_instance': instance.isPleroma,
      'application': instance.application?.toJson(),
      'info': instance.info?.toJson(),
    };
