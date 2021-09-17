import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';

abstract class INotificationRepository
    implements
        IAppRemoteReadWriteRepository<
            DbNotification,
            INotification,
            IUnifediApiNotification,
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
    IUnifediApiNotification remoteItem, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future upsertRemoteNotifications(
    List<IUnifediApiNotification> pleromaNotifications, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future updateNotificationByRemoteType({
    required INotification appItem,
    required IUnifediApiNotification remoteItem,
    required bool? unread,
    required Batch? batchTransaction,
  });

  Future<int> calculateCount({
    required NotificationRepositoryFilters? filters,
  });

  Stream<int> watchCalculateCount({
    required NotificationRepositoryFilters? filters,
  });
}
