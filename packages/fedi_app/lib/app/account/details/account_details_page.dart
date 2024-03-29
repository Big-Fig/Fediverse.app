import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_widget.dart';
import 'package:fedi_app/app/account/acct/account_acct_widget.dart';
import 'package:fedi_app/app/account/details/account_details_bloc.dart';
import 'package:fedi_app/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_widget.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_media_widget.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_tab_indicator_item_widget.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi_app/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi_app/app/account/statuses/favourites/network_only/local/local_account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/favourites/network_only/remote/remote_account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/media_only/cached/account_statuses_media_only_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/media_only/network_only/remote/remote_account_statuses_media_only_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/pinned_only/network_only/local/local_account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/pinned_only/network_only/remote/remote_account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/with_replies/cached/account_statuses_with_replies_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/with_replies/network_only/remote/remote_account_statuses_with_replies_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/without_replies/cached/account_statuses_without_replies_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/account/statuses/without_replies/network_only/remote/remote_account_statuses_without_replies_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/search/search_model.dart';
import 'package:fedi_app/app/search/search_page.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi_app/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi_app/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:fedi_app/provider/tab_controller_provider.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context);

    return TabControllerProvider(
      tabControllerCreator: (context, tickerProvider) => TabController(
        vsync: tickerProvider,
        length: accountDetailsBloc.tabs.length,
      ),
      child: const AccountDetailsPageBody(),
    );
  }
}

class AccountDetailsPageBody extends StatelessWidget {
  const AccountDetailsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var isRemote = accountBloc.instanceLocation == InstanceLocation.remote;

    var currentUnifediApiAccessBloc = ICurrentAccessBloc.of(context);
    var currentInstance = currentUnifediApiAccessBloc.currentInstance;

    return Scaffold(
      backgroundColor: IFediUiColorTheme.of(context).white,
      appBar: FediPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AccountDisplayNameWidget(),
                AccountAcctWidget(),
              ],
            ),
            if (isRemote && currentInstance != null)
              const _AccountDetailsPageAppBarOpenOnLocalInstanceAction(),
          ],
        ),
      ),
      body: const _AccountDetailsPageBodyContent(),
    );
  }
}

class _AccountDetailsPageAppBarOpenOnLocalInstanceAction
    extends StatelessWidget {
  const _AccountDetailsPageAppBarOpenOnLocalInstanceAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return FediIconButton(
      color: IFediUiColorTheme.of(context, listen: false).darkGrey,
      icon: const Icon(FediIcons.search),
      onPressed: () {
        goToSearchPage(
          context,
          startTab: SearchTab.accounts,
          initialQuery: '${accountBloc.acctWithForcedRemoteInstanceHost}',
        );
      },
    );
  }
}

class _AccountDetailsPageBodyContent extends StatelessWidget {
  const _AccountDetailsPageBodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabController = Provider.of<TabController>(context);
    var accountDetailsBloc = IAccountDetailsBloc.of(context);

    return DisposableProvider<
        IFediNestedScrollViewWithNestedScrollableTabsBloc>(
      create: (context) => FediNestedScrollViewWithNestedScrollableTabsBloc(
        nestedScrollControllerBloc:
            accountDetailsBloc.nestedScrollControllerBloc,
        tabController: tabController,
      ),
      child: ProxyProvider<IFediNestedScrollViewWithNestedScrollableTabsBloc,
          IFediNestedScrollViewBloc>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IFediNestedScrollViewWithNestedScrollableTabsBloc,
            IScrollControllerBloc>(
          update: (context, value, previous) =>
              value.nestedScrollControllerBloc,
          child: Container(
            color: Colors.green,
            child: const FediNestedScrollViewWithNestedScrollableTabsWidget(
              isNeedAddStatusBarPaddingToTopSliverWidgets: false,
              onLongScrollUpTopOverlayWidget: null,
              // todo: refactor
              // ignore: no-magic-number
              topSliverScrollOffsetToShowWhiteStatusBar: 100,
              topSliverWidgets: [
                _AccountDetailsNestedScrollViewHeader(),
              ],
              tabKeyPrefix: 'AccountDetailsPage',
              tabBodyProviderBuilder: _buildBodyProvider,
              tabBodyContentBuilder: _buildTabBodyContent,
              tabBodyOverlayBuilder: _buildTabBodyOverlay,
              tabBarViewContainerBuilder: null,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildBodyProvider(
    BuildContext context,
    int index,
    Widget child,
  ) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context);
    var tabs = accountDetailsBloc.tabs;
    var tab = tabs[index];

    switch (tab) {
      case AccountStatusesTab.favourites:
        return _AccountDetailsPageBodyTabFavouritesProvider(
          child: child,
        );
      case AccountStatusesTab.withReplies:
        return _AccountDetailsPageBodyTabWithRepliesProvider(
          child: child,
        );

      case AccountStatusesTab.withoutReplies:
        return _AccountDetailsPageBodyTabWithoutRepliesProvider(
          child: child,
        );
      case AccountStatusesTab.media:
        return _AccountDetailsPageBodyTabMediaProvider(
          child: child,
        );
      case AccountStatusesTab.pinned:
        return _AccountDetailsPageBodyTabPinnedProvider(
          child: child,
        );
    }
  }

  static Widget _buildTabBodyContent(
    BuildContext context,
    int index,
  ) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context);
    var tabs = accountDetailsBloc.tabs;
    var tab = tabs[index];

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    switch (tab) {
      case AccountStatusesTab.withReplies:
      case AccountStatusesTab.withoutReplies:
      case AccountStatusesTab.pinned:
      case AccountStatusesTab.favourites:
        return Container(
          color: fediUiColorTheme.white,
          child: const CollapsibleOwnerWidget(
            child: AccountStatusesTimelineWidget(),
          ),
        );
      case AccountStatusesTab.media:
        return Container(
          color: fediUiColorTheme.white,
          child: const AccountStatusesMediaWidget(),
        );
    }
  }

