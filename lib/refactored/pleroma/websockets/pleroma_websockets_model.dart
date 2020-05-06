import 'dart:convert';

import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/websockets/websockets_channel_model.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_websockets_model.g.dart';

class PleromaWebSocketsChannelConfig
    extends WebSocketsChannelConfig<PleromaWebSocketsEvent> {
  PleromaWebSocketsChannelConfig(
      {@required Uri baseUrl, @required Map<String, String> queryArgs})
      : super(baseUrl: baseUrl, queryArgs: queryArgs);

  @override
  PleromaWebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaWebSocketsEvent.fromJson(json);
}

@JsonSerializable()
class PleromaWebSocketsEvent extends WebSocketsEvent {
  final String event;

  PleromaWebSocketsEventType get eventType =>
      pleromaWebSocketsEventTypeValues.map[event];

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
}

final pleromaWebSocketsEventTypeValues = EnumValues({
  "update": PleromaWebSocketsEventType.update,
  "notification": PleromaWebSocketsEventType.notification,
  "delete": PleromaWebSocketsEventType.delete,
  "filters_changed": PleromaWebSocketsEventType.filtersChanged,
  "conversation": PleromaWebSocketsEventType.conversation,
});
