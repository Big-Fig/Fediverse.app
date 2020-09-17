// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_handler_unhandled_local_preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushHandlerUnhandledListAdapter
    extends TypeAdapter<PushHandlerUnhandledList> {
  @override
  final int typeId = 23;

  @override
  PushHandlerUnhandledList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushHandlerUnhandledListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
