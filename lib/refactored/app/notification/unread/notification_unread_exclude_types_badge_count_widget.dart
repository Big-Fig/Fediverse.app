import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/badge/badge_count_widget.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';

class NotificationUnreadBadgeExcludeTypesCountWidget
    extends BadgeCountWidget {
  
  final List<PleromaNotificationType> excludeTypes;

  NotificationUnreadBadgeExcludeTypesCountWidget({
    @required Widget child,
    @required this.excludeTypes,
  })
      : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);
    return notificationRepository.watchUnreadCountExcludeTypes(excludeTypes:excludeTypes);
  }
}
