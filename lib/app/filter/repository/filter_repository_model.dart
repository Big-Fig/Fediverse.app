import 'package:moor/moor.dart';

enum FilterOrderByType { remoteId }

class FilterOrderingTermData {
  final FilterOrderByType orderByType;
  final OrderingMode orderingMode;

  FilterOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'FilterOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}
