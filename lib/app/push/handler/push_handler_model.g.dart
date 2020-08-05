// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerMessageAdapter extends TypeAdapter<PushHandlerMessage> {
  @override
  PushHandlerMessage read(BinaryReader reader) {
    var obj = PushHandlerMessage();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.body = reader.read() as PleromaPushMessageBody;
          break;
        case 1:
          obj.pushMessage = reader.read() as PushMessage;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushHandlerMessage obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.body);
    writer.writeByte(1);
    writer.write(obj.pushMessage);
  }
}
