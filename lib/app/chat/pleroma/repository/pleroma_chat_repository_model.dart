import 'package:moor/moor.dart';

enum PleromaChatOrderByType {
  remoteId, updatedAt
}

class PleromaChatOrderingTermData {
  final PleromaChatOrderByType orderByType;
  final OrderingMode orderingMode;
  PleromaChatOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ChatOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
