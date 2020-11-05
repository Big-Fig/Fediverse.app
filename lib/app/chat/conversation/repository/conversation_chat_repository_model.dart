import 'package:moor/moor.dart';

enum ConversationPleromaChatOrderByType {
  remoteId,
  updatedAt,
}

class ConversationChatOrderingTermData {
  final ConversationPleromaChatOrderByType orderByType;
  final OrderingMode orderingMode;
  ConversationChatOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ConversationPleromaChatOrderByType{orderByType: $orderByType,'
        ' orderingMode: $orderingMode}';
  }
}
