import 'package:fedi/repository/repository_model.dart';
import 'package:moor/moor.dart';

class ConversationChatRepositoryFilters {
  static const ConversationChatRepositoryFilters empty =
      ConversationChatRepositoryFilters();

  final bool withLastMessage;

  const ConversationChatRepositoryFilters({
    this.withLastMessage = false,
  });

  ConversationChatRepositoryFilters copyWith({
    bool? withLastMessage,
  }) {
    return ConversationChatRepositoryFilters(
      withLastMessage: withLastMessage ?? this.withLastMessage,
    );
  }

  @override
  String toString() {
    return 'ConversationChatRepositoryFilters{'
        'withLastMessage: $withLastMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationChatRepositoryFilters &&
          runtimeType == other.runtimeType &&
          withLastMessage == other.withLastMessage;

  @override
  int get hashCode => withLastMessage.hashCode;
}

enum ConversationChatOrderType {
  remoteId,
  updatedAt,
}

class ConversationRepositoryChatOrderingTermData
    extends RepositoryOrderingTerm {
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
