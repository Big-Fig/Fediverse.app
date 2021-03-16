import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:moor/moor.dart';

class NotificationRepositoryFilters {
  final PleromaNotificationType? onlyWithType;
  final List<PleromaNotificationType>? excludeTypes;
  final bool onlyNotDismissed;
  final bool? onlyUnread;
  final List<StatusTextCondition>? excludeStatusTextConditions;

  NotificationRepositoryFilters({
    this.onlyWithType,
    this.excludeTypes,
    this.onlyNotDismissed = true,
    this.onlyUnread,
    this.excludeStatusTextConditions,
  }) {
    assert(!(onlyWithType != null && excludeTypes?.isNotEmpty == true),
        "onlyWithType and excludeTypes can be set both");
  }

  @override
  String toString() {
    return 'NotificationRepositoryFilters{'
        'onlyWithType: $onlyWithType, '
        'excludeTypes: $excludeTypes, '
        'onlyNotDismissed: $onlyNotDismissed, '
        'onlyUnread: $onlyUnread, '
        'excludeStatusTextConditions: $excludeStatusTextConditions'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationRepositoryFilters &&
          runtimeType == other.runtimeType &&
          onlyWithType == other.onlyWithType &&
          excludeTypes == other.excludeTypes &&
          onlyUnread == other.onlyUnread &&
          onlyNotDismissed == other.onlyNotDismissed &&
          excludeStatusTextConditions == other.excludeStatusTextConditions;

  @override
  int get hashCode =>
      onlyWithType.hashCode ^
      excludeTypes.hashCode ^
      onlyNotDismissed.hashCode ^
      onlyUnread.hashCode ^
      excludeStatusTextConditions.hashCode;
}

enum NotificationOrderType {
  remoteId,
  createdAt,
}

class NotificationOrderingTermData {
  final NotificationOrderType orderType;
  final OrderingMode orderingMode;

  const NotificationOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const NotificationOrderingTermData remoteIdDesc =
      NotificationOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: NotificationOrderType.remoteId,
  );
  static const NotificationOrderingTermData remoteIdAsc =
      NotificationOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: NotificationOrderType.remoteId,
  );

  static const NotificationOrderingTermData createdAtDesc =
      NotificationOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: NotificationOrderType.createdAt,
  );
  static const NotificationOrderingTermData createdAtAsc =
      NotificationOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: NotificationOrderType.createdAt,
  );

  @override
  String toString() {
    return 'NotificationOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode}';
  }
}

class OnlyLocalNotificationFilter {
  final String localUrlHost;

  OnlyLocalNotificationFilter(this.localUrlHost);

  @override
  String toString() {
    return 'OnlyLocalNotificationFilter{localUrlHost: $localUrlHost}';
  }
}
