import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaNotificationService implements IPleromaApi {
  static IPleromaNotificationService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPleromaNotificationService>(context, listen: listen);

  Future<List<IPleromaNotification>> getNotifications(
      {@required MastodonNotificationsRequest request});

  Future<IPleromaNotification> getNotification(
      {@required String notificationRemoteId});
}
