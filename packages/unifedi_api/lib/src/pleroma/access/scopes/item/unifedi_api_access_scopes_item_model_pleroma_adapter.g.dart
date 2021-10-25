// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_item_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesItemPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesItemPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesItemPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesItemPleromaAdapter(
      fields[0] as PleromaApiAccessScopesItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccessScopesItemPleromaAdapter obj) {
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
      other is UnifediApiAccessScopesItemPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesItemPleromaAdapter
    _$$_UnifediApiAccessScopesItemPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesItemPleromaAdapter(
          PleromaApiAccessScopesItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesItemPleromaAdapterToJson(
        _$_UnifediApiAccessScopesItemPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
