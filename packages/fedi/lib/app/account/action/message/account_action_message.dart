import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';

import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_helper.dart';
import 'package:flutter/cupertino.dart';

Future<void> goToMessagesPageAccountAction(BuildContext context) async {
  var accountBloc = IAccountBloc.of(context, listen: false);
  var account = accountBloc.account;

  var isInstanceSupportChats = accountBloc.isSupportChats;
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
