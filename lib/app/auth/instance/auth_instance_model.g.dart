// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceAdapter extends TypeAdapter<AuthInstance> {
  @override
  final int typeId = 18;

  @override
  AuthInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstance(
      urlSchema: fields[0] as String?,
      urlHost: fields[1] as String?,
      acct: fields[2] as String?,
      token: fields[3] as PleromaOAuthToken?,
      authCode: fields[4] as String?,
      isPleroma: fields[5] as bool,
      application: fields[6] as PleromaClientApplication?,
      info: fields[7] as PleromaInstance?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstance obj) {
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
      other is AuthInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInstance _$AuthInstanceFromJson(Map<String, dynamic> json) {
  return AuthInstance(
    urlSchema: json['url_schema'] as String?,
    urlHost: json['url_host'] as String?,
    acct: json['acct'] as String?,
    token: json['token'] == null
        ? null
        : PleromaOAuthToken.fromJson(json['token'] as Map<String, dynamic>),
    authCode: json['auth_code'] as String?,
    isPleroma: json['is_pleroma_instance'] as bool,
    application: json['application'] == null
        ? null
        : PleromaClientApplication.fromJson(
            json['application'] as Map<String, dynamic>),
    info: json['info'] == null
        ? null
        : PleromaInstance.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthInstanceToJson(AuthInstance instance) =>
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
