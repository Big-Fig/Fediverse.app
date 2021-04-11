import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';

extension IPleromaNotificationExtension on IPleromaNotification {
  DbNotification toDbNotification({
    required bool? unread,
  }) {
    var remoteNotification = this;
    var isSeen = remoteNotification.pleroma?.isSeen;
    if (isSeen != null) {
      unread = !isSeen;
    }

    return DbNotification(
      id: null,
      remoteId: remoteNotification.id,
      createdAt: remoteNotification.createdAt,
      accountRemoteId: remoteNotification.account!.id,
      statusRemoteId: remoteNotification.status?.id,
      chatRemoteId: remoteNotification.chatMessage?.chatId,
      chatMessageRemoteId: remoteNotification.chatMessage?.id,
      emoji: remoteNotification.emoji,
      pleroma: remoteNotification.pleroma,
      type: remoteNotification.type,
      unread: unread == true,
      chatMessage: remoteNotification.chatMessage?.toPleromaChatMessage(),
      dismissed: null,
      report: remoteNotification.report?.toPleromaAccountReport(),
      target: remoteNotification.target?.toPleromaAccount(),
    );
  }

  DbNotificationPopulated toDbNotificationPopulated({
    required bool? unread,
  }) {
    return DbNotificationPopulated(
      dbNotification: toDbNotification(
        unread: unread,
      ),
      dbAccount: account?.toDbAccount(),
      dbStatus: status?.toDbStatus(),
      reblogDbStatus: status?.reblog?.toDbStatus(),
      reblogDbStatusAccount: status?.reblog?.account.toDbAccount(),
      replyDbStatus: null,
      replyReblogDbStatusAccount: null,
      replyReblogDbStatus: null,
      dbStatusAccount: null,
      replyDbStatusAccount: null,
    );
  }

  DbNotificationPopulatedWrapper toDbNotificationPopulatedWrapper({
    required bool? unread,
  }) =>
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: toDbNotificationPopulated(unread: unread),
      );
}

extension INotificationExtension on INotification {
  DbNotificationPopulatedWrapper toDbNotificationPopulatedWrapper() {
    if (this is DbNotificationPopulatedWrapper) {
      return this as DbNotificationPopulatedWrapper;
    } else {
      return DbNotificationPopulatedWrapper(
        dbNotificationPopulated: toDbNotificationPopulated(),
      );
    }
  }

  DbNotificationPopulated toDbNotificationPopulated() {
    if (this is DbNotificationPopulated) {
      var dbNotificationPopulatedWrapper =
          this as DbNotificationPopulatedWrapper;
      return dbNotificationPopulatedWrapper.dbNotificationPopulated;
    } else {
      return DbNotificationPopulated(
        dbNotification: toDbNotification(),
        dbAccount: account?.toDbAccount(),
        dbStatus: status?.toDbStatus(),
        dbStatusAccount: status?.toDbAccount(),
        reblogDbStatus: status?.toReblogDbStatus(),
        reblogDbStatusAccount: status?.toReblogStatusDbAccount(),
        replyDbStatus: status?.toReplyDbStatus(),
        replyDbStatusAccount: status?.toReplyStatusDbAccount(),
        replyReblogDbStatus: status?.toReplyReblogDbStatus(),
        replyReblogDbStatusAccount: status?.toReplyReblogStatusDbAccount(),
      );
    }
  }

  DbNotification toDbNotification() {
    if (this is DbNotificationPopulated) {
      var dbNotificationPopulatedWrapper =
          this as DbNotificationPopulatedWrapper;
      return dbNotificationPopulatedWrapper
          .dbNotificationPopulated.dbNotification;
    } else {
      return DbNotification(
        id: localId,
        remoteId: remoteId,
        accountRemoteId: account?.remoteId,
        statusRemoteId: status?.remoteId,
        chatRemoteId: chatRemoteId,
        chatMessageRemoteId: chatMessageRemoteId,
        emoji: emoji,
        pleroma: pleroma,
        chatMessage: chatMessage?.toPleromaChatMessage(),
        target: target?.toPleromaAccount(),
        unread: unread,
        type: type,
        createdAt: createdAt,
        dismissed: dismissed,
      );
    }
  }

  PleromaNotification toPleromaNotification() {
    var localNotification = this;

    PleromaNotificationPleromaPart? pleroma = localNotification.pleroma;

    var unread = localNotification.unread ?? false;

    if (pleroma != null) {
      pleroma = pleroma.copyWith(
        isSeen: !unread,
      );
    } else {
      pleroma = PleromaNotificationPleromaPart(
        isSeen: !unread,
        isMuted: null,
      );
    }

    return PleromaNotification(
      id: localNotification.remoteId,
      createdAt: localNotification.createdAt,
      account: localNotification.account?.toPleromaAccount(),
      type: localNotification.type,
      emoji: localNotification.emoji,
      pleroma: pleroma,
      chatMessage: localNotification.chatMessage?.toPleromaChatMessage(),
      target: localNotification.target?.toPleromaAccount(),
      report: localNotification.report?.toPleromaAccountReport(),
      status: localNotification.status?.toPleromaStatus(),
    );
  }
}
