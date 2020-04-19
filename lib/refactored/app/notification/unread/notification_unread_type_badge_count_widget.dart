import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/unread/notification_unread_badge_count_widget.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:flutter/cupertino.dart';

class NotificationUnreadTypeBadgeCountWidget
    extends NotificationUnreadBadgeCountWidget {

  final MastodonNotificationType type;

  NotificationUnreadTypeBadgeCountWidget(
      {@required Widget child, @required this.type,}) : super(child: child);

  @override
  Stream<int> retrieveUnreadBadgeCountStream(BuildContext context) {
    var notificationRepository = INotificationRepository.of(
        context, listen: false);
    return notificationRepository.watchUnreadCountByType(type: type);
  }


}
