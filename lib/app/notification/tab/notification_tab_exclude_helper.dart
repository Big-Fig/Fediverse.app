import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';

class NotificationTabExcludeHelper {
  static List<PleromaNotificationType> mapTabToExcludeTypes({
    @required NotificationTab tab,
  }) {
    List<PleromaNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = [];
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

