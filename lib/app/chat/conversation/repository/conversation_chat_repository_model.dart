import 'package:fedi/repository/repository_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moor/moor.dart' as moor;

part 'conversation_chat_repository_model.freezed.dart';

@freezed
class ConversationChatRepositoryFilters
    with _$ConversationChatRepositoryFilters {
  static const ConversationChatRepositoryFilters empty =
      ConversationChatRepositoryFilters();

  const ConversationChatRepositoryFilters._();
  const factory ConversationChatRepositoryFilters({
    @Default(false) bool withLastMessage,
  }) = _ConversationChatRepositoryFilters;
}

enum ConversationChatOrderType {
  remoteId,
  updatedAt,
}

@freezed
class ConversationRepositoryChatOrderingTermData
    with _$ConversationRepositoryChatOrderingTermData
    implements RepositoryOrderingTerm {
  const factory ConversationRepositoryChatOrderingTermData({
    required ConversationChatOrderType orderType,
    required moor.OrderingMode orderingMode,
  }) = _ConversationRepositoryChatOrderingTermData;

  static const ConversationRepositoryChatOrderingTermData remoteIdDesc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: ConversationChatOrderType.remoteId,
  );
  static const ConversationRepositoryChatOrderingTermData remoteIdAsc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: ConversationChatOrderType.remoteId,
  );

  static const ConversationRepositoryChatOrderingTermData updatedAtDesc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: moor.OrderingMode.desc,
    orderType: ConversationChatOrderType.updatedAt,
  );
  static const ConversationRepositoryChatOrderingTermData updatedAtAsc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: moor.OrderingMode.asc,
    orderType: ConversationChatOrderType.updatedAt,
  );

  static const List<ConversationRepositoryChatOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];
}
