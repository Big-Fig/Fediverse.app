import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/my/edit/edit_my_account_page.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_media_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_indicator_item_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/app/account/statuses/media_only/account_statuses_media_only_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/pinned_only/account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/with_replies/account_statuses_with_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/without_replies/account_statuses_without_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi/app/home/tab/account/menu/account_home_tab_menu_dialog.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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

const _tabs = [
  AccountStatusesTab.withoutReplies,
  AccountStatusesTab.pinned,
  AccountStatusesTab.media,
  AccountStatusesTab.withReplies,
];

class AccountHomeTabPage extends StatelessWidget {
  const AccountHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabControllerProvider(
      tabControllerCreator:
          (BuildContext context, TickerProvider tickerProvider) =>
              TabController(
        vsync: tickerProvider,
        length: _tabs.length,
      ),
      child: Scaffold(
        backgroundColor: IFediUiColorTheme.of(context).white,
        body: Stack(
          children: [
            ProxyProvider<IMyAccountBloc, IAccountBloc>(
              update: (context, value, previous) => value,
              child: Container(
                height: _headerBackgroundHeight,
                child: const AccountHeaderBackgroundWidget(),
              ),
            ),
            const _AccountHomeTabPageBody(),
          ],
        ),
      ),
    );
  }
}

class _AccountHomeTabPageBody extends StatelessWidget {
  const _AccountHomeTabPageBody();

  @override
  Widget build(BuildContext context) {
    var accountHomeTabBloc = IAccountHomeTabBloc.of(context, listen: false);
    var tabController = Provider.of<TabController>(context);
    return DisposableProvider<
        IFediNestedScrollViewWithNestedScrollableTabsBloc>(
      create: (context) => FediNestedScrollViewWithNestedScrollableTabsBloc(
        nestedScrollControllerBloc:
            accountHomeTabBloc.nestedScrollControllerBloc,
        tabController: tabController,
      ),
      child: FediNestedScrollViewWithNestedScrollableTabsWidget(
        onLongScrollUpTopOverlayWidget: null,
        topSliverScrollOffsetToShowWhiteStatusBar: 100,
        topSliverWidgets: [
          const _AccountHomeTabFediTabMainHeaderBarWidget(),
          const _AccountHomeTabMyAccountWidget(),
        ],
        tabKeyPrefix: "AccountHomeTabPage",
        tabBodyProviderBuilder:
            (BuildContext context, int index, Widget child) =>
                buildTabBodyProvider(index, child),
        tabBodyContentBuilder: (BuildContext context, int index) => Container(
          color: IFediUiColorTheme.of(context).offWhite,
          child: _buildTabContent(_tabs[index]),
        ),
        tabBodyOverlayBuilder: (BuildContext context, int index) =>
            _buildTabOverlay(_tabs[index]),
        tabBarViewContainerBuilder: null,
      ),
    );
  }

  Widget buildTabBodyProvider(int index, Widget child) {
    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (context, value, previous) => value,
      child: Builder(
        builder: (context) {
          var tab = _tabs[index];

          switch (tab) {
            case AccountStatusesTab.withReplies:
              return _AccountHomeTabProviderWithRepliesTabProviderWidget(
                child: child,
              );
            case AccountStatusesTab.withoutReplies:
              return _AccountHomeTabProviderWithoutRepliesTabProviderWidget(
                child: child,
              );

              break;
            case AccountStatusesTab.media:
              return _AccountHomeTabProviderMediaTabProviderWidget(
                child: child,
              );

              break;
            case AccountStatusesTab.pinned:
              return _AccountHomeTabProviderPinnedTabProviderWidget(
                child: child,
              );

              break;
            default:
              throw "Invalid tab $tab";
          }
        },
      ),
    );
  }

  Widget _buildTabOverlay(AccountStatusesTab tab) {
    switch (tab) {
      case AccountStatusesTab.withReplies:
      case AccountStatusesTab.withoutReplies:
      case AccountStatusesTab.media:
        return const StatusListTapToLoadOverlayWidget();
        break;
      case AccountStatusesTab.pinned:
        return const SizedBox.shrink();
        break;
      default:
        throw "Invalid tab $tab";
    }
  }

  Widget _buildTabContent(AccountStatusesTab tab) {
    switch (tab) {
      case AccountStatusesTab.withReplies:
      case AccountStatusesTab.withoutReplies:
      case AccountStatusesTab.pinned:
        return const CollapsibleOwnerWidget(
          child: AccountStatusesTimelineWidget(),
        );
        break;
      case AccountStatusesTab.media:
        return const AccountStatusesMediaWidget();
        break;
      default:
        throw "Invalid tab $tab";
    }
  }
}

