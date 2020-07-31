import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/chat/accounts/chat_accounts_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.chat.accounts.title"),
      ),
      body: ChatAccountsWidget(),
    );
  }
}

void goToChatAccountsPage(BuildContext context, IChat chat) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IChatBloc>(
            create: (context) => ChatBloc.createFromContext(
                  context,
                  chat: chat,
                  lastChatMessage: null,
                ),
            child: ChatAccountsPage())),
  );
}
