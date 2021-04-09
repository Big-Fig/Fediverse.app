import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class ConversationChatRepositoryFilters {
  static const ConversationChatRepositoryFilters empty =
      ConversationChatRepositoryFilters();

  const ConversationChatRepositoryFilters();
}

enum ConversationChatOrderType {
  remoteId,
  updatedAt,
}

class ConversationRepositoryChatOrderingTermData extends RepositoryOrderingTerm {
  final ConversationChatOrderType orderType;
  @override
  final OrderingMode orderingMode;

  const ConversationRepositoryChatOrderingTermData({
    required this.orderType,
    required this.orderingMode,
  });

  static const ConversationRepositoryChatOrderingTermData remoteIdDesc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ConversationChatOrderType.remoteId,
  );
  static const ConversationRepositoryChatOrderingTermData remoteIdAsc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ConversationChatOrderType.remoteId,
  );

  static const ConversationRepositoryChatOrderingTermData updatedAtDesc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ConversationChatOrderType.updatedAt,
  );
  static const ConversationRepositoryChatOrderingTermData updatedAtAsc =
      ConversationRepositoryChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ConversationChatOrderType.updatedAt,
  );

  static const List<ConversationRepositoryChatOrderingTermData> defaultTerms = [
    updatedAtDesc,
  ];

  @override
  String toString() {
    return 'ConversationRepositoryChatOrderingTermData{'
        'orderByType: $orderType,'
        ' orderingMode: $orderingMode'
        '}';
  }
}
