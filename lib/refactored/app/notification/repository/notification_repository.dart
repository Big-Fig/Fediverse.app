import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/repository/notification_repository_model.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationRepository
    implements
        IReadIdListRepository<INotification, int>,
        IWriteIdListRepository<DbNotification, int>,
        Disposable {
  static INotificationRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationRepository>(context, listen: listen);

  Future<INotification> findByRemoteId(String remoteId);

  Future upsertRemoteNotifications(List<IPleromaNotification> remoteNotifications,
      {@required String listRemoteId, @required String conversationRemoteId});

  Stream<INotification> watchByRemoteId(String remoteId);

  Future updateLocalNotificationByRemoteNotification(
      {@required INotification oldLocalNotification,
      @required IPleromaNotification newRemoteNotification});

  Future upsertRemoteNotification(IPleromaNotification remoteNotification,
      {@required String listRemoteId, @required String conversationRemoteId});



  Future<List<DbNotificationPopulatedWrapper>> getNotifications(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData});

  Stream<List<DbNotificationPopulatedWrapper>> watchNotifications(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required int limit,
      @required int offset,
      @required NotificationOrderingTermData orderingTermData});

  Future<DbNotificationPopulatedWrapper> getNotification(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required NotificationOrderingTermData orderingTermData});

  Stream<DbNotificationPopulatedWrapper> watchNotification(
      {@required String onlyInListWithRemoteId,
      @required String onlyWithHashtag,
      @required IAccount onlyFromAccountsFollowingByAccount,
      @required IAccount onlyFromAccount,
      @required IConversation onlyInConversation,
      @required OnlyLocalNotificationFilter onlyLocal,
      @required bool onlyWithMedia,
      @required bool onlyNotMuted,
      @required List<PleromaVisibility> excludeVisibilities,
      @required INotification olderThanNotification,
      @required INotification newerThanNotification,
      @required bool onlyNoNsfwSensitive,
      @required bool onlyNoReplies,
      @required NotificationOrderingTermData orderingTermData});
}
