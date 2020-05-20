import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/badge/badge_count_widget.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';

class NotificationUnreadTypeBadgeCountWidget
    extends BadgeCountWidget {
  final PleromaNotificationType type;

  NotificationUnreadTypeBadgeCountWidget({
    @required Widget child,
    @required this.type,
  }) : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);
    return notificationRepository.watchUnreadCountByType(type: type);
  }
}
