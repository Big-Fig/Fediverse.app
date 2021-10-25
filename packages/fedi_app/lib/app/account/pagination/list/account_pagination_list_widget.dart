import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/account/list/account_list_item_widget.dart';
import 'package:fedi_app/app/account/local_account_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/remote_account_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_widget.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger('account_pagination_list_widget.dart');

typedef AccountPaginationListItemBuilder = Widget Function(
  BuildContext context,
  AccountCallback? accountSelectedCallback,
  List<Widget>? accountActions,
);

class AccountPaginationListWidget extends FediPaginationListWidget<IAccount> {
  final AccountCallback? accountSelectedCallback;
  final bool needWatchLocalRepositoryForUpdates;
  final List<Widget>? accountActions;
  final AccountPaginationListItemBuilder? customItemBodyBuilder;
  final bool isNeedPreFetchRelationship;
  final EdgeInsets itemPadding;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const AccountPaginationListWidget({
    Key? key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    this.needWatchLocalRepositoryForUpdates = true,
    this.isNeedPreFetchRelationship = false,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
    this.accountActions,
    this.customItemBodyBuilder,
    this.itemPadding = FediPadding.allMediumPadding,
    required this.accountSelectedCallback,
    Widget? customLoadingWidget,
    Widget? customEmptyWidget,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          header: header,
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          customLoadingWidget: customLoadingWidget,
          customEmptyWidget: customEmptyWidget,
          refreshOnFirstLoad: refreshOnFirstLoad,
          isNeedToAddPaddingForUiTests: false,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IAccount> items,
    required Widget? header,
    required Widget? footer,
  }) {
    var accountListBloc = IAccountListBloc.of(context, listen: false);

    var instanceLocation = accountListBloc.instanceLocation;
    var isLocal = instanceLocation == InstanceLocation.local;

    return PaginationListWidget.buildItemsListView(
      keyboardDismissBehavior: keyboardDismissBehavior,
      context: context,
      items: items,
      header: header,
      footer: footer,
      itemBuilder: (context, index) {
        var item = items[index];
        _logger.finest(() => 'itemBuilder ${item.remoteId}');

        return Provider<IAccount>.value(
          value: item,
          child: DisposableProxyProvider<IAccount, IAccountBloc>(
            update: (context, account, oldValue) {
              var isNeedRefreshFromNetworkOnInit = false;
              if (isLocal) {
                return LocalAccountBloc.createFromContext(
                  context,
                  isNeedWatchLocalRepositoryForUpdates:
                      needWatchLocalRepositoryForUpdates,
                  account: account,
                  isNeedRefreshFromNetworkOnInit:
                      isNeedRefreshFromNetworkOnInit,
                  isNeedWatchWebSocketsEvents: false,
                  isNeedPreFetchRelationship: isNeedPreFetchRelationship,
                );
              } else {
                return RemoteAccountBloc.createFromContext(
                  context,
                  account: account,
                  isNeedRefreshFromNetworkOnInit:
                      isNeedRefreshFromNetworkOnInit,
                );
              }
            },
            child: customItemBodyBuilder != null
                ? customItemBodyBuilder!(
                    context,
                    accountSelectedCallback,
                    accountActions,
                  )
                : _AccountPaginationListBodyWidget(
                    accountSelectedCallback: accountSelectedCallback,
                    accountActions: accountActions,
                    itemPadding: itemPadding,
                  ),
          ),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IAccount>, IAccount>
      retrievePaginationListBloc(BuildContext context, {required bool listen}) {
    var accountPaginationListBloc =
        IAccountPaginationListBloc.of(context, listen: listen);

    return accountPaginationListBloc;
  }
}

class _AccountPaginationListBodyWidget extends StatelessWidget {
  final EdgeInsets itemPadding;
  final AccountCallback? accountSelectedCallback;
  final List<Widget>? accountActions;

  const _AccountPaginationListBodyWidget({
    Key? key,
    required this.accountSelectedCallback,
    required this.accountActions,
    required this.itemPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AccountListItemWidget(
        padding: itemPadding,
        accountSelectedCallback: accountSelectedCallback,
        accountActions: accountActions,
      );
}
