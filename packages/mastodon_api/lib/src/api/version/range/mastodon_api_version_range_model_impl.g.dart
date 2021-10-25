// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_version_range_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiVersionRangeAdapter
    extends TypeAdapter<MastodonApiVersionRange> {
  @override
  final int typeId = 0;

  @override
  MastodonApiVersionRange read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiVersionRange(
      min: fields[0] as MastodonApiVersion?,
      max: fields[1] as MastodonApiVersion?,
      minInclusive: fields[2] as bool,
      maxInclusive: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiVersionRange obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.min)
      ..writeByte(1)
      ..write(obj.max)
      ..writeByte(2)
      ..write(obj.minInclusive)
      ..writeByte(3)
      ..write(obj.maxInclusive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiVersionRangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiVersionRange _$$_MastodonApiVersionRangeFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiVersionRange(
      min: json['min'] == null
          ? null
          : MastodonApiVersion.fromJson(json['min'] as Map<String, dynamic>),
      max: json['max'] == null
          ? null
          : MastodonApiVersion.fromJson(json['max'] as Map<String, dynamic>),
      minInclusive: json['min_inclusive'] as bool? ?? true,
      maxInclusive: json['max_inclusive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MastodonApiVersionRangeToJson(
    _$_MastodonApiVersionRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('min', instance.min?.toJson());
  writeNotNull('max', instance.max?.toJson());
  val['min_inclusive'] = instance.minInclusive;
  val['max_inclusive'] = instance.maxInclusive;
  return val;
}
