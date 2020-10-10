import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_bloc_impl.dart';
import 'package:fedi/app/account/select/multi/multi_select_account_widget.dart';
import 'package:fedi/app/account/select/select_account_list_bloc.dart';
import 'package:fedi/app/account/select/select_account_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/select/select_account_pagination_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/share/select/share_select_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShareSelectAccountWidget extends StatelessWidget {
  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;

  ShareSelectAccountWidget({
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  });

  @override
  Widget build(BuildContext context) {
    var shareSelectAccountBloc =
        IShareSelectAccountBloc.of(context, listen: false);

    return Provider<ISelectAccountListBloc>.value(
      value: shareSelectAccountBloc.selectAccountListBloc,
      child: SelectAccountListBlocProxyProvider(
        child: AccountCachedPaginationBloc.provideToContext(
          context,
          child: SelectAccountPaginationListBloc.provideToContext(
            context,
            child: MultiSelectAccountBloc.provideToContext(
              context,
              accountsListSelectedCallback: (context, accounts) {
                shareSelectAccountBloc.changeAccounts(accounts);
              },
              child: MultiSelectAccountWidget(
                header: Column(
                  children: [
                    header,
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SearchInputWidget(),
                    ),
                  ],
                ),
                footer: footer,
                alwaysShowHeader: alwaysShowHeader,
                alwaysShowFooter: alwaysShowFooter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
