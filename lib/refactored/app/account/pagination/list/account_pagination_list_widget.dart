import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_bloc_impl.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/list/account_list_item_widget.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPaginationListWidget extends PaginationListWidget<IAccount> {
  final AccountSelectedCallback accountSelectedCallback;

  final bool needWatchLocalRepositoryForUpdates;
  AccountPaginationListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    RefreshAction additionalRefreshAction,
    this.needWatchLocalRepositoryForUpdates = true,
    @required this.accountSelectedCallback,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
            additionalRefreshAction: additionalRefreshAction);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<IAccount> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<IAccount>.value(
                value: items[index],
                child: DisposableProxyProvider<IAccount, IAccountBloc>(
                    update: (context, account, oldValue) =>
                        AccountBloc.createFromContext(context,
                            needWatchLocalRepositoryForUpdates:
                                needWatchLocalRepositoryForUpdates,
                            account: account,
                            needRefreshFromNetworkOnInit: false),
                    child: AccountListItemWidget(
                        accountSelectedCallback: accountSelectedCallback)),
              ));

  @override
  IPaginationListBloc<PaginationPage<IAccount>, IAccount>
      retrievePaginationListBloc(BuildContext context, {bool listen}) {
    var accountPaginationListBloc =
        IAccountPaginationListBloc.of(context, listen: listen);
    return accountPaginationListBloc;
  }
}
