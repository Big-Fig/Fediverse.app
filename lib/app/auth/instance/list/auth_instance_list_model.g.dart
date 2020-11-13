// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceListAdapter extends TypeAdapter<AuthInstanceList> {
  @override
  final int typeId = 17;

  @override
  AuthInstanceList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstanceList(
      instances: (fields[0] as List)?.cast<AuthInstance>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstanceList obj) {
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
      other is AuthInstanceListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInstanceList _$AuthInstanceListFromJson(Map<String, dynamic> json) {
  return AuthInstanceList(
    instances: (json['instances'] as List)
        ?.map((e) =>
            e == null ? null : AuthInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AuthInstanceListToJson(AuthInstanceList instance) =>
    <String, dynamic>{
      'instances': instance.instances?.map((e) => e?.toJson())?.toList(),
    };
