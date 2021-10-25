// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_metadata_version_requirement_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceMetadataVersionRequirementMastodonAdapterAdapter
    extends TypeAdapter<
        UnifediApiInstanceMetadataVersionRequirementMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceMetadataVersionRequirementMastodonAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceMetadataVersionRequirementMastodonAdapter(
      fields[0] as MastodonApiInstanceMetadataVersionRequirement,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiInstanceMetadataVersionRequirementMastodonAdapter obj) {
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
      other is UnifediApiInstanceMetadataVersionRequirementMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceMetadataVersionRequirementMastodonAdapter
    _$$_UnifediApiInstanceMetadataVersionRequirementMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceMetadataVersionRequirementMastodonAdapter(
          MastodonApiInstanceMetadataVersionRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiInstanceMetadataVersionRequirementMastodonAdapterToJson(
            _$_UnifediApiInstanceMetadataVersionRequirementMastodonAdapter
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
