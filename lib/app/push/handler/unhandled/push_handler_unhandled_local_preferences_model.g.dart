// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_unhandled_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerUnhandledListAdapter
    extends TypeAdapter<PushHandlerUnhandledList> {
  @override
  PushHandlerUnhandledList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushHandlerUnhandledList(
      messages: (fields[0] as List)?.cast<PushHandlerMessage>(),
    );
  }

  @override
  void write(BinaryWriter writer, PushHandlerUnhandledList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.messages);
  }
}
