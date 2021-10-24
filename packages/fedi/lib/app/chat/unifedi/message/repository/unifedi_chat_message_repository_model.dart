import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'unifedi_chat_message_repository_model.freezed.dart';

@freezed
class UnifediChatMessageRepositoryFilters
    with _$UnifediChatMessageRepositoryFilters {
  static final UnifediChatMessageRepositoryFilters empty =
      UnifediChatMessageRepositoryFilters.only(
    onlyPendingStatePublishedOrNull: false,
    onlyNotDeleted: false,
    onlyNotHiddenLocallyOnDevice: false,
  );

  const UnifediChatMessageRepositoryFilters._();

  const factory UnifediChatMessageRepositoryFilters({
    required List<IUnifediChat>? onlyInChats,
    required bool onlyPendingStatePublishedOrNull,
    required bool onlyNotDeleted,
    required bool onlyNotHiddenLocallyOnDevice,
    @Default(false) bool groupByChatId,
  }) = _UnifediChatMessageRepositoryFilters;

  static UnifediChatMessageRepositoryFilters only({
    List<IUnifediChat>? onlyInChats,
    required bool onlyPendingStatePublishedOrNull,
    required bool onlyNotDeleted,
    required bool onlyNotHiddenLocallyOnDevice,
    bool groupByChatId = false,
  }) =>
      UnifediChatMessageRepositoryFilters(
        onlyInChats: onlyInChats,
        onlyPendingStatePublishedOrNull: onlyPendingStatePublishedOrNull,
        onlyNotDeleted: onlyNotDeleted,
        onlyNotHiddenLocallyOnDevice: onlyNotHiddenLocallyOnDevice,
        groupByChatId: groupByChatId,
      );
}

enum UnifediChatMessageOrderType {
  remoteId,
  createdAt,
}

@freezed
class UnifediChatMessageRepositoryOrderingTermData
    with _$UnifediChatMessageRepositoryOrderingTermData
    implements RepositoryOrderingTerm {
  const UnifediChatMessageRepositoryOrderingTermData._();
  const factory UnifediChatMessageRepositoryOrderingTermData({
    required UnifediChatMessageOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _UnifediChatMessageRepositoryOrderingTermData;

  static const UnifediChatMessageRepositoryOrderingTermData remoteIdDesc =
      UnifediChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: UnifediChatMessageOrderType.remoteId,
  );
  static const UnifediChatMessageRepositoryOrderingTermData remoteIdAsc =
      UnifediChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: UnifediChatMessageOrderType.remoteId,
  );

  static const UnifediChatMessageRepositoryOrderingTermData createdAtDesc =
      UnifediChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: UnifediChatMessageOrderType.createdAt,
  );
  static const UnifediChatMessageRepositoryOrderingTermData createdAtAsc =
      UnifediChatMessageRepositoryOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: UnifediChatMessageOrderType.createdAt,
  );

  static const List<UnifediChatMessageRepositoryOrderingTermData> defaultTerms =
      [
    createdAtDesc,
  ];
}
