import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/widgets.dart';

DbNotification mapRemoteNotificationToDbNotification(
  IPleromaNotification remoteNotification, {
  @required bool unread,
}) {
  if (remoteNotification.pleroma?.isSeen == true) {
    unread = false;
  }

  return DbNotification(
    id: null,
    remoteId: remoteNotification.id,
    createdAt: remoteNotification.createdAt,
    accountRemoteId: remoteNotification.account.id,
    statusRemoteId: remoteNotification.status?.id,
    chatRemoteId: remoteNotification.chatMessage?.chatId,
    chatMessageRemoteId: remoteNotification.chatMessage?.id,
    emoji: remoteNotification.emoji,
    pleroma: remoteNotification.pleroma,
    type: remoteNotification.type,
    unread: unread == true,
  );
}

PleromaNotification mapLocalNotificationToRemoteNotification(
  INotification localNotification,
) {
  PleromaStatus status;
  if (localNotification.status != null) {
    status = mapLocalStatusToRemoteStatus(localNotification.status);
  }
  return PleromaNotification(
    id: localNotification.remoteId,
    createdAt: localNotification.createdAt,
    account: mapLocalAccountToRemoteAccount(localNotification.account),
    type: localNotification.type,
    emoji: localNotification.emoji,
    pleroma: localNotification.pleroma,
    chatMessage: localNotification.chatMessage,
    target: localNotification.target,
    report: localNotification.report,
    isSeen: !localNotification.unread,
    status: status,
  );
}
