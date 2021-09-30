// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_push_handler_unhandled_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationsPushHandlerUnhandledListAdapter
    extends TypeAdapter<NotificationsPushHandlerUnhandledList> {
  @override
  final int typeId = 23;

  @override
  NotificationsPushHandlerUnhandledList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationsPushHandlerUnhandledList(
      messages: (fields[0] as List).cast<NotificationsPushHandlerMessage>(),
    );
  }

  @override
  void write(BinaryWriter writer, NotificationsPushHandlerUnhandledList obj) {
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
      other is NotificationsPushHandlerUnhandledListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsPushHandlerUnhandledList
    _$NotificationsPushHandlerUnhandledListFromJson(
            Map<String, dynamic> json) =>
        NotificationsPushHandlerUnhandledList(
          messages: (json['messages'] as List<dynamic>)
              .map((e) => NotificationsPushHandlerMessage.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$NotificationsPushHandlerUnhandledListToJson(
        NotificationsPushHandlerUnhandledList instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
