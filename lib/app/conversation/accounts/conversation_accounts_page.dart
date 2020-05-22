import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/conversation/accounts/conversation_accounts_widget.dart';
import 'package:fedi/app/conversation/conversation_bloc.dart';
import 'package:fedi/app/conversation/conversation_bloc_impl.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: AppLocalizations.of(context)
            .tr("app.conversation.accounts.title"),
      ),
      body: ConversationAccountsWidget(),
    );
  }
}

void goToConversationAccountsPage(
    BuildContext context, IConversation conversation) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IConversationBloc>(
            create: (context) => ConversationBloc.createFromContext(context,
                conversation: conversation),
            child: ConversationAccountsPage())),
  );
}
