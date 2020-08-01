// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_unhandled_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerUnhandledListAdapter
    extends TypeAdapter<PushHandlerUnhandledList> {
  @override
  PushHandlerUnhandledList read(BinaryReader reader) {
    var obj = PushHandlerUnhandledList();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.messages = (reader.read() as List)?.cast<PushHandlerMessage>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PushHandlerUnhandledList obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.messages);
  }
}
