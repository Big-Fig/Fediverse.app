// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_level_requirement_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessLevelRequirementMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessLevelRequirementMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessLevelRequirementMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessLevelRequirementMastodonAdapter(
      fields[0] as MastodonApiAccessLevelRequirement,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccessLevelRequirementMastodonAdapter obj) {
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
      other is UnifediApiAccessLevelRequirementMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessLevelRequirementMastodonAdapter
    _$$_UnifediApiAccessLevelRequirementMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessLevelRequirementMastodonAdapter(
          MastodonApiAccessLevelRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessLevelRequirementMastodonAdapterToJson(
        _$_UnifediApiAccessLevelRequirementMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
