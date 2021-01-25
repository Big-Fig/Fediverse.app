import 'package:fedi/app/account/details/local_account_details_page.dart';
import 'package:fedi/app/account/my/follow_request/my_account_follow_request_list_page.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/thread/local_status_thread_page.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pedantic/pedantic.dart';

extension GoToNotificationExtension on INotification {
  Future goToRelatedPage(BuildContext context) async {
    var notificationRepository =
        INotificationRepository.of(context, listen: false);

    unawaited(
      notificationRepository.markAsRead(
        notification: this,
      ),
    );

    var status = this.status;
    var account = this.account;
    var chatRemoteId = this.chatRemoteId;
    if (typePleroma == PleromaNotificationType.followRequest) {
      goToMyAccountFollowRequestListPage(context);
    } else if (status != null) {
      goToLocalStatusThreadPage(
        context,
        status: status,
        initialMediaAttachment: null,
      );
    } else if (chatRemoteId != null) {
      var chatRepository = IPleromaChatRepository.of(context, listen: false);

      var chat = await chatRepository.findByRemoteId(chatRemoteId);

      goToPleromaChatPage(context, chat: chat);
    } else if (account != null) {
      goToLocalAccountDetailsPage(
        context,
        account: account,
      );
    }
  }
}
