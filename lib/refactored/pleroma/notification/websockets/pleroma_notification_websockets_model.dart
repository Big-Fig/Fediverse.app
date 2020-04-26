import 'dart:convert';

import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:fedi/refactored/websockets/websockets_channel_model.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_notification_websockets_model.g.dart';

class PleromaNotificationWebSocketsChannelConfig
    extends WebSocketsChannelConfig<PleromaNotificationWebSocketsEvent> {
  PleromaNotificationWebSocketsChannelConfig(
      {@required Uri baseUrl, @required Map<String, String> queryArgs})
      : super(baseUrl: baseUrl, queryArgs: queryArgs);

  @override
  PleromaNotificationWebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaNotificationWebSocketsEvent.fromJson(json);
}

@JsonSerializable()
class PleromaNotificationWebSocketsEvent extends WebSocketsEvent {
  final String event;

  PleromaNotificationWebSocketsEventType get eventType =>
      pleromaNotificationWebSocketsEventTypeValues.map[event];

  /// Could be Status or Notification
  final String payload;

  PleromaNotificationWebSocketsEvent(
      {@required this.event, @required this.payload});

  @override
  String toString() {
    return 'PleromaNotificationWebSocketsEvent{event: $event, payload: $payload}';
  }

  factory PleromaNotificationWebSocketsEvent.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaNotificationWebSocketsEventFromJson(json);

  factory PleromaNotificationWebSocketsEvent.fromJsonString(
          String jsonString) =>
      _$PleromaNotificationWebSocketsEventFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaNotificationWebSocketsEventToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaNotificationWebSocketsEventToJson(this));
}

enum PleromaNotificationWebSocketsEventType {
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

final pleromaNotificationWebSocketsEventTypeValues = new EnumValues({
  "update": PleromaNotificationWebSocketsEventType.update,
  "notification": PleromaNotificationWebSocketsEventType.notification,
  "delete": PleromaNotificationWebSocketsEventType.delete,
  "filters_changed": PleromaNotificationWebSocketsEventType.filtersChanged,
  "conversation": PleromaNotificationWebSocketsEventType.conversation,
});
