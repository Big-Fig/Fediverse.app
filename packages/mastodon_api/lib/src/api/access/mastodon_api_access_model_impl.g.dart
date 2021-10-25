// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessAdapter extends TypeAdapter<MastodonApiAccess> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccess read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccess(
      url: fields[0] as String,
      instance: fields[1] as MastodonApiInstance?,
      applicationAccessToken: fields[4] as MastodonApiAccessApplicationToken?,
      userAccessToken: fields[5] as MastodonApiAccessUserToken?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccess obj) {
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
      other is MastodonApiAccessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccess _$$_MastodonApiAccessFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiAccess(
      url: json['url'] as String,
      instance: json['instance'] == null
          ? null
          : MastodonApiInstance.fromJson(
              json['instance'] as Map<String, dynamic>),
      applicationAccessToken: json['application_access_token'] == null
          ? null
          : MastodonApiAccessApplicationToken.fromJson(
              json['application_access_token'] as Map<String, dynamic>),
      userAccessToken: json['user_access_token'] == null
          ? null
          : MastodonApiAccessUserToken.fromJson(
              json['user_access_token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiAccessToJson(
    _$_MastodonApiAccess instance) {
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
