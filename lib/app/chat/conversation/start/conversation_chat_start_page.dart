import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/single/single_select_account_widget.dart';
import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartConversationChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageCustomAppBar(
          leading: FediBackIconButton(),
          child: SearchInputWidget(
            autofocus: true,
          ),
        ),
        body: const SafeArea(
          child: SingleSelectAccountWidget(
            accountSelectedCallback: _accountSelectedCallback,
          ),
        ),
      );

  const StartConversationChatPage();
}

void _accountSelectedCallback(BuildContext context, IAccount account) {
  goToPostStatusStartConversationPage(
    context,
    conversationAccountsWithoutMe: [account],
  );
}

void goToStartConversationPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => SelectAccountListBloc.provideToContext(
        context,
        excludeMyAccount: true,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: AccountCachedPaginationBloc.provideToContext(
            context,
            child: SelectAccountPaginationListBloc.provideToContext(
              context,
              child: const StartConversationChatPage(),
            ),
          ),
        ),
        customLocalAccountListLoader: null,
        customRemoteAccountListLoader: null,
        followingsOnly: false,
      ),
    ),
  );
}
