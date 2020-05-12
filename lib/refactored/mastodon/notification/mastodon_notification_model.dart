import 'dart:convert';

import 'package:fedi/refactored/enum/enum_values.dart';
import 'package:fedi/refactored/mastodon/account/mastodon_account_model.dart';
import 'package:fedi/refactored/mastodon/status/mastodon_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_notification_model.g.dart';

abstract class IMastodonNotification {
  IMastodonAccount get account;

  DateTime get createdAt;

  String get id;

  String get type;

  MastodonNotificationType get typeMastodon;

  IMastodonStatus get status;
}

enum MastodonNotificationType {
  follow,
  favourite,
  reblog,
  mention,
  poll,
  move,
  followRequest,
}

final mastodonNotificationTypeValues = EnumValues({
  "follow": MastodonNotificationType.follow,
  "favourite": MastodonNotificationType.favourite,
  "reblog": MastodonNotificationType.reblog,
  "mention": MastodonNotificationType.mention,
  "poll": MastodonNotificationType.poll,
  "move": MastodonNotificationType.move,
  "follow_request": MastodonNotificationType.followRequest,
});

@JsonSerializable()
class MastodonNotificationsRequest {
  @JsonKey(name: "max_id")
  final String maxId;
  @JsonKey(name: "since_id")
  final String sinceId;
  @JsonKey(name: "min_id")
  final String minId;
  final int limit;
  @JsonKey(name: "exclude_types[]")
  final List<String> excludeTypes;
  @JsonKey(name: "account_id")
  final String accountId;
  MastodonNotificationsRequest(
      {this.maxId,
      this.sinceId,
      this.minId,
      this.limit,
      this.excludeTypes,
      this.accountId});

  @override
  String toString() {
    return 'MastodonNotificationsRequest{maxId: $maxId, sinceId: $sinceId,'
        ' minId: $minId, limit: $limit,'
        ' excludeTypes: $excludeTypes, accountId: $accountId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonNotificationsRequest &&
          runtimeType == other.runtimeType &&
          maxId == other.maxId &&
          sinceId == other.sinceId &&
          minId == other.minId &&
          limit == other.limit &&
          excludeTypes == other.excludeTypes &&
          accountId == other.accountId;
  @override
  int get hashCode =>
      maxId.hashCode ^
      sinceId.hashCode ^
      minId.hashCode ^
      limit.hashCode ^
      excludeTypes.hashCode ^
      accountId.hashCode;

  factory MastodonNotificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$MastodonNotificationsRequestFromJson(json);

  factory MastodonNotificationsRequest.fromJsonString(String jsonString) =>
      _$MastodonNotificationsRequestFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MastodonNotificationsRequestToJson(this);

  String toJsonString() =>
      jsonEncode(_$MastodonNotificationsRequestToJson(this));
}
