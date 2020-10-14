import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';

class NotificationTabExcludeHelper {
  static List<PleromaNotificationType> mapTabToExcludeTypes(
      NotificationTab tab) {
    List<PleromaNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = [PleromaNotificationType.pleromaChatMention];
        break;
      case NotificationTab.mentions:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithoutSelected([PleromaNotificationType.mention]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithoutSelected([PleromaNotificationType.reblog]);
        break;
      case NotificationTab.favourites:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithoutSelected([PleromaNotificationType.favourite]);
        break;
      case NotificationTab.follows:
        excludeTypes = pleromaNotificationTypeValues.valuesWithoutSelected([
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
