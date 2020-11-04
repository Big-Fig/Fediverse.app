import 'package:moor/moor.dart';

enum ConversationPleromaChatOrderByType {
  remoteId,
}

class ConversationOrderingTermData {
  final ConversationPleromaChatOrderByType orderByType;
  final OrderingMode orderingMode;
  ConversationOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ConversationPleromaChatOrderByType{orderByType: $orderByType,'
        ' orderingMode: $orderingMode}';
  }
}
