// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_notifications_push_handler_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SimpleNotificationsPushHandlerMessageAdapter
    extends TypeAdapter<SimpleNotificationsPushHandlerMessage> {
  @override
  final int typeId = 34;

  @override
  SimpleNotificationsPushHandlerMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SimpleNotificationsPushHandlerMessage(
      body: fields[0] as PleromaApiPushMessageBody,
      pushMessage: fields[1] as PushMessage,
    );
  }

  @override
  void write(BinaryWriter writer, SimpleNotificationsPushHandlerMessage obj) {
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
      other is SimpleNotificationsPushHandlerMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleNotificationsPushHandlerMessage
    _$SimpleNotificationsPushHandlerMessageFromJson(Map<String, dynamic> json) {
  return SimpleNotificationsPushHandlerMessage(
    body: PleromaApiPushMessageBody.fromJson(
        json['body'] as Map<String, dynamic>),
    pushMessage:
        PushMessage.fromJson(json['push_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SimpleNotificationsPushHandlerMessageToJson(
        SimpleNotificationsPushHandlerMessage instance) =>
    <String, dynamic>{
      'body': instance.body.toJson(),
      'push_message': instance.pushMessage.toJson(),
    };
