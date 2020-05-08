import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationRepository
    implements
        IReadIdListRepository<INotification, int>,
        IWriteIdListRepository<DbNotification, int>,
        Disposable {
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

  Future<int> countUnreadAnyType();

  Future<int> countUnreadByType({@required PleromaNotificationType type});

  Stream<int> watchUnreadCountAnyType();

  Stream<int> watchUnreadCountByType({@required PleromaNotificationType type});

  Future<List<DbNotificationPopulatedWrapper>> getNotifications(
      {@required List<PleromaNotificationType> excludeTypes,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData});

  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications(
      {@required List<PleromaNotificationType> excludeTypes,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData});

  Future<DbNotificationPopulatedWrapper> getNotification(
      {@required List<PleromaNotificationType> excludeTypes,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required NotificationOrderingTermData orderingTermData});

  Stream<DbNotificationPopulatedWrapper> watchNotification(
      {@required List<PleromaNotificationType> excludeTypes,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required NotificationOrderingTermData orderingTermData});
}
