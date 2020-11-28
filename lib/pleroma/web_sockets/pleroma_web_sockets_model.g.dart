// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_web_sockets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaWebSocketsEvent _$PleromaWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return PleromaWebSocketsEvent(
    event: json['event'] as String,
    payload: json['payload'] as String,
  );
}

Map<String, dynamic> _$PleromaWebSocketsEventToJson(
        PleromaWebSocketsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };
