import 'package:moor/moor.dart';

enum AccountOrderByType {
  remoteId,
}

class AccountOrderingTermData {
  final AccountOrderByType orderByType;
  final OrderingMode orderingMode;
  AccountOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'AccountOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
