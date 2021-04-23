import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';

class NotificationTabExcludeHelper {
  static List<PleromaApiNotificationType> mapTabToExcludeTypes({
    required NotificationTab tab,
  }) {
    List<PleromaApiNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = [
          PleromaApiNotificationType.pleromaChatMention,
        ];
        break;
      case NotificationTab.mentions:
        excludeTypes = PleromaApiNotificationType.values.valuesWithoutSelected([
          PleromaApiNotificationType.mention,
        ]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = PleromaApiNotificationType.values.valuesWithoutSelected([
          PleromaApiNotificationType.reblog,
        ]);
        break;
      case NotificationTab.favourites:
        excludeTypes = PleromaApiNotificationType.values.valuesWithoutSelected([
          PleromaApiNotificationType.favourite,
        ]);
        break;
      case NotificationTab.follows:
        excludeTypes = PleromaApiNotificationType.values.valuesWithoutSelected([
          PleromaApiNotificationType.follow,
          PleromaApiNotificationType.followRequest,
        ]);
        break;
    }
    return excludeTypes;
  }
}
