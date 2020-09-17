// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthInstanceAdapter extends TypeAdapter<AuthInstance> {
  @override
  final int typeId = 18;

  @override
  AuthInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthInstance(
      urlSchema: fields[0] as String,
      urlHost: fields[1] as String,
      acct: fields[2] as String,
      token: fields[3] as PleromaOAuthToken,
      authCode: fields[4] as String,
      isPleromaInstance: fields[5] as bool,
      application: fields[6] as PleromaClientApplication,
      info: fields[7] as PleromaInstance,
    );
  }

  @override
  void write(BinaryWriter writer, AuthInstance obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.urlSchema)
      ..writeByte(1)
      ..write(obj.urlHost)
      ..writeByte(2)
      ..write(obj.acct)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.authCode)
      ..writeByte(5)
      ..write(obj.isPleromaInstance)
      ..writeByte(6)
      ..write(obj.application)
      ..writeByte(7)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
