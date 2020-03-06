import 'dart:convert';

import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_notifications_websockets_model.g.dart';

@JsonSerializable()
class PleromaNotificationsWebSocketsEvent {
  final String event;

  PleromaNotificationsWebSocketsEventType get eventType =>
      pleromaNotificationsWebSocketsEventTypeValues.map[event];
  /// Could be Status or Notification
  final String payload;

  PleromaNotificationsWebSocketsEvent(
      {@required this.event, @required this.payload});

  @override
  String toString() {
    return 'PleromaNotificationsWebSocketsEvent{event: $event, payload: $payload}';
  }

  factory PleromaNotificationsWebSocketsEvent.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaNotificationsWebSocketsEventFromJson(json);

  factory PleromaNotificationsWebSocketsEvent.fromJsonString(
          String jsonString) =>
      _$PleromaNotificationsWebSocketsEventFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() =>
      _$PleromaNotificationsWebSocketsEventToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaNotificationsWebSocketsEventToJson(this));
}

enum PleromaNotificationsWebSocketsEventType {
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

final pleromaNotificationsWebSocketsEventTypeValues = new EnumValues({
  "update": PleromaNotificationsWebSocketsEventType.update,
  "notification": PleromaNotificationsWebSocketsEventType.notification,
  "delete": PleromaNotificationsWebSocketsEventType.delete,
  "filters_changed": PleromaNotificationsWebSocketsEventType.filtersChanged,
  "conversation": PleromaNotificationsWebSocketsEventType.conversation,
});
