import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:fedi/pleroma/api/conversation/pleroma_api_conversation_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_web_sockets_model.g.dart';

class PleromaWebSocketsChannelConfig
    extends WebSocketsChannelConfig<PleromaWebSocketsEvent> {
  PleromaWebSocketsChannelConfig({
    required Uri baseUrl,
    required Map<String, String?> queryArgs,
    required IConnectionService connectionService,
  }) : super(
          baseUrl: baseUrl,
          queryArgs: queryArgs,
          connectionService: connectionService,
        );

  @override
  PleromaWebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaWebSocketsEvent.fromJson(json);
}

@JsonSerializable()
class PleromaWebSocketsEvent extends WebSocketsEvent {
  final String event;

  PleromaWebSocketsEventType get eventType =>
      event.toPleromaWebSocketsEventType();

  /// Could be Status or Notification
  final String? payload;

  PleromaWebSocketsEvent({
    required this.event,
    required this.payload,
  });

  @override
  String toString() {
    return 'PleromaWebSocketsEvent{'
        'event: $event, '
        'payload: $payload'
        '}';
  }

  factory PleromaWebSocketsEvent.fromJson(Map<String, dynamic> json) =>
      _$PleromaWebSocketsEventFromJson(json);

  factory PleromaWebSocketsEvent.fromJsonString(String jsonString) =>
      _$PleromaWebSocketsEventFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaWebSocketsEventToJson(this);

  String toJsonString() => jsonEncode(_$PleromaWebSocketsEventToJson(this));

  PleromaStatus parsePayloadAsStatus() =>
      PleromaStatus.fromJson(jsonDecode(payload!));

  PleromaNotification parsePayloadAsNotification() =>
      PleromaNotification.fromJson(jsonDecode(payload!));

  PleromaChat parsePayloadAsChat() =>
      PleromaChat.fromJson(jsonDecode(payload!));

  PleromaConversation parsePayloadAsConversation() =>
      PleromaConversation.fromJson(jsonDecode(payload!));

  String? parsePayloadAsRemoteId() => payload;
}

enum PleromaWebSocketsEventType {
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

const unknownPleromaWebSocketsEventType = PleromaWebSocketsEventType.unknown;

const _updatePleromaWebSocketsEventTypeJsonValue = "update";
const _notificationPleromaWebSocketsEventTypeJsonValue = "notification";
const _deletePleromaWebSocketsEventTypeJsonValue = "delete";
const _filtersChangedPleromaWebSocketsEventTypeJsonValue = "filters_changed";
const _conversationPleromaWebSocketsEventTypeJsonValue = "conversation";
const _pleromaChatUpdatePleromaWebSocketsEventTypeJsonValue =
    "pleroma:chat_update";
const _unknownPleromaWebSocketsEventTypeJsonValue = "unknown";

extension PleromaWebSocketsEventTypeExtension on PleromaWebSocketsEventType {
  String toJsonValue() {
    String result;

    switch (this) {
      case PleromaWebSocketsEventType.update:
        result = _updatePleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.notification:
        result = _notificationPleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.delete:
        result = _deletePleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.filtersChanged:
        result = _filtersChangedPleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.conversation:
        result = _conversationPleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.pleromaChatUpdate:
        result = _pleromaChatUpdatePleromaWebSocketsEventTypeJsonValue;
        break;
      case PleromaWebSocketsEventType.unknown:
        result = _unknownPleromaWebSocketsEventTypeJsonValue;
        break;
    }

    return result;
  }
}

extension PleromaWebSocketsEventTypeStringExtension on String {
  PleromaWebSocketsEventType toPleromaWebSocketsEventType() {
    PleromaWebSocketsEventType result;

    switch (this) {
      case _updatePleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.update;
        break;
      case _notificationPleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.notification;
        break;
      case _deletePleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.delete;
        break;
      case _filtersChangedPleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.filtersChanged;
        break;
      case _conversationPleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.conversation;
        break;
      case _pleromaChatUpdatePleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.pleromaChatUpdate;
        break;
      case _unknownPleromaWebSocketsEventTypeJsonValue:
        result = PleromaWebSocketsEventType.unknown;
        break;
      // can't parse, default value
      default:
        result = unknownPleromaWebSocketsEventType;
        break;
    }

    return result;
  }
}

class PleromaWebSocketsEventTypeTypeConverter
    implements JsonConverter<PleromaWebSocketsEventType, String> {
  const PleromaWebSocketsEventTypeTypeConverter();

  @override
  PleromaWebSocketsEventType fromJson(String value) =>
      value.toPleromaWebSocketsEventType();

  @override
  String toJson(PleromaWebSocketsEventType value) => value.toJsonValue();
}
