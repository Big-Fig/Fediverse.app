import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/account_list_item_widget.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_bloc.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentSelectAccountWidget extends StatelessWidget {
  final List<Widget> itemActions;
  final EdgeInsets itemPadding;

  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;

  const RecentSelectAccountWidget({
    @required this.itemActions,
    @required this.itemPadding,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  });

  @override
  Widget build(BuildContext context) {
    var recentSelectAccountBloc = IRecentSelectAccountBloc.of(context);
    return StreamBuilder<RecentSelectAccountList>(
      stream: recentSelectAccountBloc.recentSelectAccountListStream,
      initialData: recentSelectAccountBloc.recentSelectAccountList,
      builder: (context, snapshot) {
        var recentSelectAccountList = snapshot.data;

        var recentItems = recentSelectAccountList?.recentItems
            ?.map((remoteAccount) =>
                mapRemoteAccountToLocalAccount(remoteAccount))
            ?.toList();

        return Provider<List<IAccount>>.value(
          value: recentItems,
          child: _RecentSelectAccountListWidget(
            itemActions: itemActions,
            itemPadding: itemPadding,
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (header != null) header,
                Padding(
                  padding: FediPadding.allMediumPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _RecentSelectAccountHeaderWidget(),
                      const FediSmallVerticalSpacer(),
                      const FediUltraLightGreyDivider(),
                    ],
                  ),
                )
              ],
            ),
            footer: footer,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
          ),
        );
      },
    );
  }
}

class _RecentSelectAccountHeaderWidget extends StatelessWidget {
  const _RecentSelectAccountHeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).app_account_select_recent_header,
          style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
        ),
      ],
    );
  }
}

class _RecentSelectAccountListWidget extends StatelessWidget {
  final List<Widget> itemActions;
  final EdgeInsets itemPadding;

  final bool alwaysShowHeader;
  final Widget header;
  final bool alwaysShowFooter;
  final Widget footer;

  const _RecentSelectAccountListWidget({
    Key key,
    @required this.itemActions,
    @required this.itemPadding,
    this.header,
    this.footer,
    this.alwaysShowHeader,
    this.alwaysShowFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recentItems = Provider.of<List<IAccount>>(context);

    var recentItemsIsNotEmpty = recentItems?.isNotEmpty == true;

    if (recentItemsIsNotEmpty) {
      return ListView(
        children: [
          if (header != null) header,
          ...recentItems.map(
            (account) => Provider.value(
              value: account,
              child: DisposableProxyProvider<IAccount, IAccountBloc>(
                update: (context, account, _) => AccountBloc.createFromContext(
                  context,
                  account: account,
                  isNeedWatchWebSocketsEvents: false,
                  isNeedRefreshFromNetworkOnInit: false,
                  isNeedPreFetchRelationship: false,
                  isNeedWatchLocalRepositoryForUpdates: false,
                ),
                child: AccountListItemWidget(
                  accountSelectedCallback: null,
                  accountActions: itemActions,
                  padding: itemPadding,
                ),
              ),
            ),
          ),
          if (footer != null) footer,
        ],
      );
    } else {
      return Column(
        children: [
          if (alwaysShowHeader && header != null) header,
          const _RecentSelectAccountListEmptyWidget(),
          if (alwaysShowFooter && footer != null) footer,
        ],
      );
    }
  }
}

class _RecentSelectAccountListEmptyWidget extends StatelessWidget {
  const _RecentSelectAccountListEmptyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediEmptyWidget(
        title: S.of(context).app_account_select_recent_empty,
      ),
    );
  }
}
