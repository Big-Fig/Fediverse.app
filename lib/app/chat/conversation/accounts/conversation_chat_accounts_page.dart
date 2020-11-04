import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/chat/conversation/accounts/conversation_chat_accounts_widget.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationChatAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_conversation_accounts_title,
      ),
      body: SafeArea(child: ConversationChatAccountsWidget()),
    );
  }
}

void goToConversationChatAccountsPage(
    BuildContext context, IConversationChat conversation) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IConversationChatBloc>(
            create: (context) => ConversationChatBloc.createFromContext(context,
                conversation: conversation),
            child: ConversationChatAccountsPage())),
  );
}
