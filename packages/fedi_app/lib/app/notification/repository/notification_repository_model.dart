import 'package:fedi_app/app/status/repository/status_repository_model.dart';
import 'package:fedi_app/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;
import 'package:unifedi_api/unifedi_api.dart';

part 'notification_repository_model.freezed.dart';

@freezed
class NotificationRepositoryFilters with _$NotificationRepositoryFilters {
  static final NotificationRepositoryFilters empty =
      NotificationRepositoryFilters.only();

  const NotificationRepositoryFilters._();

  const factory NotificationRepositoryFilters({
    required UnifediApiNotificationType? onlyWithType,
    required List<UnifediApiNotificationType>? excludeTypes,
    @Default(true) bool onlyNotDismissed,
    required bool? onlyUnread,
    required List<StatusTextCondition>? excludeStatusTextConditions,
  }) = _NotificationRepositoryFilters;

  static NotificationRepositoryFilters only({
    UnifediApiNotificationType? onlyWithType,
    List<UnifediApiNotificationType>? excludeTypes,
    bool onlyNotDismissed = true,
    bool? onlyUnread,
    List<StatusTextCondition>? excludeStatusTextConditions,
  }) =>
      NotificationRepositoryFilters(
        onlyWithType: onlyWithType,
        excludeTypes: excludeTypes,
        onlyUnread: onlyUnread,
        excludeStatusTextConditions: excludeStatusTextConditions,
      );
}

enum NotificationOrderType {
  remoteId,
  createdAt,
}

@freezed
class NotificationRepositoryOrderingTermData
    with _$NotificationRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const NotificationRepositoryOrderingTermData._();

  const factory NotificationRepositoryOrderingTermData({
    required NotificationOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _NotificationRepositoryOrderingTermData;

  static const NotificationRepositoryOrderingTermData remoteIdDesc =
      NotificationRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: NotificationOrderType.remoteId,
  );
  static const NotificationRepositoryOrderingTermData remoteIdAsc =
      NotificationRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: NotificationOrderType.remoteId,
  );

  static const NotificationRepositoryOrderingTermData createdAtDesc =
      NotificationRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: NotificationOrderType.createdAt,
  );
  static const NotificationRepositoryOrderingTermData createdAtAsc =
      NotificationRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: NotificationOrderType.createdAt,
  );

  static const List<NotificationRepositoryOrderingTermData> defaultTerms = [
    createdAtDesc,
  ];
}

@freezed
class OnlyLocalNotificationFilter with _$OnlyLocalNotificationFilter {
  const factory OnlyLocalNotificationFilter({
    required String localUrlHost,
  }) = _OnlyLocalNotificationFilter;
}
