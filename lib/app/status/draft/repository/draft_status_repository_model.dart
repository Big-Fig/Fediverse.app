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

class DraftStatusRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final DraftStatusRepositoryOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const DraftStatusRepositoryOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const DraftStatusRepositoryOrderingTermData localIdDesc =
      DraftStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: DraftStatusRepositoryOrderType.localId,
  );
  static const DraftStatusRepositoryOrderingTermData localIdAsc =
      DraftStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: DraftStatusRepositoryOrderType.localId,
  );
  static const DraftStatusRepositoryOrderingTermData updatedAtDesc =
      DraftStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: DraftStatusRepositoryOrderType.updatedAt,
  );
  static const DraftStatusRepositoryOrderingTermData updatedAtAsc =
      DraftStatusRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: DraftStatusRepositoryOrderType.updatedAt,
  );

  static const List<DraftStatusRepositoryOrderingTermData> defaultTerms = [
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
