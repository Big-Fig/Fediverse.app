import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_model.g.dart';

typedef dynamic PushMessageListener(PushMessage message);

@HiveType()
class PushMessage {
  @HiveField(0)
  PushMessageType type;
  @HiveField(1)
  PushNotification notification;
  @HiveField(2)
  Map<String, dynamic> data;

  bool get isLaunchOrResume =>
      type == PushMessageType.launch || type == PushMessageType.resume;

  PushMessage({this.type, this.notification, this.data});

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
