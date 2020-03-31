// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_notification_websockets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaNotificationWebSocketsEvent _$PleromaNotificationWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return PleromaNotificationWebSocketsEvent(
    event: json['event'] as String,
    payload: json['payload'] as String,
  );
}

Map<String, dynamic> _$PleromaNotificationWebSocketsEventToJson(
        PleromaNotificationWebSocketsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };
