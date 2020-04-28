import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_badge_count_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationUnreadAllBadgeCountWidget
    extends NotificationUnreadBadgeCountWidget {
  NotificationUnreadAllBadgeCountWidget({@required Widget child})
      : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);
    return notificationRepository.watchUnreadCountAnyType();
  }
}
