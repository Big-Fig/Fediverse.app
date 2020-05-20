import 'package:moor/moor.dart';

// todo : move to dao model
enum ScheduledStatusOrderByType {
  remoteId,
}

class ScheduledStatusOrderingTermData {
  final ScheduledStatusOrderByType orderByType;
  final OrderingMode orderingMode;
  ScheduledStatusOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'ScheduledStatusOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
