import 'package:moor/moor.dart';

enum ConversationOrderByType {
  remoteId,
}

class ConversationOrderingTermData {
  final ConversationOrderByType orderByType;
  final OrderingMode orderingMode;
  ConversationOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ConversationOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
