import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_page.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future goToPleromaChatWithAccount({
  required BuildContext context,
  required IAccount account,
}) async {
  var chatRepository = IPleromaChatRepository.of(context, listen: false);
  var chat = await chatRepository.findByAccount(account: account);
  if (chat != null) {
    goToPleromaChatPage(context, chat: chat);
  } else {
    var isAccountAcceptsChatMessages =
        account.acceptsChatMessages != false;
    if (isAccountAcceptsChatMessages) {
      var dialogResult = await PleromaAsyncOperationHelper
          .performPleromaAsyncOperation<IPleromaChat?>(
        context: context,
        asyncCode: () async {
          var pleromaApiChatService =
              Provider.of<IUnifediApiChatService>(context, listen: false);

          var unifediApiChat =
              await pleromaApiChatService.getOrCreateChatByAccountId(
            accountId: account.remoteId,
          );

          await chatRepository.upsertInRemoteType(unifediApiChat);

          return await chatRepository
              .findByRemoteIdInAppType(unifediApiChat.id);
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
