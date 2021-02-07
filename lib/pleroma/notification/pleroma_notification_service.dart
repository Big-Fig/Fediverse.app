import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationService implements IPleromaAuthApi {
  static IPleromaNotificationService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaNotificationService>(context, listen: listen);

  Future<List<IPleromaNotification>> getNotifications({
    IPleromaPaginationRequest pagination,
    List<String> excludeTypes,
  });

  Future<IPleromaNotification> getNotification({
    @required String notificationRemoteId,
  });

  Future<IPleromaNotification> markAsReadSingle({
    @required String notificationRemoteId,
  });

  Future<List<IPleromaNotification>> markAsReadList({
    @required String maxNotificationRemoteId,
  });

  Future dismissNotification({
    @required String notificationRemoteId,
  });

  Future dismissAll();
}
