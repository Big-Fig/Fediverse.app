// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_notifications_push_handler_unhandled_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimpleNotificationsPushHandlerUnhandledListAdapter
    extends TypeAdapter<SimpleNotificationsPushHandlerUnhandledList> {
  @override
  final int typeId = 23;

  @override
  SimpleNotificationsPushHandlerUnhandledList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SimpleNotificationsPushHandlerUnhandledList(
      messages:
          (fields[0] as List).cast<SimpleNotificationsPushHandlerMessage>(),
    );
  }

  @override
  void write(
      BinaryWriter writer, SimpleNotificationsPushHandlerUnhandledList obj) {
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
      other is SimpleNotificationsPushHandlerUnhandledListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleNotificationsPushHandlerUnhandledList
    _$SimpleNotificationsPushHandlerUnhandledListFromJson(
        Map<String, dynamic> json) {
  return SimpleNotificationsPushHandlerUnhandledList(
    messages: (json['messages'] as List<dynamic>)
        .map((e) => SimpleNotificationsPushHandlerMessage.fromJson(
            e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SimpleNotificationsPushHandlerUnhandledListToJson(
        SimpleNotificationsPushHandlerUnhandledList instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
