import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_impl.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_widget.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.conversation.start.title"),
      ),
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
              DisposableProvider<ISelectAccountCachedListBloc>(
                create: (context) =>
                    SelectAccountCachedListBloc.createFromContext(context,
                        excludeMyAccount: true),
                child: ProxyProvider<ISelectAccountCachedListBloc,
                    IPleromaCachedListBloc<IAccount>>(
                  update: (context, value, previous) => value,
                  child: ProxyProvider<ISelectAccountCachedListBloc,
                      ISearchInputBloc>(
                    update: (context, value, previous) => value.searchInputBloc,
                    child: Provider<IPleromaCachedListBloc<IAccount>>(
                      create: (context) => ISelectAccountCachedListBloc.of(
                          context,
                          listen: false),
                      child: Provider<ISearchInputBloc>(
                        create: (context) => ISelectAccountCachedListBloc.of(
                                context,
                                listen: false)
                            .searchInputBloc,
                        child: DisposableProvider<
                                IPaginationBloc<PaginationPage<IAccount>,
                                    IAccount>>(
                            create: (context) =>
                                AccountCachedPaginationBloc.createFromContext(
                                    context),
                            child:
                                DisposableProvider<IAccountPaginationListBloc>(
                                    create: (context) =>
                                        SelectAccountPaginationListBloc
                                            .createFromContext(context),
                                    child: StartConversationPage())),
                      ),
                    ),
                  ),
                ),
              )));
}
