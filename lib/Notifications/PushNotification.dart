// To parse this JSON data, do
//
//     final conversation = conversationFromJson(jsonString);

import 'dart:convert';

List<PushNotification> pushNotificationFromJson(String str) =>
    new List<PushNotification>.from(
        json.decode(str).map((x) => PushNotification.fromJson(x)));

String pushNotificationToJson(List<PushNotification> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class PushNotification {
  String notificationType;
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

  factory PushNotification.fromJson(Map<String, dynamic> json) => new PushNotification(
        notificationType: json["notification_type"],
        notificationId: json["notification_id"],
        server: json["server"],
        account: json["account"],
      );

  Map<String, dynamic> toJson() => {
        "notification_type": notificationType,
        "notification_id": notificationId,
        "account": account,
        "server": server,
      };
}
