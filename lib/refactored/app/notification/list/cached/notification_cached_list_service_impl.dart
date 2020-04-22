import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_service.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';

class NotificationCachedListService extends INotificationCachedListService {
  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final MastodonNotificationType onlyWithType;

  @override
  IPleromaApi get pleromaApi => pleromaNotificationService;

  NotificationCachedListService(
      {@required this.pleromaNotificationService,
      @required this.notificationRepository,
      this.onlyWithType});

  @override
  Future<List<INotification>> loadLocalItems(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan}) {
    return notificationRepository.getNotifications(
        onlyWithType: onlyWithType,
        olderThanNotification: olderThan,
        newerThanNotification: newerThan,
        limit: limit,
        offset: null,
        orderingTermData: NotificationOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: NotificationOrderByType.createdAt));
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan}) async {
    List<MastodonNotificationType> excludeTypes;

    if (onlyWithType != null) {
      excludeTypes = mastodonNotificationTypeValues.map.values.toList();
      excludeTypes.remove(onlyWithType);
    }

    var remoteNotifications = await pleromaNotificationService.getNotifications(
        request: MastodonNotificationsRequest(
            excludeTypes: excludeTypes,
            maxId: olderThan?.remoteId,
            sinceId: newerThan?.remoteId,
            limit: limit));

    if (remoteNotifications != null) {
      await notificationRepository
          .upsertRemoteNotifications(remoteNotifications, unread: false);
      return true;
    } else {
      return false;
    }
  }

  static NotificationCachedListService createFromContext(BuildContext context,
          {MastodonNotificationType onlyWithType}) =>
      NotificationCachedListService(
          pleromaNotificationService:
              IPleromaNotificationService.of(context, listen: false),
          onlyWithType: onlyWithType,
          notificationRepository:
              INotificationRepository.of(context, listen: false));
}
