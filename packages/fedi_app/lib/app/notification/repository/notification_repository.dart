import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/app/notification/repository/notification_repository_model.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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

  Future<void> markAsRead({
    required INotification notification,
  });

  Future<void> dismiss({
    required INotification notification,
  });

  Future<void> dismissFollowRequestNotificationsFromAccount({
    required IAccount account,
    required Batch? batchTransaction,
  });

  Future<void> dismissAll();

  Future<void> markAllAsRead();

  Future<INotification?> getNewestOrderByRemoteId();

  Future<INotification?> getOldestOrderByRemoteId();

  Future<void> upsertRemoteNotification(
    IUnifediApiNotification remoteItem, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future<void> upsertRemoteNotifications(
    List<IUnifediApiNotification> unifediNotifications, {
    required bool unread,
    required Batch? batchTransaction,
  });

  Future<void> updateNotificationByRemoteType({
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
