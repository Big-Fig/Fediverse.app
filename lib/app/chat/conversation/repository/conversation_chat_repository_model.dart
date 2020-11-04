import 'package:moor/moor.dart';

enum ConversationChatOrderByType {
  remoteId,
}

class ConversationOrderingTermData {
  final ConversationChatOrderByType orderByType;
  final OrderingMode orderingMode;
  ConversationOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ConversationChatOrderByType{orderByType: $orderByType,'
        ' orderingMode: $orderingMode}';
  }
}
