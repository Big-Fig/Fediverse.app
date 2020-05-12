import 'package:moor/moor.dart';

enum ChatOrderByType {
  remoteId,
}

class ChatOrderingTermData {
  final ChatOrderByType orderByType;
  final OrderingMode orderingMode;
  ChatOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ChatOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