class _AccountHomeTabMyAccountWidget extends StatelessWidget {
  const _AccountHomeTabMyAccountWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IMyAccountBloc, IAccountBloc>(
      update: (context, value, previous) => value,
      child: FediDarkStatusBarStyleArea(
        child: ClipRRect(
          borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
          child: Container(
            color: IFediUiColorTheme.of(context).offWhite,
            child: FediListTile(
              isFirstInList: true,
              child: MyAccountWidget(
                onStatusesTapCallback: _onStatusesTapCallback,
              ),
              // special hack to avoid 1px horizontal line on some devices
              oneSidePadding: FediSizes.bigPadding - 1,
//                    oneSidePadding: FediSizes.smallPadding - 1,
            ),
          ),
        ),
      ),
    );
  }
}

void _onStatusesTapCallback(BuildContext context) {
  var scrollControllerBloc = IScrollControllerBloc.of(context, listen: false);
  scrollControllerBloc.scrollController.animateTo(
    MediaQuery.of(context).size.height / 2,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

class _AccountHomeTabProviderWithRepliesTabProviderWidget
    extends StatelessWidget {
  final Widget child;

  const _AccountHomeTabProviderWithRepliesTabProviderWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
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
  }
}

class _AccountHomeTabProviderWithoutRepliesTabProviderWidget
    extends StatelessWidget {
  final Widget child;

  const _AccountHomeTabProviderWithoutRepliesTabProviderWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
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
  }
}

class _AccountHomeTabProviderMediaTabProviderWidget extends StatelessWidget {
  final Widget child;

  const _AccountHomeTabProviderMediaTabProviderWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
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
  }
}

class _AccountHomeTabProviderPinnedTabProviderWidget extends StatelessWidget {
  final Widget child;

  const _AccountHomeTabProviderPinnedTabProviderWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    return AccountStatusesPinnedOnlyNetworkOnlyListBloc.provideToContext(
      context,
      account: accountBloc.account,
      child: StatusNetworkOnlyPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<
            IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
          create: (context) =>
              PaginationListBloc<PaginationPage<IStatus>, IStatus>(
            paginationBloc:
                Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                    context,
                    listen: false),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _AccountHomeTabCurrentInstanceNameWidget extends StatelessWidget {
  const _AccountHomeTabCurrentInstanceNameWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return AutoSizeText(
      currentInstanceBloc.currentInstance.userAtHost,
      minFontSize: IFediUiTextTheme.of(context).smallShortBoldWhite.fontSize,
      maxFontSize:
          IFediUiTextTheme.of(context).subHeaderShortBoldWhite.fontSize,
      maxLines: 1,
      style: IFediUiTextTheme.of(context).subHeaderShortBoldWhite,
    );
  }
}

class _AccountHomeTabTextIndicatorWidget extends StatelessWidget {
  const _AccountHomeTabTextIndicatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(top: 3.0, right: FediSizes.bigPadding),
        child: AccountTabTextTabIndicatorItemWidget(
          accountTabs: _tabs,
        ),
      );
}

class _AccountHomeTabFediTabMainHeaderBarWidget extends StatelessWidget {
  const _AccountHomeTabFediTabMainHeaderBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediTabMainHeaderBarWidget(
        leadingWidgets: null,
        content: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showMyAccountActionListBottomSheetDialog(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child:
                              const _AccountHomeTabCurrentInstanceNameWidget(),
                        ),
                        const FediSmallHorizontalSpacer(),
                        Icon(
                          FediIcons.chevron_down,
                          size: 18.0,
                          color: IFediUiColorTheme.of(context).white,
                        ),
                      ],
                    ),
                  ),
                ),
                const FediBigHorizontalSpacer(),
                FediIconInCircleBlurredButton(
                  FediIcons.pen,
                  onPressed: () {
                    goToEditMyAccountPage(context);
                  },
                ),
                const FediBigHorizontalSpacer(),
                FediIconInCircleBlurredButton(
                  FediIcons.menu_list,
                  iconSize: 15.0,
                  onPressed: () {
                    showAccountHomeTabMenuDialog(context);
                  },
                ),
              ],
            ),
            const FediSmallVerticalSpacer(),
            const _AccountHomeTabTextIndicatorWidget(),
          ],
        ),
        endingWidgets: null,
      );
}
