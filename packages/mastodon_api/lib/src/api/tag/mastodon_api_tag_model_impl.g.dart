// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_tag_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiTagAdapter extends TypeAdapter<MastodonApiTag> {
  @override
  final int typeId = 0;

  @override
  MastodonApiTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiTag(
      name: fields[0] as String,
      url: fields[1] as String,
      history: (fields[2] as List?)?.cast<MastodonApiTagHistoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiTag obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiTag _$$_MastodonApiTagFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiTag(
      name: json['name'] as String,
      url: json['url'] as String,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) =>
              MastodonApiTagHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MastodonApiTagToJson(_$_MastodonApiTag instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('history', instance.history?.map((e) => e.toJson()).toList());
  return val;
}
