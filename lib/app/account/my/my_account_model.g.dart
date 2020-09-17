// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountRemoteWrapperAdapter
    extends TypeAdapter<MyAccountRemoteWrapper> {
  @override
  final int typeId = 21;

  @override
  MyAccountRemoteWrapper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyAccountRemoteWrapper(
      remoteAccount: fields[0] as PleromaMyAccount,
    );
  }

  @override
  void write(BinaryWriter writer, MyAccountRemoteWrapper obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.remoteAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyAccountRemoteWrapperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
