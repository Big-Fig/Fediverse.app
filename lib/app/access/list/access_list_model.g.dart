// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessListAdapter extends TypeAdapter<UnifediApiAccessList> {
  @override
  final int typeId = 17;

  @override
  UnifediApiAccessList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessList(
      instances: (fields[0] as List).cast<UnifediApiAccess>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessList obj) {
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
      other is UnifediApiAccessListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnifediApiAccessList _$UnifediApiAccessListFromJson(Map<String, dynamic> json) {
  return UnifediApiAccessList(
    instances: (json['instances'] as List<dynamic>)
        .map((e) => UnifediApiAccess.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UnifediApiAccessListToJson(
        UnifediApiAccessList instance) =>
    <String, dynamic>{
      'instances': instance.instances.map((e) => e.toJson()).toList(),
    };
