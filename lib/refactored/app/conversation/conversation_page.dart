import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/accounts/conversation_accounts_page.dart';
import 'package:fedi/refactored/app/conversation/avatar/conversation_avatar_widget.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_widget.dart';
import 'package:fedi/refactored/app/conversation/status/post/conversation_post_status_bloc_impl.dart';
import 'package:fedi/refactored/app/conversation/title/conversation_title_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conversationBloc = IConversationBloc.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: GestureDetector(
          onTap: () {
            goToConversationAccountsPage(
                context, conversationBloc.conversation);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ConversationAvatarWidget(baseAvatarSize: 40),
              SizedBox(
                width: 8,
              ),
              ConversationTitleWidget(),
            ],
          ),
        ),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: ConversationWidget(),
      ),
    );
  }
}

void goToConversationPage(BuildContext context,
    {@required IConversation conversation,
    @required List<IAccount> conversationAccountsWithoutMe}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IConversationBloc>(
            create: (context) {
              var conversationBloc = ConversationBloc.createFromContext(context,
                  conversation: conversation);
              // todo: remove
              conversationBloc.performAsyncInit();
              return conversationBloc;
            },
            child: DisposableProvider<IPostStatusBloc>(
                create: (context) {
                  return ConversationPostStatusBloc.createFromContext(context,
                      conversation: conversation,
                      conversationAccountsWithoutMe:
                          conversationAccountsWithoutMe);
                },
                child: ConversationPage()))),
  );
}

