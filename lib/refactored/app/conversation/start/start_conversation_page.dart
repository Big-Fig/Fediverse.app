import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/account/select/select_account_list_service_impl.dart';
import 'package:fedi/refactored/app/account/select/select_account_widget.dart';
import 'package:fedi/refactored/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              AppLocalizations.of(context).tr("app.conversation.start.title"))),
      body: SafeArea(
        child: SelectAccountWidget(
          accountSelectedCallback: (account) {
            goToPostStatusStartConversationPage(context,
                conversationAccountsWithoutMe: [account]);
          },
        ),
      ),
    );
  }
}

void goToStartConversationPage(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DisposableProvider<IPleromaCachedListService<IAccount>>(
                create: (context) => SelectAccountListService.createFromContext(
                    context,
                    excludeMyAccount: true),
                child: DisposableProvider<
                        IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                    create: (context) =>
                        AccountCachedPaginationBloc.createFromContext(context),
                    child: DisposableProvider<IAccountPaginationListBloc>(
                        create: (context) =>
                            AccountPaginationListBloc.createFromContext(
                                context),
                        child: StartConversationPage())),
              )));
}
