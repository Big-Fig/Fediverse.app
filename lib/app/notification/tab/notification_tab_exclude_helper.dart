import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_notification_model.dart';

class NotificationTabExcludeHelper {
  static List<PleromaNotificationType> mapTabToExcludeTypes({
    required NotificationTab tab,
  }) {
    List<PleromaNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = [
          PleromaNotificationType.pleromaChatMention,
        ];
        break;
      case NotificationTab.mentions:
        excludeTypes = PleromaNotificationType.values.valuesWithoutSelected([
          PleromaNotificationType.mention,
        ]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = PleromaNotificationType.values.valuesWithoutSelected([
          PleromaNotificationType.reblog,
        ]);
        break;
      case NotificationTab.favourites:
        excludeTypes = PleromaNotificationType.values.valuesWithoutSelected([
          PleromaNotificationType.favourite,
        ]);
        break;
      case NotificationTab.follows:
        excludeTypes = PleromaNotificationType.values.valuesWithoutSelected([
          PleromaNotificationType.follow,
          PleromaNotificationType.followRequest,
        ]);
        break;
    }
    return excludeTypes;
  }
}
