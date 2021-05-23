import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class InstanceAnnouncementRepositoryFilters {
  final bool? withDismissed;
  final bool? withExpired;
  final bool? withNotStartedYet;

  static const InstanceAnnouncementRepositoryFilters empty =
      InstanceAnnouncementRepositoryFilters();

  const InstanceAnnouncementRepositoryFilters({
    this.withDismissed,
    this.withExpired,
    this.withNotStartedYet,
  });

  @override
  String toString() => 'InstanceAnnouncementRepositoryFilters{'
      'withDismissed: $withDismissed, '
      'withExpired: $withExpired, '
      'withNotStartedYet: $withNotStartedYet'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceAnnouncementRepositoryFilters &&
          runtimeType == other.runtimeType &&
          withDismissed == other.withDismissed &&
          withExpired == other.withExpired &&
          withNotStartedYet == other.withNotStartedYet;

  @override
  int get hashCode =>
      withDismissed.hashCode ^
      withExpired.hashCode ^
      withNotStartedYet.hashCode;
}

enum InstanceAnnouncementOrderType {
  remoteId,
  updatedAt,
}

class InstanceAnnouncementOrderingTermData extends RepositoryOrderingTerm {
  final InstanceAnnouncementOrderType orderType;
  @override
  final OrderingMode orderingMode;

  static const InstanceAnnouncementOrderingTermData remoteIdDesc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: InstanceAnnouncementOrderType.remoteId,
  );
  static const InstanceAnnouncementOrderingTermData remoteIdAsc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: InstanceAnnouncementOrderType.remoteId,
  );
  static const InstanceAnnouncementOrderingTermData updatedAtDesc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: InstanceAnnouncementOrderType.updatedAt,
  );
  static const InstanceAnnouncementOrderingTermData updatedAtAsc =
      InstanceAnnouncementOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: InstanceAnnouncementOrderType.updatedAt,
  );

  const InstanceAnnouncementOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const List<InstanceAnnouncementOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];

  @override
  String toString() {
    return 'InstanceAnnouncementOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
