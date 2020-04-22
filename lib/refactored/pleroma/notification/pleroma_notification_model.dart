import 'dart:convert';

import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_notification_model.g.dart';

abstract class IPleromaNotification extends IMastodonNotification {
  IPleromaAccount get account;

  IPleromaStatus get status;
}

@JsonSerializable()
@MastodonMediaNotificationTypeTypeConverter()
class PleromaNotification extends IPleromaNotification {
  PleromaAccount account;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  String id;
  MastodonNotificationType type;
  PleromaStatus status;

  PleromaNotification({
    this.account,
    this.createdAt,
    this.id,
    this.type,
    this.status,
  });

  factory PleromaNotification.fromJson(Map<String, dynamic> json) =>
      _$PleromaNotificationFromJson(json);

  factory PleromaNotification.fromJsonString(String jsonString) =>
      _$PleromaNotificationFromJson(jsonDecode(jsonString));

  static List<PleromaNotification> listFromJsonString(String str) =>
      new List<PleromaNotification>.from(
          json.decode(str).map((x) => PleromaNotification.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaNotificationToJson(this);
  String toJsonString() => jsonEncode(_$PleromaNotificationToJson(this));

  @override
  String toString() {
    return 'PleromaNotification{account: $account, createdAt: $createdAt, id: $id,'
        ' type: $type, status: $status}';
  }
}
