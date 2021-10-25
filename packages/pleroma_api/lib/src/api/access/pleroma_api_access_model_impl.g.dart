// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessAdapter extends TypeAdapter<PleromaApiAccess> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccess read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccess(
      url: fields[0] as String,
      instance: fields[1] as PleromaApiInstance?,
      applicationAccessToken: fields[4] as PleromaApiAccessApplicationToken?,
      userAccessToken: fields[5] as PleromaApiAccessUserToken?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccess obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.instance)
      ..writeByte(4)
      ..write(obj.applicationAccessToken)
      ..writeByte(5)
      ..write(obj.userAccessToken)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccess _$$_PleromaApiAccessFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiAccess(
      url: json['url'] as String,
      instance: json['instance'] == null
          ? null
          : PleromaApiInstance.fromJson(
              json['instance'] as Map<String, dynamic>),
      applicationAccessToken: json['application_access_token'] == null
          ? null
          : PleromaApiAccessApplicationToken.fromJson(
              json['application_access_token'] as Map<String, dynamic>),
      userAccessToken: json['user_access_token'] == null
          ? null
          : PleromaApiAccessUserToken.fromJson(
              json['user_access_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiAccessToJson(_$_PleromaApiAccess instance) {
  final val = <String, dynamic>{
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instance', instance.instance?.toJson());
  writeNotNull(
      'application_access_token', instance.applicationAccessToken?.toJson());
  writeNotNull('user_access_token', instance.userAccessToken?.toJson());
  return val;
}
