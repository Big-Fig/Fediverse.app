// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_featured_tags_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiFeaturedTagAdapter
    extends TypeAdapter<MastodonApiFeaturedTag> {
  @override
  final int typeId = 0;

  @override
  MastodonApiFeaturedTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiFeaturedTag(
      id: fields[0] as String,
      lastStatusAt: fields[1] as DateTime?,
      statusesCount: fields[2] as int,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiFeaturedTag obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lastStatusAt)
      ..writeByte(2)
      ..write(obj.statusesCount)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiFeaturedTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiFeaturedTag _$$_MastodonApiFeaturedTagFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiFeaturedTag(
      id: json['id'] as String,
      lastStatusAt: json['last_status_at'] == null
          ? null
          : DateTime.parse(json['last_status_at'] as String),
      statusesCount: json['statuses_count'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_MastodonApiFeaturedTagToJson(
    _$_MastodonApiFeaturedTag instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_status_at', instance.lastStatusAt?.toIso8601String());
  val['statuses_count'] = instance.statusesCount;
  val['name'] = instance.name;
  return val;
}
