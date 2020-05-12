import 'package:fedi/refactored/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';

class NotificationCachedListBloc extends INotificationCachedListBloc {
  final IPleromaNotificationService pleromaNotificationService;
  final INotificationRepository notificationRepository;
  final List<PleromaNotificationType> excludeTypes;

  @override
  IPleromaApi get pleromaApi => pleromaNotificationService;

  NotificationCachedListBloc(
      {@required this.pleromaNotificationService,
      @required this.notificationRepository,
      this.excludeTypes});

  @override
  Future<List<INotification>> loadLocalItems(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan}) {
    return notificationRepository.getNotifications(
        excludeTypes: excludeTypes,
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

    // todo: don't exclude pleroma types on mastodon instances
    var remoteNotifications = await pleromaNotificationService.getNotifications(
        request: MastodonNotificationsRequest(
            excludeTypes: excludeTypes
                ?.map((type) => pleromaNotificationTypeValues.reverse[type])
                ?.toList(),
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

  static NotificationCachedListBloc createFromContext(BuildContext context,
          {@required List<PleromaNotificationType> excludeTypes}) =>
      NotificationCachedListBloc(
          pleromaNotificationService:
              IPleromaNotificationService.of(context, listen: false),
          excludeTypes: excludeTypes,
          notificationRepository:
              INotificationRepository.of(context, listen: false));

  @override
  Stream<List<INotification>> watchLocalItemsNewerThanItem(
          INotification item) =>
      notificationRepository.watchNotifications(
          excludeTypes: excludeTypes,
          olderThanNotification: null,
          newerThanNotification: item,
          limit: null,
          offset: null,
          orderingTermData: NotificationOrderingTermData(
              orderingMode: OrderingMode.desc,
              orderByType: NotificationOrderByType.createdAt));
}