  static Widget _buildTabBodyOverlay(
    BuildContext context,
    int index,
  ) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context);
    var tabs = accountDetailsBloc.tabs;
    var tab = tabs[index];

    var accountBloc = IAccountBloc.of(context);

    var isLocal = accountBloc.instanceLocation == InstanceLocation.local;

    if (isLocal) {
      switch (tab) {
        case AccountStatusesTab.withReplies:
        case AccountStatusesTab.withoutReplies:
        case AccountStatusesTab.media:
          return const StatusListTapToLoadOverlayWidget();
        case AccountStatusesTab.pinned:
        case AccountStatusesTab.favourites:
          return const SizedBox.shrink();
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _AccountDetailsPageBodyTabWithRepliesProvider extends StatelessWidget {
  final Widget child;

  const _AccountDetailsPageBodyTabWithRepliesProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    var instanceLocation = accountBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    if (isLocal) {
      return AccountStatusesWithRepliesCachedListBloc.provideToContext(
        context,
        account: accountBloc.account,
        child: StatusCachedListBlocLoadingWidget(
          child: StatusCachedPaginationBloc.provideToContext(
            context,
            child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: child,
              mergeOwnStatusesImmediately: false,
            ),
          ),
        ),
      );
    } else {
      var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

      return RemoteAccountStatusesWithRepliesNetworkOnlyListBloc
          .provideToContext(
        context,
        account: accountBloc.account,
        child: StatusNetworkOnlyPaginationBloc.provideToContext(
          context,
          child: DisposableProvider<
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            create: (context) =>
                PaginationListBloc<PaginationPage<IStatus>, IStatus>(
              paginationBloc: Provider.of<
                  IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                context,
                listen: false,
              ),
            ),
            child: child,
          ),
        ),
        instanceUri: remoteInstanceBloc.instanceUri,
      );
    }
  }
}

class _AccountDetailsPageBodyTabWithoutRepliesProvider extends StatelessWidget {
  final Widget child;

  const _AccountDetailsPageBodyTabWithoutRepliesProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var instanceLocation = accountBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    if (isLocal) {
      return AccountStatusesWithoutRepliesListBloc.provideToContext(
        context,
        account: accountBloc.account,
        child: StatusCachedListBlocLoadingWidget(
          child: StatusCachedPaginationBloc.provideToContext(
            context,
            child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: child,
              mergeOwnStatusesImmediately: false,
            ),
          ),
        ),
      );
    } else {
      var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

      return RemoteAccountStatusesWithoutRepliesNetworkOnlyListBloc
          .provideToContext(
        context,
        account: accountBloc.account,
        child: StatusNetworkOnlyPaginationBloc.provideToContext(
          context,
          child: DisposableProvider<
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            create: (context) =>
                PaginationListBloc<PaginationPage<IStatus>, IStatus>(
              paginationBloc: Provider.of<
                  IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                context,
                listen: false,
              ),
            ),
            child: child,
          ),
        ),
        instanceUri: remoteInstanceBloc.instanceUri,
      );
    }
  }
}

class _AccountDetailsPageBodyTabMediaProvider extends StatelessWidget {
  final Widget child;

  const _AccountDetailsPageBodyTabMediaProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var instanceLocation = accountBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    if (isLocal) {
      return AccountStatusesMediaOnlyCachedListBloc.provideToContext(
        context,
        account: accountBloc.account,
        child: StatusCachedListBlocLoadingWidget(
          child: StatusCachedPaginationBloc.provideToContext(
            context,
            child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
              context,
              mergeNewItemsImmediately: true,
              child: child,
              mergeOwnStatusesImmediately: false,
            ),
          ),
        ),
      );
    } else {
      var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

      return RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc.provideToContext(
        context,
        account: accountBloc.account,
        child: StatusNetworkOnlyPaginationBloc.provideToContext(
          context,
          child: DisposableProvider<
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            create: (context) =>
                PaginationListBloc<PaginationPage<IStatus>, IStatus>(
              paginationBloc: Provider.of<
                  IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                context,
                listen: false,
              ),
            ),
            child: child,
          ),
        ),
        instanceUri: remoteInstanceBloc.instanceUri,
      );
    }
  }
}

class _AccountDetailsPageBodyTabPinnedProvider extends StatelessWidget {
  final Widget child;

  const _AccountDetailsPageBodyTabPinnedProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var instanceLocation = accountBloc.instanceLocation;

    var isLocal = instanceLocation == InstanceLocation.local;

    var statusNetworkOnlyPaginationWidget =
        StatusNetworkOnlyPaginationBloc.provideToContext(
      context,
      child: DisposableProvider<
          IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
        create: (context) =>
            PaginationListBloc<PaginationPage<IStatus>, IStatus>(
          paginationBloc:
              Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
            context,
            listen: false,
          ),
        ),
        child: child,
      ),
    );

    if (isLocal) {
      return LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc.provideToContext(
        context,
        account: accountBloc.account,
        child: statusNetworkOnlyPaginationWidget,
      );
    } else {
      var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

      return RemoteAccountStatusesPinnedOnlyNetworkOnlyListBloc
          .provideToContext(
        context,
        account: accountBloc.account,
        child: statusNetworkOnlyPaginationWidget,
        instanceUri: remoteInstanceBloc.instanceUri,
      );
    }
  }
}

class _AccountDetailsPageBodyTabFavouritesProvider extends StatelessWidget {
  final Widget child;

  const _AccountDetailsPageBodyTabFavouritesProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var hideFavourites = accountBloc.account.hideFavorites != false;
    if (hideFavourites) {
      return FediEmptyWidget(
        title:
            S.of(context).app_account_statuses_tab_favourites_accessRestricted,
      );
    } else {
      var statusNetworkOnlyPaginationWidget =
          StatusNetworkOnlyPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<
            IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
          create: (context) =>
              PaginationListBloc<PaginationPage<IStatus>, IStatus>(
            paginationBloc:
                Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
              context,
              listen: false,
            ),
          ),
          child: child,
        ),
      );

      var instanceLocation = accountBloc.instanceLocation;

      var isLocal = instanceLocation == InstanceLocation.local;

      if (isLocal) {
        return LocalAccountStatusesFavouritesNetworkOnlyListBloc
            .provideToContext(
          context,
          account: accountBloc.account,
          child: statusNetworkOnlyPaginationWidget,
        );
      } else {
        var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

        return RemoteAccountStatusesFavouritesNetworkOnlyListBloc
            .provideToContext(
          context,
          account: accountBloc.account,
          child: statusNetworkOnlyPaginationWidget,
          instanceUri: remoteInstanceBloc.instanceUri,
        );
      }
    }
  }
}

class _AccountDetailsNestedScrollViewHeader extends StatelessWidget {
  const _AccountDetailsNestedScrollViewHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var myAccountBloc = IMyAccountBloc.of(context);

    var isMyAccount = myAccountBloc.checkAccountIsMe(accountBloc.account);

    return Container(
      color: IFediUiColorTheme.of(context).white,
      child: FediDarkStatusBarStyleArea(
        child: isMyAccount
            ? const MyAccountWidget(
                onStatusesTapCallback: _onStatusesTapCallback,
                footer: _AccountDetailsPageTabIndicatorWidget(),
                brightness: Brightness.light,
              )
            : const AccountWidget(
                onStatusesTapCallback: _onStatusesTapCallback,
                footer: _AccountDetailsPageTabIndicatorWidget(),
              ),
      ),
    );
  }
}

void _onStatusesTapCallback(BuildContext context) {
  var scrollControllerBloc = IScrollControllerBloc.of(context, listen: false);
  scrollControllerBloc.scrollController!.animateTo(
    // ignore: no-magic-number
    MediaQuery.of(context).size.height / 2,
    // todo: refactor
    // ignore: no-magic-number
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

class _AccountDetailsPageTabIndicatorWidget extends StatelessWidget {
  const _AccountDetailsPageTabIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context);
    var tabs = accountDetailsBloc.tabs;

    return AccountTabTextTabIndicatorItemWidget(
      accountTabs: tabs,
    );
  }
}
