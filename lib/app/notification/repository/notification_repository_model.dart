import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class NotificationRepositoryFilters {
  final PleromaApiNotificationType? onlyWithType;
  final List<PleromaApiNotificationType>? excludeTypes;
  final bool onlyNotDismissed;
  final bool? onlyUnread;
  final List<StatusTextCondition>? excludeStatusTextConditions;

  static final NotificationRepositoryFilters empty =
      NotificationRepositoryFilters();

  NotificationRepositoryFilters({
    this.onlyWithType,
    this.excludeTypes,
    this.onlyNotDismissed = true,
    this.onlyUnread,
    this.excludeStatusTextConditions,
  }) : assert(!(onlyWithType != null && excludeTypes?.isNotEmpty == true),
            'onlyWithType and excludeTypes can be set both');

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

class NotificationRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final NotificationOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const NotificationRepositoryOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const NotificationRepositoryOrderingTermData remoteIdDesc =
      NotificationRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: NotificationOrderType.remoteId,
  );
  static const NotificationRepositoryOrderingTermData remoteIdAsc =
      NotificationRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: NotificationOrderType.remoteId,
  );

  static const NotificationRepositoryOrderingTermData createdAtDesc =
      NotificationRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: NotificationOrderType.createdAt,
  );
  static const NotificationRepositoryOrderingTermData createdAtAsc =
      NotificationRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: NotificationOrderType.createdAt,
  );

  static const List<NotificationRepositoryOrderingTermData> defaultTerms = [
    createdAtDesc,
  ];

  @override
  String toString() {
    return 'NotificationRepositoryOrderingTermData{'
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
