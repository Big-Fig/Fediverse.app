import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_web_sockets_model.g.dart';

class PleromaApiWebSocketsChannelConfig
    extends WebSocketsChannelConfig<PleromaApiWebSocketsEvent> {
  PleromaApiWebSocketsChannelConfig({
    required Uri baseUrl,
    required Map<String, String?> queryArgs,
    required IConnectionService connectionService,
  }) : super(
          baseUrl: baseUrl,
          queryArgs: queryArgs,
          connectionService: connectionService,
        );

  @override
  PleromaApiWebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaApiWebSocketsEvent.fromJson(json);
}

@JsonSerializable()
class PleromaApiWebSocketsEvent extends WebSocketsEvent implements IJsonObject {
  final String event;

  PleromaApiWebSocketsEventType get eventType =>
      event.toPleromaApiWebSocketsEventType();

  /// Could be Status or Notification
  final String? payload;

  PleromaApiWebSocketsEvent({
    required this.event,
    required this.payload,
  });

  @override
  String toString() {
    return 'PleromaApiWebSocketsEvent{'
        'event: $event, '
        'payload: $payload'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiWebSocketsEvent &&
          runtimeType == other.runtimeType &&
          event == other.event &&
          payload == other.payload;

  @override
  int get hashCode => event.hashCode ^ payload.hashCode;

  static PleromaApiWebSocketsEvent fromJson(Map<String, dynamic> json) =>
      _$PleromaApiWebSocketsEventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiWebSocketsEventToJson(this);

  PleromaApiStatus parsePayloadAsStatus() =>
      PleromaApiStatus.fromJson(jsonDecode(payload!));

  PleromaApiNotification parsePayloadAsNotification() =>
      PleromaApiNotification.fromJson(jsonDecode(payload!));

  PleromaApiChat parsePayloadAsChat() =>
      PleromaApiChat.fromJson(jsonDecode(payload!));

  PleromaApiConversation parsePayloadAsConversation() =>
      PleromaApiConversation.fromJson(jsonDecode(payload!));

  String? parsePayloadAsRemoteId() => payload;
}

enum PleromaApiWebSocketsEventType {
  /// update	A new status has appeared	Status
  update,

  /// notification	A new notification has appeared	Notification
  notification,

  /// delete	A status has been deleted	ID of the deleted status
  delete,

  /// filters_changed	Keyword filters have been changed
  filtersChanged,

  /// not exist in documentation but looks like conversation update
  conversation,
  pleromaChatUpdate,
  unknown,
}

const unknownPleromaApiWebSocketsEventType =
    PleromaApiWebSocketsEventType.unknown;

const _updatePleromaApiWebSocketsEventTypeJsonValue = "update";
const _notificationPleromaApiWebSocketsEventTypeJsonValue = "notification";
const _deletePleromaApiWebSocketsEventTypeJsonValue = "delete";
const _filtersChangedPleromaApiWebSocketsEventTypeJsonValue = "filters_changed";
const _conversationPleromaApiWebSocketsEventTypeJsonValue = "conversation";
const _pleromaChatUpdatePleromaApiWebSocketsEventTypeJsonValue =
    "pleroma:chat_update";
const _unknownPleromaApiWebSocketsEventTypeJsonValue = "unknown";

extension PleromaApiWebSocketsEventTypeExtension
    on PleromaApiWebSocketsEventType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaApiWebSocketsEventType.update:
        result = _updatePleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.notification:
        result = _notificationPleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.delete:
        result = _deletePleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.filtersChanged:
        result = _filtersChangedPleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.conversation:
        result = _conversationPleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.pleromaChatUpdate:
        result = _pleromaChatUpdatePleromaApiWebSocketsEventTypeJsonValue;
        break;
      case PleromaApiWebSocketsEventType.unknown:
        result = _unknownPleromaApiWebSocketsEventTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaApiWebSocketsEventTypeStringExtension on String {
  PleromaApiWebSocketsEventType toPleromaApiWebSocketsEventType() {
    PleromaApiWebSocketsEventType result;

    switch (this) {
      case _updatePleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.update;
        break;
      case _notificationPleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.notification;
        break;
      case _deletePleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.delete;
        break;
      case _filtersChangedPleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.filtersChanged;
        break;
      case _conversationPleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.conversation;
        break;
      case _pleromaChatUpdatePleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.pleromaChatUpdate;
        break;
      case _unknownPleromaApiWebSocketsEventTypeJsonValue:
        result = PleromaApiWebSocketsEventType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownPleromaApiWebSocketsEventType;
        break;
    }

    return result;
  }
}
