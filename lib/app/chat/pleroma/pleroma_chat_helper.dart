import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart' as pleroma_lib;
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service.dart';
import 'package:flutter/widgets.dart';

void goToPleromaChatWithAccount({
  required BuildContext context,
  required IAccount account,
}) async {
  var chatRepository = IPleromaChatRepository.of(context, listen: false);
  IPleromaChat? chat = await chatRepository.findByAccount(account: account);
  if (chat != null) {
    goToPleromaChatPage(context, chat: chat);
  } else {
    var isAccountAcceptsChatMessages =
        account.pleromaAcceptsChatMessages != false;
    if (isAccountAcceptsChatMessages) {
      var dialogResult = await PleromaAsyncOperationHelper
          .performPleromaAsyncOperation<IPleromaChat?>(
        context: context,
        asyncCode: () async {
          var pleromaChatService =
              IPleromaChatService.of(context, listen: false);

          pleroma_lib.IPleromaChat remoteChat =
              await pleromaChatService.getOrCreateChatByAccountId(
            accountId: account.remoteId,
          );

          await chatRepository.upsertInRemoteType(remoteChat);

          return await chatRepository.findByRemoteIdInAppType(remoteChat.id);
        },
      );
      chat = dialogResult.result;
      if (chat != null) {
        goToPleromaChatPage(context, chat: chat);
      }
    } else {
      var toastService = IToastService.of(
        context,
        listen: false,
      );

      toastService.showErrorToast(
        context: context,
        title:
            S.of(context).app_chat_pleroma_account_notAcceptsChatMessages_toast,
      );
    }
  }
}
