import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'unifedi_chat_repository_model.freezed.dart';

@freezed
class UnifediChatRepositoryFilters with _$UnifediChatRepositoryFilters {
  static const UnifediChatRepositoryFilters empty =
      UnifediChatRepositoryFilters();

  const UnifediChatRepositoryFilters._();

  const factory UnifediChatRepositoryFilters({
    @Default(false) bool withLastMessage,
  }) = _UnifediChatRepositoryFilters;
}

enum UnifediChatOrderType {
  remoteId,
  updatedAt,
}

@freezed
class UnifediChatRepositoryOrderingTermData
    with _$UnifediChatRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const UnifediChatRepositoryOrderingTermData._();

  const factory UnifediChatRepositoryOrderingTermData({
    required UnifediChatOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _UnifediChatRepositoryOrderingTermData;

  static const UnifediChatRepositoryOrderingTermData remoteIdDesc =
      UnifediChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: UnifediChatOrderType.remoteId,
  );
  static const UnifediChatRepositoryOrderingTermData remoteIdAsc =
      UnifediChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: UnifediChatOrderType.remoteId,
  );

  static const UnifediChatRepositoryOrderingTermData updatedAtDesc =
      UnifediChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: UnifediChatOrderType.updatedAt,
  );
  static const UnifediChatRepositoryOrderingTermData updatedAtAsc =
      UnifediChatRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: UnifediChatOrderType.updatedAt,
  );

  static const List<UnifediChatRepositoryOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];
}
