// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_version_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiVersionAdapter extends TypeAdapter<PleromaApiVersion> {
  @override
  final int typeId = 0;

  @override
  PleromaApiVersion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiVersion(
      mastodonCompatibilityVersion: fields[0] as MastodonApiVersion,
      major: fields[1] as int,
      minor: fields[2] as int?,
      patch: fields[3] as int?,
      buildNumber: fields[4] as int?,
      commit: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiVersion obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mastodonCompatibilityVersion)
      ..writeByte(1)
      ..write(obj.major)
      ..writeByte(2)
      ..write(obj.minor)
      ..writeByte(3)
      ..write(obj.patch)
      ..writeByte(4)
      ..write(obj.buildNumber)
      ..writeByte(5)
      ..write(obj.commit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiVersionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiVersion _$$_PleromaApiVersionFromJson(Map<String, dynamic> json) =>
    _$_PleromaApiVersion(
      mastodonCompatibilityVersion: MastodonApiVersion.fromJson(
          json['mastodon_compatibility_version'] as Map<String, dynamic>),
      major: json['major'] as int,
      minor: json['minor'] as int?,
      patch: json['patch'] as int?,
      buildNumber: json['build_number'] as int?,
      commit: json['commit'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiVersionToJson(
    _$_PleromaApiVersion instance) {
  final val = <String, dynamic>{
    'mastodon_compatibility_version':
        instance.mastodonCompatibilityVersion.toJson(),
    'major': instance.major,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minor', instance.minor);
  writeNotNull('patch', instance.patch);
  writeNotNull('build_number', instance.buildNumber);
  writeNotNull('commit', instance.commit);
  return val;
}
