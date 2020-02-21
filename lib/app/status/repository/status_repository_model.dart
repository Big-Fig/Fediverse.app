import 'package:moor/moor.dart';

enum StatusOrderByType {
  remoteId,
}

class StatusOrderingTermData {
  final StatusOrderByType orderByType;
  final OrderingMode orderingMode;
  StatusOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});
}
