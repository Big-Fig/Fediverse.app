import 'package:fedi/refactored/app/conversation/accounts/conversation_accounts_widget.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ), // todo: localization
        title: Text("Conversation users"),
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
