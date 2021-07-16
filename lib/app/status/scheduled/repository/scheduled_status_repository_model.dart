import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class ScheduledStatusRepositoryFilters {
  final bool? excludeCanceled;
  final bool? excludeScheduleAtExpired;

  static const ScheduledStatusRepositoryFilters empty =
      ScheduledStatusRepositoryFilters();

  const ScheduledStatusRepositoryFilters({
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

class ScheduledStatusRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final ScheduledStatusRepositoryOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const ScheduledStatusRepositoryOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const ScheduledStatusRepositoryOrderingTermData remoteIdDesc =
      ScheduledStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ScheduledStatusRepositoryOrderType.remoteId,
  );
  static const ScheduledStatusRepositoryOrderingTermData remoteIdAsc =
      ScheduledStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ScheduledStatusRepositoryOrderType.remoteId,
  );

  static const List<ScheduledStatusRepositoryOrderingTermData> defaultTerms = [
    remoteIdDesc,
  ];

  @override
  String toString() {
    return 'ScheduledStatusRepositoryOrderingTermData{'
        'orderByType: $orderType, orderingMode: $orderingMode'
        '}';
  }
}
