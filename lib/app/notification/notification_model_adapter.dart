import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/notification/pleroma_api_notification_model.dart';

extension IPleromaNotificationExtension on IPleromaApiNotification {
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
      chatMessage: remoteNotification.chatMessage?.toPleromaApiChatMessage(),
      dismissed: null,
      report: remoteNotification.report?.toPleromaApiAccountReport(),
      target: remoteNotification.target?.toPleromaApiAccount(),
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
      dbStatusAccount: status?.account.toDbAccount(),
      replyDbStatus: null,
      replyDbStatusAccount: null,
      replyReblogDbStatus: null,
      replyReblogDbStatusAccount: null,
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
        chatMessage: chatMessage?.toPleromaApiChatMessage(),
        target: target?.toPleromaApiAccount(),
        unread: unread,
        type: type,
        createdAt: createdAt,
        dismissed: dismissed,
      );
    }
  }

  PleromaApiNotification toPleromaNotification() {
    var localNotification = this;

    var pleroma = localNotification.pleroma;

    var unread = localNotification.unread ?? false;

    if (pleroma != null) {
      pleroma = pleroma.copyWith(
        isSeen: !unread,
      );
    } else {
      pleroma = PleromaApiNotificationPleromaPart(
        isSeen: !unread,
        isMuted: null,
      );
    }

    return PleromaApiNotification(
      id: localNotification.remoteId,
      createdAt: localNotification.createdAt,
      account: localNotification.account?.toPleromaApiAccount(),
      type: localNotification.type,
      emoji: localNotification.emoji,
      pleroma: pleroma,
      chatMessage: localNotification.chatMessage?.toPleromaApiChatMessage(),
      target: localNotification.target?.toPleromaApiAccount(),
      report: localNotification.report?.toPleromaApiAccountReport(),
      status: localNotification.status?.toPleromaStatus(),
    );
  }
}
