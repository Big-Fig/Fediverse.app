import 'package:fedi/app/chat/accounts/chat_accounts_widget.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PleromaChatAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_chat_accounts_title,
      ),
      body: const SafeArea(
        child: ChatAccountsWidget(),
      ),
    );
  }

  const PleromaChatAccountsPage();
}

void goToPleromaChatAccountsPage(BuildContext context, IPleromaChat chat) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisposableProvider<IPleromaChatBloc>(
        create: (context) => PleromaChatBloc.createFromContext(
          context,
          chat: chat,
          lastChatMessage: null,
        ),
        child: const PleromaChatAccountsPage(),
      ),
    ),
  );
}
