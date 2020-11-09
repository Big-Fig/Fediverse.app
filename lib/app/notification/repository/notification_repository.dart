import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationRepository
    implements
        IReadIdListRepository<INotification, int>,
        IWriteIdListRepository<DbNotification, int>,
        IDisposable {
  static INotificationRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationRepository>(context, listen: listen);

  Future<INotification> findByRemoteId(String remoteId);

  Future upsertRemoteNotifications(
      List<IPleromaNotification> remoteNotifications,
      {@required bool unread});

  Stream<INotification> watchByRemoteId(String remoteId);

  Future updateLocalNotificationByRemoteNotification(
      {@required INotification oldLocalNotification,
      @required IPleromaNotification newRemoteNotification,
      @required bool unread});

  Future upsertRemoteNotification(IPleromaNotification remoteNotification,
      {@required bool unread});

  Future<int> countUnreadAnyType({
    bool onlyNotDismissed = true,
  });

  Future<int> countUnreadByType({
    @required PleromaNotificationType type,
    bool onlyNotDismissed = true,
  });

  Future<int> getUnreadCountExcludeTypes({
    @required List<PleromaNotificationType> excludeTypes,
    bool onlyNotDismissed = true,
  });

  Stream<int> watchUnreadCountExcludeTypes({
    @required List<PleromaNotificationType> excludeTypes,
    bool onlyNotDismissed = true,
  });

  Stream<int> watchUnreadCountAnyType({
    bool onlyNotDismissed = true,
  });

  Stream<int> watchUnreadCountByType({
    @required PleromaNotificationType type,
    bool onlyNotDismissed = true,
  });

  Future<List<DbNotificationPopulatedWrapper>> getNotifications({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required int limit,
    @required int offset,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  });

  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required int limit,
    @required int offset,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  });

  Future<DbNotificationPopulatedWrapper> getNotification({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  });

  Stream<DbNotificationPopulatedWrapper> watchNotification({
    @required List<PleromaNotificationType> excludeTypes,
    @required INotification olderThanNotification,
    @required INotification newerThanNotification,
    @required NotificationOrderingTermData orderingTermData,
    bool onlyNotDismissed = true,
  });

  Future markAsRead({@required INotification notification});

  Future dismiss({@required INotification notification});

  Future dismissAll();
}
