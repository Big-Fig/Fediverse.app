import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'pleroma_chat_repository_model.freezed.dart';

@freezed
class PleromaChatRepositoryFilters with _$PleromaChatRepositoryFilters {
  static const PleromaChatRepositoryFilters empty =
      PleromaChatRepositoryFilters();

  const PleromaChatRepositoryFilters._();

  const factory PleromaChatRepositoryFilters({
    @Default(false) bool withLastMessage,
  }) = _PleromaChatRepositoryFilters;
}

enum PleromaChatOrderType {
  remoteId,
  updatedAt,
}

@freezed
class PleromaChatRepositoryOrderingTermData
    with _$PleromaChatRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const PleromaChatRepositoryOrderingTermData._();

  const factory PleromaChatRepositoryOrderingTermData({
    required PleromaChatOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _PleromaChatRepositoryOrderingTermData;

  static const PleromaChatRepositoryOrderingTermData remoteIdDesc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: PleromaChatOrderType.remoteId,
  );
  static const PleromaChatRepositoryOrderingTermData remoteIdAsc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: PleromaChatOrderType.remoteId,
  );

  static const PleromaChatRepositoryOrderingTermData updatedAtDesc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: PleromaChatOrderType.updatedAt,
  );
  static const PleromaChatRepositoryOrderingTermData updatedAtAsc =
      PleromaChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: PleromaChatOrderType.updatedAt,
  );

  static const List<PleromaChatRepositoryOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];
}
