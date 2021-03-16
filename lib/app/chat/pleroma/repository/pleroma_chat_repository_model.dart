import 'package:moor/moor.dart';

class PleromaChatRepositoryFilters {}

enum PleromaChatOrderType {
  remoteId,
  updatedAt,
}

class PleromaChatOrderingTermData {
  final PleromaChatOrderType orderType;
  final OrderingMode orderingMode;

  const PleromaChatOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const PleromaChatOrderingTermData remoteIdDesc =
      PleromaChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatOrderType.remoteId,
  );
  static const PleromaChatOrderingTermData remoteIdAsc =
      PleromaChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatOrderType.remoteId,
  );

  static const PleromaChatOrderingTermData updatedAtDesc =
      PleromaChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatOrderType.updatedAt,
  );
  static const PleromaChatOrderingTermData updatedAtAsc =
      PleromaChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatOrderType.updatedAt,
  );

  @override
  String toString() {
    return 'ChatOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
