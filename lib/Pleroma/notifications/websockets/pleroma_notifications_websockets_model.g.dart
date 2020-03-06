// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_notifications_websockets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaNotificationsWebSocketsEvent
    _$PleromaNotificationsWebSocketsEventFromJson(Map<String, dynamic> json) {
  return PleromaNotificationsWebSocketsEvent(
    event: json['event'] as String,
    payload: json['payload'] as String,
  );
}

Map<String, dynamic> _$PleromaNotificationsWebSocketsEventToJson(
        PleromaNotificationsWebSocketsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };
