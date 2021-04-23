import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class INotificationRepository
    implements
        IAppRemoteReadWriteRepository<
            DbNotification,
            INotification,
            IPleromaApiNotification,
            int,
            String,
            NotificationRepositoryFilters,
            NotificationRepositoryOrderingTermData>,
        IDisposable {
  static INotificationRepository of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationRepository>(
        context,
        listen: listen,
      );

  // Future upsertRemoteNotifications(
  //   List<IPleromaNotification> remoteNotifications, {
  //   required bool? unread,
  // });
  //
  // Future updateLocalNotificationByRemoteNotification({
  //   required INotification oldLocalNotification,
  //   required IPleromaNotification newRemoteNotification,
  //   required bool? unread,
  // });

  // Future upsertRemoteNotification(
  //   IPleromaNotification remoteNotification, {
  //   required bool? unread,
  // });

  // Future<int> getCount({
  //   required NotificationRepositoryFilters? filters,
  // });
  //
  // Stream<int> watchCount({
  //   required NotificationRepositoryFilters? filters,
  // });

  Future markAsRead({
    required INotification notification,
  });

  Future dismiss({
    required INotification notification,
  });

  Future dismissFollowRequestNotificationsFromAccount({
    required IAccount account,
    required Batch? batchTransaction,
  });

  Future dismissAll();

  Future markAllAsRead();

  Future<INotification?> getNewestOrderByRemoteId();

  Future<INotification?> getOldestOrderByRemoteId();

  Future upsertRemoteNotification(
    IPleromaApiNotification remoteItem, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future upsertRemoteNotifications(
    List<IPleromaApiNotification> pleromaNotifications, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future updateNotificationByRemoteType({
    required INotification appItem,
    required IPleromaApiNotification remoteItem,
    required bool? unread,
    required Batch? batchTransaction,
  });
}
