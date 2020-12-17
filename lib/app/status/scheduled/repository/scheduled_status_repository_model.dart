import 'package:moor/moor.dart';

// todo : move to dao model
enum ScheduledStatusRepositoryOrderType {
  remoteId,
}

class ScheduledStatusOrderingTermData {
  final ScheduledStatusRepositoryOrderType orderByType;
  final OrderingMode orderingMode;
  ScheduledStatusOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ScheduledStatusOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
