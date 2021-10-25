import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_page.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension GoToNotificationExtension on INotification {
  Future<void> goToRelatedPage(BuildContext context) async {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);

    var unifediNotificationService =
        Provider.of<IUnifediApiNotificationService>(context, listen: false);

    // ignore: unawaited_futures
    notificationRepository.markAsRead(
      notification: this,
    );
    if (unifediNotificationService.isPleroma) {
      // ignore: unawaited_futures, avoid-ignoring-return-values
      unifediNotificationService.markAsReadSingle(
        notificationId: remoteId,
      );
    }

    var status = this.status;
    var account = this.account;
    var chatRemoteId = this.chatRemoteId;
    if (typeAsUnifediApi == UnifediApiNotificationType.followRequestValue) {
      await goToMyAccountFollowRequestListPage(context);
    } else if (status != null) {
      await goToLocalStatusThreadPage(
        context,
        status: status,
        initialMediaAttachment: null,
      );
    } else if (chatRemoteId != null) {
      var chatRepository = IUnifediChatRepository.of(context, listen: false);

      var chat = await chatRepository.findByRemoteIdInAppType(chatRemoteId);

      if (chat != null) {
        goToUnifediChatPage(context, chat: chat);
      }
    } else if (account != null) {
      goToLocalAccountDetailsPage(
        context,
        account: account,
      );
    }
  }
}
