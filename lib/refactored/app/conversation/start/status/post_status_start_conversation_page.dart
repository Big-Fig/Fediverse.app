import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_page.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/start/status/post_status_start_conversation_bloc_impl.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/post/post_status_widget.dart';
import 'package:fedi/refactored/dialog/async/async_dialog.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart';

class PostStatusStartConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).tr("app.conversation.start.title")),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PostStatusWidget(
        showVisibilityAction: false,
        displayMentions: true,
        goBackOnSuccess: true,
        expanded: true,
      ),
    );
  }
}

void goToPostStatusStartConversationPage(BuildContext context,
    {@required List<IAccount> conversationAccountsWithoutMe}) async {
  var foundConversation;

  // todo: move find conversation logic outside this class
  var pleromaConversationService =
      IPleromaConversationService.of(context, listen: false);

  List<IPleromaConversation> foundRemoteConversations;
  if (pleromaConversationService.isApiReadyToUse) {
    await doAsyncOperationWithDialog(
        context: context,
        asyncCode: () async {
          foundRemoteConversations =
              await pleromaConversationService.getConversations(
                  recipientsIds: conversationAccountsWithoutMe
                      .map((account) => account.remoteId)
                      .toList(),
                  limit: 1);

          var remoteConversation = foundRemoteConversations?.isNotEmpty == true
              ? foundRemoteConversations.first
              : null;

          if (remoteConversation != null) {
            var conversationRepository =
                IConversationRepository.of(context, listen: false);

            await conversationRepository
                .upsertRemoteConversation(remoteConversation);
            foundConversation = await conversationRepository
                .findByRemoteId(remoteConversation.id);
          }
        });
  }

  if (foundConversation != null) {
    var accountRepository = IAccountRepository.of(context, listen: false);

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    var conversationAccounts = await accountRepository.getConversationAccounts(
        conversation: foundConversation);
    var conversationAccountsWithoutMe = conversationAccounts
        .where((account) => !myAccountBloc.checkAccountIsMe(account))
        .toList();

    goToConversationPage(context,
        conversation: foundConversation,
        conversationAccountsWithoutMe: conversationAccountsWithoutMe);
  } else {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DisposableProvider<IPostStatusBloc>(
              create: (context) =>
                  PostStatusStartConversationBloc.createFromContext(context,
                      conversationAccountsWithoutMe:
                          conversationAccountsWithoutMe),
              child: PostStatusStartConversationPage())),
    );
  }
}
