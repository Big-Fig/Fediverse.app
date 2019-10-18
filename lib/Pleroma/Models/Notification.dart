// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

import 'package:phaze/Pleroma/Models/Account.dart';
import 'package:phaze/Pleroma/Models/Status.dart';

List<Notification> notificationFromJson(String str) => List<Notification>.from(json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
    Account account;
    DateTime createdAt;
    String id;
    String type;
    Status status;

    Notification({
        this.account,
        this.createdAt,
        this.id,
        this.type,
        this.status,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        account: Account.fromJson(json["account"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        type: json["type"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "account": account.toJson(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "type": type,
        "status": status == null ? null : status.toJson(),
    };
}


