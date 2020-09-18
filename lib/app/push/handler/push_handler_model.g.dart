// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerMessageAdapter extends TypeAdapter<PushHandlerMessage> {
  @override
  PushHandlerMessage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushHandlerMessage(
      body: fields[0] as PleromaPushMessageBody,
      pushMessage: fields[1] as PushMessage,
    );
  }

  @override
  void write(BinaryWriter writer, PushHandlerMessage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.pushMessage);
  }
}
