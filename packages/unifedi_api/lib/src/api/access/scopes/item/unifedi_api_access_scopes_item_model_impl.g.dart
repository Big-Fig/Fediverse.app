// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesItemAdapter
    extends TypeAdapter<UnifediApiAccessScopesItem> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesItem(
      permission: fields[0] as String,
      target: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessScopesItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.permission)
      ..writeByte(1)
      ..write(obj.target);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessScopesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesItem _$$_UnifediApiAccessScopesItemFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessScopesItem(
      permission: json['permission'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$$_UnifediApiAccessScopesItemToJson(
        _$_UnifediApiAccessScopesItem instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'target': instance.target,
    };
