import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/enum/enum_values.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_web_sockets_model.g.dart';

class PleromaWebSocketsChannelConfig
    extends WebSocketsChannelConfig<PleromaWebSocketsEvent> {
  PleromaWebSocketsChannelConfig({
    @required Uri baseUrl,
    @required Map<String, String> queryArgs,
    @required IConnectionService connectionService,
  }) : super(
            baseUrl: baseUrl,
            queryArgs: queryArgs,
            connectionService: connectionService);

  @override
  PleromaWebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaWebSocketsEvent.fromJson(json);
}

@JsonSerializable()
class PleromaWebSocketsEvent extends WebSocketsEvent {
  final String event;

  PleromaWebSocketsEventType get eventType =>
      pleromaWebSocketsEventTypeValues.valueToEnumMap[event];

  /// Could be Status or Notification
  final String payload;

  PleromaWebSocketsEvent({@required this.event, @required this.payload});

  @override
  String toString() {
    return 'PleromaWebSocketsEvent{event: $event, payload: $payload}';
  }

  factory PleromaWebSocketsEvent.fromJson(Map<String, dynamic> json) =>
      _$PleromaWebSocketsEventFromJson(json);

  factory PleromaWebSocketsEvent.fromJsonString(String jsonString) =>
      _$PleromaWebSocketsEventFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaWebSocketsEventToJson(this);

  String toJsonString() => jsonEncode(_$PleromaWebSocketsEventToJson(this));

  PleromaStatus parsePayloadAsStatus() =>
      PleromaStatus.fromJson(jsonDecode(payload));

  PleromaNotification parsePayloadAsNotification() =>
      PleromaNotification.fromJson(jsonDecode(payload));

  PleromaChat parsePayloadAsChat() => PleromaChat.fromJson(jsonDecode(payload));

  PleromaConversation parsePayloadAsConversation() =>
      PleromaConversation.fromJson(jsonDecode(payload));

  String parsePayloadAsRemoteId() => payload;
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
}

final pleromaWebSocketsEventTypeValues = EnumValues({
  "update": PleromaWebSocketsEventType.update,
  "notification": PleromaWebSocketsEventType.notification,
  "delete": PleromaWebSocketsEventType.delete,
  "filters_changed": PleromaWebSocketsEventType.filtersChanged,
  "conversation": PleromaWebSocketsEventType.conversation,
  "pleroma:chat_update": PleromaWebSocketsEventType.pleromaChatUpdate,
});
