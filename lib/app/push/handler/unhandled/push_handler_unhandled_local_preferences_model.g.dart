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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushHandlerUnhandledList _$PushHandlerUnhandledListFromJson(
    Map<String, dynamic> json) {
  return PushHandlerUnhandledList(
    messages: (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : PushHandlerMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PushHandlerUnhandledListToJson(
        PushHandlerUnhandledList instance) =>
    <String, dynamic>{
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
    };
