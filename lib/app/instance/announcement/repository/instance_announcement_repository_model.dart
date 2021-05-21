import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class InstanceAnnouncementRepositoryFilters {
  final bool? notDismissed;

  static const InstanceAnnouncementRepositoryFilters empty =
      InstanceAnnouncementRepositoryFilters();

  const InstanceAnnouncementRepositoryFilters({
    this.notDismissed,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstanceAnnouncementRepositoryFilters &&
          runtimeType == other.runtimeType &&
          notDismissed == other.notDismissed;

  @override
  int get hashCode => notDismissed.hashCode;

  @override
  String toString() => 'InstanceAnnouncementRepositoryFilters{'
      'notDismissed: $notDismissed'
      '}';
}

enum InstanceAnnouncementOrderType {
  remoteId,
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

  const InstanceAnnouncementOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const List<InstanceAnnouncementOrderingTermData> defaultTerms = [
    remoteIdDesc,
  ];

  @override
  String toString() {
    return 'InstanceAnnouncementOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
