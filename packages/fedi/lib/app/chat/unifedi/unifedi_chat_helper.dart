import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi/app/chat/unifedi/repository/unifedi_chat_repository.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_page.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

Future<void> goToUnifediChatWithAccount({
  required BuildContext context,
  required IAccount account,
}) async {
  var chatRepository = IUnifediChatRepository.of(context, listen: false);
  var chat = await chatRepository.findByAccount(account: account);
  if (chat != null) {
    goToUnifediChatPage(context, chat: chat);
  } else {
    var isAccountAcceptsChatMessages = account.acceptsChatMessages != false;
    if (isAccountAcceptsChatMessages) {
      var dialogResult = await UnifediAsyncOperationHelper
          .performUnifediAsyncOperation<IUnifediChat?>(
        context: context,
        asyncCode: () async {
          var unifediApiChatService =
              Provider.of<IUnifediApiChatService>(context, listen: false);

          var unifediApiChat =
              await unifediApiChatService.getOrCreateChatByAccountId(
            accountId: account.remoteId,
          );

          // ignore: avoid-ignoring-return-values
          await chatRepository.upsertInRemoteType(unifediApiChat);

          return chatRepository.findByRemoteIdInAppType(unifediApiChat.id);
        },
      );
      chat = dialogResult.result;
      if (chat != null) {
        goToUnifediChatPage(context, chat: chat);
      }
    } else {
      var toastService = IToastService.of(
        context,
        listen: false,
      );

      // ignore: cascade_invocations
      toastService.showErrorToast(
        context: context,
        title:
            S.of(context).app_chat_unifedi_account_notAcceptsChatMessages_toast,
      );
    }
  }
}
