// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationsPushHandlerMessageAdapter
    extends TypeAdapter<NotificationsPushHandlerMessage> {
  @override
  final int typeId = 34;

  @override
  NotificationsPushHandlerMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationsPushHandlerMessage(
      body: fields[0] as dynamic,
      pushMessage: fields[1] as PushMessage,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationsPushHandlerMessage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.body)
      ..writeByte(1)
      ..write(obj.pushMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsPushHandlerMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsPushHandlerMessage _$NotificationsPushHandlerMessageFromJson(
    Map<String, dynamic> json) {
  return NotificationsPushHandlerMessage(
    body: json['body'],
    pushMessage:
        PushMessage.fromJson(json['push_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationsPushHandlerMessageToJson(
        NotificationsPushHandlerMessage instance) =>
    <String, dynamic>{
      'body': instance.body,
      'push_message': instance.pushMessage.toJson(),
    };
