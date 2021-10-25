// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_level_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessLevelMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessLevelMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessLevelMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessLevelMastodonAdapter(
      fields[0] as MastodonApiAccessLevel,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessLevelMastodonAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessLevelMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessLevelMastodonAdapter
    _$$_UnifediApiAccessLevelMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessLevelMastodonAdapter(
          MastodonApiAccessLevel.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessLevelMastodonAdapterToJson(
        _$_UnifediApiAccessLevelMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
