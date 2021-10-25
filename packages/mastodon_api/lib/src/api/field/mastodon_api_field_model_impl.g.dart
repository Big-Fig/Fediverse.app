// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_field_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiFieldAdapter extends TypeAdapter<MastodonApiField> {
  @override
  final int typeId = 0;

  @override
  MastodonApiField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiField(
      name: fields[0] as String?,
      value: fields[1] as String?,
      verifiedAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiField obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.verifiedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiField _$$_MastodonApiFieldFromJson(Map<String, dynamic> json) =>
    _$_MastodonApiField(
      name: json['name'] as String?,
      value: json['value'] as String?,
      verifiedAt: json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
    );

Map<String, dynamic> _$$_MastodonApiFieldToJson(_$_MastodonApiField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  writeNotNull('verified_at', instance.verifiedAt?.toIso8601String());
  return val;
}
