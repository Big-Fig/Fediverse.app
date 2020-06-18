import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';

class NotificationTabExcludeHelper {
  static List<PleromaNotificationType> mapTabToExcludeTypes(
      NotificationTab tab) {
    List<PleromaNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExclude([PleromaNotificationType.pleromaChatMention]);
        break;
      case NotificationTab.mentions:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.mention]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.reblog]);
        break;
      case NotificationTab.favourites:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.favourite]);
        break;
      case NotificationTab.follows:
        excludeTypes = pleromaNotificationTypeValues.valuesWithExcept([
          PleromaNotificationType.follow,
          PleromaNotificationType.followRequest,
        ]);
        break;
    }
    return excludeTypes;
  }
}

extension NotificationTabExcludeExtension on NotificationTab {
  List<PleromaNotificationType> asExcludeTypes() => NotificationTabExcludeHelper.mapTabToExcludeTypes(this);
}
