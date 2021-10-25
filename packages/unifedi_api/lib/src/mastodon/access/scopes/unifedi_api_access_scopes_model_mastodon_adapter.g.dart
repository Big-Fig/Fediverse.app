// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesMastodonAdapter(
      fields[0] as MastodonApiAccessScopes,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessScopesMastodonAdapter obj) {
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
      other is UnifediApiAccessScopesMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesMastodonAdapter
    _$$_UnifediApiAccessScopesMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesMastodonAdapter(
          MastodonApiAccessScopes.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesMastodonAdapterToJson(
        _$_UnifediApiAccessScopesMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
