// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesPleromaAdapter(
      fields[0] as PleromaApiAccessScopes,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessScopesPleromaAdapter obj) {
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
      other is UnifediApiAccessScopesPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesPleromaAdapter
    _$$_UnifediApiAccessScopesPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesPleromaAdapter(
          PleromaApiAccessScopes.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesPleromaAdapterToJson(
        _$_UnifediApiAccessScopesPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
