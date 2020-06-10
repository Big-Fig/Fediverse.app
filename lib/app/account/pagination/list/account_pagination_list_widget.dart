import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("account_pagination_list_widget.dart");

class AccountPaginationListWidget extends PaginationListWidget<IAccount> {
  final AccountCallback accountSelectedCallback;

  final bool needWatchLocalRepositoryForUpdates;
  const AccountPaginationListWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    this.needWatchLocalRepositoryForUpdates = true,
    @required this.accountSelectedCallback,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter);

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
          itemBuilder: (context, index) {
            var item = items[index];
            _logger.finest(() => "itemBuilder ${item.remoteId}");
            return Provider<IAccount>.value(
              value: item,
              child: DisposableProxyProvider<IAccount, IAccountBloc>(
                  update: (context, account, oldValue) =>
                      AccountBloc.createFromContext(context,
                          isNeedWatchLocalRepositoryForUpdates:
                              needWatchLocalRepositoryForUpdates,
                          account: account,
                          isNeedRefreshFromNetworkOnInit: false,
                          isNeedWatchWebSocketsEvents: false),
                  child: Column(
                    children: [
                      AccountListItemWidget(
                          accountSelectedCallback: accountSelectedCallback),
                      const FediUltraLightGreyDivider()
                    ],
                  )),
            );
          });

  @override
  IPaginationListBloc<PaginationPage<IAccount>, IAccount>
      retrievePaginationListBloc(BuildContext context, {bool listen}) {
    var accountPaginationListBloc =
        IAccountPaginationListBloc.of(context, listen: listen);
    return accountPaginationListBloc;
  }
}
