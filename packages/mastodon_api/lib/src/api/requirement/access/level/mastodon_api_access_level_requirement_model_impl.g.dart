// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_level_requirement_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessLevelRequirementAdapter
    extends TypeAdapter<MastodonApiAccessLevelRequirement> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessLevelRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessLevelRequirement(
      requiredLevel: fields[0] as MastodonApiAccessLevel,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessLevelRequirement obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.requiredLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiAccessLevelRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessLevelRequirement
    _$$_MastodonApiAccessLevelRequirementFromJson(Map<String, dynamic> json) =>
        _$_MastodonApiAccessLevelRequirement(
          requiredLevel: MastodonApiAccessLevel.fromJson(
              json['required_level'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_MastodonApiAccessLevelRequirementToJson(
        _$_MastodonApiAccessLevelRequirement instance) =>
    <String, dynamic>{
      'required_level': instance.requiredLevel.toJson(),
    };
