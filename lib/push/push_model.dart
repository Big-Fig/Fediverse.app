import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_model.g.dart';

typedef dynamic PushMessageListener(PushMessage message);

class PushMessage {
  final PushMessageType type;
  final PushNotification notification;
  final Map<String, dynamic> data;

  PushMessage(
      {@required this.type, @required this.notification, @required this.data});

  @override
  String toString() {
    return 'PushMessage{type: $type,'
        ' notification: $notification,'
        ' data: $data}';
  }
}

enum PushMessageType { foreground, launch, resume }

@JsonSerializable()
class PushNotification {
  final String title;
  final String body;

  PushNotification(this.title, this.body);

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  factory PushNotification.fromJson(Map<dynamic, dynamic> json) =>
      _$PushNotificationFromJson(json);
}
