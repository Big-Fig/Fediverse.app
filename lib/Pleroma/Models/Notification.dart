// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Notification.g.dart';

@JsonSerializable()
class Notification {
    PleromaAccount account;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    String id;
    String type;
    PleromaStatus status;

    Notification({
        this.account,
        this.createdAt,
        this.id,
        this.type,
        this.status,
    });

    factory Notification.fromJson(Map<String, dynamic> json) =>
        _$NotificationFromJson(json);

    factory Notification.fromJsonString(String jsonString) =>
        _$NotificationFromJson(jsonDecode(jsonString));

    static List<Notification> listFromJsonString(String str) =>
        new List<Notification>.from(json.decode(str).map((x) => Notification.fromJson(x)));


    Map<String, dynamic> toJson() => _$NotificationToJson(this);
    String toJsonString() => jsonEncode(_$NotificationToJson(this));

}


