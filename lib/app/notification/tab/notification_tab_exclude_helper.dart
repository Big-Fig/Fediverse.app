import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationTabExcludeHelper {
  static List<UnifediApiNotificationType> mapTabToExcludeTypes({
    required NotificationTab tab,
  }) {
    List<UnifediApiNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = [
          UnifediApiNotificationType.chatMentionValue,
        ];
        break;
      case NotificationTab.mentions:
        excludeTypes = UnifediApiNotificationType.values.valuesWithoutSelected([
          UnifediApiNotificationType.mention,
        ]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = UnifediApiNotificationType.values.valuesWithoutSelected([
          UnifediApiNotificationType.reblog,
        ]);
        break;
      case NotificationTab.favourites:
        excludeTypes = UnifediApiNotificationType.values.valuesWithoutSelected([
          UnifediApiNotificationType.favouriteValue,
        ]);
        break;
      case NotificationTab.follows:
        excludeTypes = UnifediApiNotificationType.values.valuesWithoutSelected([
          UnifediApiNotificationType.followValue,
          UnifediApiNotificationType.followRequestValue,
        ]);
        break;
    }

    return excludeTypes;
  }
}
