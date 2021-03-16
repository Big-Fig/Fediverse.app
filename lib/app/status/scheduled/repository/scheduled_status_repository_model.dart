import 'package:moor/moor.dart';

class ScheduledStatusRepositoryFilters {
  final bool? excludeCanceled;
  final bool? excludeScheduleAtExpired;

  ScheduledStatusRepositoryFilters({
    this.excludeCanceled,
    this.excludeScheduleAtExpired,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledStatusRepositoryFilters &&
          runtimeType == other.runtimeType &&
          excludeCanceled == other.excludeCanceled &&
          excludeScheduleAtExpired == other.excludeScheduleAtExpired;

  @override
  int get hashCode =>
      excludeCanceled.hashCode ^ excludeScheduleAtExpired.hashCode;

  @override
  String toString() {
    return 'ScheduledStatusRepositoryFilters{'
        'excludeCanceled: $excludeCanceled, '
        'excludeScheduleAtExpired: $excludeScheduleAtExpired'
        '}';
  }
}

enum ScheduledStatusRepositoryOrderType {
  remoteId,
}

class ScheduledStatusOrderingTermData {
  final ScheduledStatusRepositoryOrderType orderType;
  final OrderingMode orderingMode;

  const ScheduledStatusOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const ScheduledStatusOrderingTermData remoteIdDesc =
      ScheduledStatusOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ScheduledStatusRepositoryOrderType.remoteId,
  );
  static const ScheduledStatusOrderingTermData remoteIdAsc =
      ScheduledStatusOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ScheduledStatusRepositoryOrderType.remoteId,
  );

  @override
  String toString() {
    return 'ScheduledStatusOrderingTermData{'
        'orderByType: $orderType, orderingMode: $orderingMode'
        '}';
  }
}
