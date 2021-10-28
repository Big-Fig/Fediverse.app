import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

Future<void> goToMessagesPageAccountAction(BuildContext context) async {
  var accountBloc = IAccountBloc.of(context, listen: false);
  var account = accountBloc.account;

  var unifediApiChatService = Provider.of<IUnifediApiChatService>(
    context,
    listen: false,
  );

  var isInstanceSupportChats = unifediApiChatService.isFeatureSupported(
    unifediApiChatService.getChatsFeature,
  );
  var isAccountAcceptsChatMessages = account.acceptsChatMessages != false;
  var isPossibleToStartUnifediChat =
      isInstanceSupportChats && isAccountAcceptsChatMessages;
  if (isPossibleToStartUnifediChat) {
    await goToUnifediChatWithAccount(
      context: context,
      account: account,
    );
  } else {
    await goToPostStatusStartConversationPage(
      context,
      conversationAccountsWithoutMe: <IAccount>[
        account,
      ],
    );
  }
}
