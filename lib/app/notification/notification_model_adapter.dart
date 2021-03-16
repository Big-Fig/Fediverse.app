import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/notification/notification_model.dart';
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
}

extension INotificationExtension on INotification {
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
