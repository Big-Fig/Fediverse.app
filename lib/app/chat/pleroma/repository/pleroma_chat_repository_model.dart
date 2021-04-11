import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class PleromaChatRepositoryFilters {
  static const PleromaChatRepositoryFilters empty =
      PleromaChatRepositoryFilters();

  final bool withLastMessage;

  const PleromaChatRepositoryFilters({
    this.withLastMessage = false,
  });

  PleromaChatRepositoryFilters copyWith({
    bool? withLastMessage,
  }) {
    return PleromaChatRepositoryFilters(
      withLastMessage: withLastMessage ?? this.withLastMessage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaChatRepositoryFilters &&
          runtimeType == other.runtimeType &&
          withLastMessage == other.withLastMessage;

  @override
  int get hashCode => withLastMessage.hashCode;

  @override
  String toString() {
    return 'PleromaChatRepositoryFilters{withLastMessage: $withLastMessage}';
  }
}

enum PleromaChatOrderType {
  remoteId,
  updatedAt,
}

class PleromaChatRepositoryOrderingTermData extends RepositoryOrderingTerm {
  final PleromaChatOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const PleromaChatRepositoryOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const PleromaChatRepositoryOrderingTermData remoteIdDesc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatOrderType.remoteId,
  );
  static const PleromaChatRepositoryOrderingTermData remoteIdAsc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatOrderType.remoteId,
  );

  static const PleromaChatRepositoryOrderingTermData updatedAtDesc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: PleromaChatOrderType.updatedAt,
  );
  static const PleromaChatRepositoryOrderingTermData updatedAtAsc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: PleromaChatOrderType.updatedAt,
  );

  static const List<PleromaChatRepositoryOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];

  @override
  String toString() {
    return 'ChatOrderingTermData{'
        'orderByType: $orderType, '
        'orderingMode: $orderingMode'
        '}';
  }
}
