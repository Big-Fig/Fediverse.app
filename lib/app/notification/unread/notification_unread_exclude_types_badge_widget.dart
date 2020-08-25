import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/ui/badge/fedi_unread_badge_widget.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';

class NotificationUnreadBadgeExcludeTypesWidget extends FediUnreadBadgeWidget {
  final List<PleromaNotificationType> excludeTypes;

  NotificationUnreadBadgeExcludeTypesWidget({
    @required Widget child,
    @required this.excludeTypes,
    double offset = 2.0,
  }) : super(
          child: child,
          offset: offset,
        );

  @override
  Stream<bool> retrieveUnreadBadgeCountStream(BuildContext context) {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);
    return notificationRepository
        .watchUnreadCountExcludeTypes(excludeTypes: excludeTypes)
        .map((count) => count != null && count > 0);
  }
}
