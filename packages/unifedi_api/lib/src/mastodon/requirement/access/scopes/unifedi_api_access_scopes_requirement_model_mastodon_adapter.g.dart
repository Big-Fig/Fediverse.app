// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_requirement_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesRequirementMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesRequirementMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesRequirementMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesRequirementMastodonAdapter(
      fields[0] as MastodonApiAccessScopesRequirement,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccessScopesRequirementMastodonAdapter obj) {
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
      other is UnifediApiAccessScopesRequirementMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesRequirementMastodonAdapter
    _$$_UnifediApiAccessScopesRequirementMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesRequirementMastodonAdapter(
          MastodonApiAccessScopesRequirement.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesRequirementMastodonAdapterToJson(
        _$_UnifediApiAccessScopesRequirementMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
