import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/start/status/post_status_start_conversation_bloc_impl.dart';
import 'package:fedi/refactored/app/status/post/new/new_post_status_widget.dart';
import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: NewPostStatusWidget(),
    );
  }
}

void goToPostStatusStartConversationPage(BuildContext context,
    {@required List<IAccount> conversationAccountsWithoutMe}) {
  Navigator.push(
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
