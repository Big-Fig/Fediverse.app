import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_helper.dart';
import 'package:flutter/cupertino.dart';

Future goToMessagesPageAccountAction(BuildContext context) async {
  var authInstanceBloc = ICurrentAuthInstanceBloc.of(context, listen: false);
  var accountBloc = IAccountBloc.of(context, listen: false);
  var account = accountBloc.account;

  var isInstanceSupportChats = authInstanceBloc.currentInstance.isSupportChats;
  var isAccountAcceptsChatMessages =
      account.pleromaAcceptsChatMessages != false;
  var isPossibleToStartPleromaChat =
      isInstanceSupportChats && isAccountAcceptsChatMessages;
  if (isPossibleToStartPleromaChat) {
    goToPleromaChatWithAccount(
      context: context,
      account: account,
    );
  } else {
    goToPostStatusStartConversationPage(
      context,
      conversationAccountsWithoutMe: <IAccount>[
        account,
      ],
    );
  }
}
