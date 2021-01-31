import 'package:moor/moor.dart';

class ScheduledStatusRepositoryFilters {}

enum DraftStatusRepositoryOrderType {
  localId,
  updatedAt,
}

class DraftStatusOrderingTermData {
  final DraftStatusRepositoryOrderType orderType;
  final OrderingMode orderingMode;

  const DraftStatusOrderingTermData({
    @required this.orderType,
    @required this.orderingMode,
  });

  static const DraftStatusOrderingTermData localIdDesc =
      DraftStatusOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: DraftStatusRepositoryOrderType.localId,
  );
  static const DraftStatusOrderingTermData localIdAsc =
      DraftStatusOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: DraftStatusRepositoryOrderType.localId,
  );
  static const DraftStatusOrderingTermData updatedAtDesc =
      DraftStatusOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: DraftStatusRepositoryOrderType.updatedAt,
  );
  static const DraftStatusOrderingTermData updatedAtAsc =
      DraftStatusOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: DraftStatusRepositoryOrderType.updatedAt,
  );

  @override
  String toString() {
    return 'DraftStatusOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
