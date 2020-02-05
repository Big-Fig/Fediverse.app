// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'PushNotification.g.dart';

List<PushNotification> pushNotificationFromJson(String str) =>
    new List<PushNotification>.from(
        json.decode(str).map((x) => PushNotification.fromJson(x)));

String pushNotificationToJson(List<PushNotification> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PushNotification {
  @JsonKey(name: "notification_type")
  String notificationType;
  @JsonKey(name: "notification_id")
  int notificationId;
  String server;
  String account;

// {notification_type: favourite, notification_id: 44703, account: barrettbreshears, server: barrett, body: @barrett@barrett.dog has favorited your post, title: New Favorite, click_action: FLUTTER_NOTIFICATION_CLICK}

  PushNotification({
    this.notificationType,
    this.notificationId,
    this.server,
    this.account,
  });

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);
}
