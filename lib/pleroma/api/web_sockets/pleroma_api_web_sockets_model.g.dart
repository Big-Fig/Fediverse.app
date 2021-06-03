// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_web_sockets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiWebSocketsEvent _$PleromaApiWebSocketsEventFromJson(
    Map<String, dynamic> json) {
  return PleromaApiWebSocketsEvent(
    event: json['event'] as String,
    payload: json['payload'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiWebSocketsEventToJson(
        PleromaApiWebSocketsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };
