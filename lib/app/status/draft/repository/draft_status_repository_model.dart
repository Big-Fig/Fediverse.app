import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class DraftStatusRepositoryFilters {
  static const DraftStatusRepositoryFilters empty =
      DraftStatusRepositoryFilters();

  const DraftStatusRepositoryFilters();
}

enum DraftStatusRepositoryOrderType {
  localId,
  updatedAt,
}

class DraftStatusOrderingTermData extends RepositoryOrderingTerm {
  final DraftStatusRepositoryOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const DraftStatusOrderingTermData({
    required this.orderType,
    required this.orderingMode,
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

  static const List<DraftStatusOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];

  @override
  String toString() {
    return 'DraftStatusOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
