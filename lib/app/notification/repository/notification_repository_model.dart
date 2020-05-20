import 'package:moor/moor.dart';

enum NotificationOrderByType { remoteId, createdAt }

class NotificationOrderingTermData {
  final NotificationOrderByType orderByType;
  final OrderingMode orderingMode;
  NotificationOrderingTermData(
      {@required this.orderByType, @required this.orderingMode});

  @override
  String toString() {
    return 'NotificationOrderingTermData{orderByType: $orderByType, orderingMode: $orderingMode}';
  }
}

class OnlyLocalNotificationFilter {
  final String localUrlHost;
  OnlyLocalNotificationFilter(this.localUrlHost);

  @override
  String toString() {
    return 'OnlyLocalNotificationFilter{localUrlHost: $localUrlHost}';
  }
}
