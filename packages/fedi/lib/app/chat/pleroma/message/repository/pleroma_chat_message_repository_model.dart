import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'pleroma_chat_message_repository_model.freezed.dart';

@freezed
class PleromaChatMessageRepositoryFilters
    with _$PleromaChatMessageRepositoryFilters {
  static final PleromaChatMessageRepositoryFilters empty =
      PleromaChatMessageRepositoryFilters.only(
    onlyPendingStatePublishedOrNull: false,
    onlyNotDeleted: false,
    onlyNotHiddenLocallyOnDevice: false,
  );

  const PleromaChatMessageRepositoryFilters._();

  const factory PleromaChatMessageRepositoryFilters({
    required List<IPleromaChat>? onlyInChats,
    required bool onlyPendingStatePublishedOrNull,
    required bool onlyNotDeleted,
    required bool onlyNotHiddenLocallyOnDevice,
    @Default(false) bool groupByChatId,
  }) = _PleromaChatMessageRepositoryFilters;

  static PleromaChatMessageRepositoryFilters only({
    List<IPleromaChat>? onlyInChats,
    required bool onlyPendingStatePublishedOrNull,
    required bool onlyNotDeleted,
    required bool onlyNotHiddenLocallyOnDevice,
    bool groupByChatId = false,
  }) =>
      PleromaChatMessageRepositoryFilters(
        onlyInChats: onlyInChats,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        onlyNotDeleted: onlyNotDeleted,
        onlyNotHiddenLocallyOnDevice: onlyNotHiddenLocallyOnDevice,
        groupByChatId: groupByChatId,
      );
}

enum PleromaChatMessageOrderType {
  remoteId,
  createdAt,
}

@freezed
class PleromaChatMessageRepositoryOrderingTermData
    with _$PleromaChatMessageRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const PleromaChatMessageRepositoryOrderingTermData._();
  const factory PleromaChatMessageRepositoryOrderingTermData({
    required PleromaChatMessageOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _PleromaChatMessageRepositoryOrderingTermData;

  static const PleromaChatMessageRepositoryOrderingTermData remoteIdDesc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );
  static const PleromaChatMessageRepositoryOrderingTermData remoteIdAsc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.remoteId,
  );

  static const PleromaChatMessageRepositoryOrderingTermData createdAtDesc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );
  static const PleromaChatMessageRepositoryOrderingTermData createdAtAsc =
      PleromaChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: PleromaChatMessageOrderType.createdAt,
  );

  static const List<PleromaChatMessageRepositoryOrderingTermData> defaultTerms =
      [
    createdAtDesc,
  ];
}
