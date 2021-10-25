// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessListAdapter extends TypeAdapter<AccessList> {
  @override
  final int typeId = 83;

  @override
  AccessList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessList(
      instances: (fields[0] as List).cast<UnifediApiAccess>(),
    );
  }

  @override
  void write(BinaryWriter writer, AccessList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.instances);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccessList _$$_AccessListFromJson(Map<String, dynamic> json) =>
    _$_AccessList(
      instances: (json['instances'] as List<dynamic>)
          .map((e) => UnifediApiAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AccessListToJson(_$_AccessList instance) =>
    <String, dynamic>{
      'instances': instance.instances.map((e) => e.toJson()).toList(),
    };
