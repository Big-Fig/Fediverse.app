import 'package:moor/moor.dart';

enum PleromaChatOrderByType {
  remoteId, updatedAt
}

class ChatOrderingTermData {
  final PleromaChatOrderByType orderByType;
  final OrderingMode orderingMode;
  ChatOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ChatOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
