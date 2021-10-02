// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_list_old_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceListOldAdapter extends TypeAdapter<AuthInstanceListOld> {
  @override
  final int typeId = 17;

  @override
  AuthInstanceListOld read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstanceListOld(
      instances: (fields[0] as List).cast<AuthInstanceOld>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstanceListOld obj) {
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
      other is AuthInstanceListOldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInstanceListOld _$$_AuthInstanceListOldFromJson(
        Map<String, dynamic> json) =>
    _$_AuthInstanceListOld(
      instances: (json['instances'] as List<dynamic>)
          .map((e) => AuthInstanceOld.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AuthInstanceListOldToJson(
        _$_AuthInstanceListOld instance) =>
    <String, dynamic>{
      'instances': instance.instances.map((e) => e.toJson()).toList(),
    };
