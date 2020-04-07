import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/status_model_adapter.dart';
import 'package:fedi/refactored/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';

INotification mapRemoteNotificationToLocalNotification(
    IPleromaNotification remoteNotification,
    {@required bool unread}) {
  DbStatusPopulated statusPopulated;
  if (remoteNotification.status != null) {
    statusPopulated = mapRemoteStatusToLocalStatus(remoteNotification.status)
        .dbStatusPopulated;
  }
  return DbNotificationPopulatedWrapper(DbNotificationPopulated(
      notification: mapRemoteNotificationToDbNotification(remoteNotification,
          unread: unread),
      account: mapRemoteAccountToDbAccount(remoteNotification.account),
      statusPopulated: statusPopulated));
}

DbNotification mapRemoteNotificationToDbNotification(
    IPleromaNotification remoteNotification,
    {@required bool unread}) {
  return DbNotification(
      id: null,
      remoteId: remoteNotification.id,
      createdAt: remoteNotification.createdAt,
      accountRemoteId: remoteNotification.account.id,
      statusRemoteId: remoteNotification.status?.id,
      type: remoteNotification.type,
      unread: unread);
}

PleromaNotification mapLocalNotificationToRemoteNotification(
    INotification localNotification) {
  PleromaStatus status;
  if (localNotification.status != null) {
    status = mapLocalStatusToRemoteStatus(localNotification.status);
  }
  return PleromaNotification(
      id: localNotification.remoteId,
      createdAt: localNotification.createdAt,
      account: mapLocalAccountToRemoteAccount(localNotification.account),
      type: localNotification.type,
      status: status);
}
