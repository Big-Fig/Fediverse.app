import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_widget.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        leading: FediBackIconButton(),
        child: SearchInputWidget(
          autofocus: true,
        ),
      ),
      body: SafeArea(
        child: SelectAccountWidget(
          accountSelectedCallback: (context, account) {
            goToPostStatusStartConversationPage(context,
                conversationAccountsWithoutMe: [account]);
          },
        ),
      ),
    );
  }
}

void goToStartConversationPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectAccountListBloc.provideToContext(
      context,
      excludeMyAccount: true,
      child: AccountCachedPaginationBloc.provideToContext(
        context,
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: StartConversationPage(),
          ),
        ),
      ),
    )));
}
