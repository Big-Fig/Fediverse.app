// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountRemoteWrapperAdapter
    extends TypeAdapter<MyAccountRemoteWrapper> {
  @override
  MyAccountRemoteWrapper read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
}
