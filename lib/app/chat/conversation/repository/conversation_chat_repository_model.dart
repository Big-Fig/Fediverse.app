import 'package:moor/moor.dart';

class ConversationChatRepositoryFilters {

}

enum ConversationChatOrderType {
  remoteId,
  updatedAt,
}

class ConversationChatOrderingTermData {
  final ConversationChatOrderType orderType;
  final OrderingMode orderingMode;

  const ConversationChatOrderingTermData({
    @required this.orderType,
    @required this.orderingMode,
  });

  static const ConversationChatOrderingTermData remoteIdDesc =
      ConversationChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ConversationChatOrderType.remoteId,
  );
  static const ConversationChatOrderingTermData remoteIdAsc =
      ConversationChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ConversationChatOrderType.remoteId,
  );

  static const ConversationChatOrderingTermData updatedAtDesc =
      ConversationChatOrderingTermData(
    orderingMode: OrderingMode.desc,
    orderType: ConversationChatOrderType.updatedAt,
  );
  static const ConversationChatOrderingTermData updatedAtAsc =
      ConversationChatOrderingTermData(
    orderingMode: OrderingMode.asc,
    orderType: ConversationChatOrderType.updatedAt,
  );

  @override
  String toString() {
    return 'ConversationChatOrderType{'
        'orderByType: $orderType,'
        ' orderingMode: $orderingMode'
        '}';
  }
}
