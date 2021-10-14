import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_widget.dart';
import 'package:fedi/app/account/acct/account_acct_widget.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/display_name/account_display_name_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_media_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_indicator_item_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/app/account/statuses/favourites/network_only/local/local_account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/favourites/network_only/remote/remote_account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/media_only/cached/account_statuses_media_only_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/media_only/network_only/remote/remote_account_statuses_media_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/pinned_only/network_only/local/local_account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/pinned_only/network_only/remote/remote_account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/with_replies/cached/account_statuses_with_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/with_replies/network_only/remote/remote_account_statuses_with_replies_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/without_replies/cached/account_statuses_without_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/without_replies/network_only/remote/remote_account_statuses_without_replies_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/search_page.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/provider/tab_controller_provider.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _headerBackgroundHeight = 200.0;

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
  const AccountDetailsPageBody();

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    var isRemote = accountBloc.instanceLocation == InstanceLocation.remote;

    var currentUnifediApiAccessBloc = ICurrentUnifediApiAccessBloc.of(context);
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
              children: [
                const AccountDisplayNameWidget(),
                const AccountAcctWidget(),
              ],
            ),
            if (isRemote && currentInstance != null)
              const _AccountDetailsPageAppBarOpenOnLocalInstanceAction(),
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: _headerBackgroundHeight,
            child: const AccountHeaderBackgroundWidget(),
          ),
          const _AccountDetailsPageBodyContent(),
        ],
      ),
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
      icon: Icon(FediIcons.search),
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
  const _AccountDetailsPageBodyContent();

  @override
  Widget build(BuildContext context) {
    var tabController = Provider.of<TabController>(context);
    var accountDetailsBloc = IAccountDetailsBloc.of(context);
    var tabs = accountDetailsBloc.tabs;

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
          child: FediNestedScrollViewWithNestedScrollableTabsWidget(
            onLongScrollUpTopOverlayWidget: null,
            // todo: refactor
            // ignore: no-magic-number
            topSliverScrollOffsetToShowWhiteStatusBar: 100,
            topSliverWidgets: [
              const _AccountDetailsNestedScrollViewHeader(),
            ],
            tabKeyPrefix: 'AccountDetailsPage',
            tabBodyProviderBuilder:
                (BuildContext context, int index, Widget child) =>
                    buildBodyProvider(
              context: context,
              tab: tabs[index],
              child: child,
            ),
            tabBodyContentBuilder: (BuildContext context, int index) =>
                buildTabBodyContent(
              context,
              tabs[index],
            ),
            tabBodyOverlayBuilder: (BuildContext context, int index) =>
                buildTabBodyOverlay(
              context: context,
              tab: tabs[index],
            ),
            tabBarViewContainerBuilder: null,
          ),
        ),
      ),
    );
  }

  Widget buildBodyProvider({
    required BuildContext context,
    required AccountStatusesTab tab,
    required Widget child,
  }) =>
      Builder(
        builder: (context) {
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
        },
      );

  Widget buildTabBodyContent(
    BuildContext context,
    AccountStatusesTab tab,
  ) {
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

  Widget buildTabBodyOverlay({
    required BuildContext context,
    required AccountStatusesTab tab,
  }) {
    var accountBloc = IAccountBloc.of(context, listen: false);

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
    duration: Duration(milliseconds: 500),
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
