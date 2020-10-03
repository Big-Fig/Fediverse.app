import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_widget.dart';
import 'package:fedi/app/account/details/account_details_bloc.dart';
import 'package:fedi/app/account/details/account_details_bloc_impl.dart';
import 'package:fedi/app/account/display_name/account_display_name_and_acct_widget.dart';
import 'package:fedi/app/account/header/account_header_background_widget.dart';
import 'package:fedi/app/account/my/action/my_account_action_list_bottom_sheet_dialog.dart';
import 'package:fedi/app/account/statuses/account_statuses_media_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_indicator_item_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/app/account/statuses/media_only/account_statuses_media_only_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/pinned_only/account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/with_replies/account_statuses_with_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/account/statuses/without_replies/account_statuses_without_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var _headerBackgroundHeight = 200.0;

const _tabs = [
  AccountStatusesTab.withoutReplies,
  AccountStatusesTab.pinned,
  AccountStatusesTab.withReplies,
  AccountStatusesTab.media,
];

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({Key key}) : super(key: key);

  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: _tabs.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FediColors.white,
      appBar: FediSubPageCustomAppBar(
        leading: const FediBackIconButton(),
        child: AccountDisplayNameAndAcctWidget(),
      ),
      body: Stack(
        children: [
          Container(
            height: _headerBackgroundHeight,
            child: const AccountHeaderBackgroundWidget(),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var accountDetailsBloc = IAccountDetailsBloc.of(context, listen: false);
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
            topSliverScrollOffsetToShowWhiteStatusBar: 100,
            topSliverWidgets: [
              FediDarkStatusBarStyleArea(
                child: ClipRRect(
                  borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
                  child: Container(
                    color: FediColors.offWhite,
                    child: FediListTile(
                      isFirstInList: true,
                      child: AccountWidget(
                        onStatusesTapCallback: () {
                          var scrollControllerBloc =
                              IScrollControllerBloc.of(context, listen: false);
                          scrollControllerBloc.scrollController.animateTo(
                            MediaQuery.of(context).size.height / 2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                        footer: _buildTabIndicatorWidget(),
                      ),
                      // special hack to avoid 1px horizontal line on some devices
                      oneSidePadding: FediSizes.bigPadding - 1,
//                    oneSidePadding: FediSizes.smallPadding - 1,
                    ),
                  ),
                ),
              ),
            ],
            tabKeyPrefix: "AccountDetailsPage",
            tabBodyProviderBuilder:
                (BuildContext context, int index, Widget child) => Builder(
              builder: (context) {
                var tab = _tabs[index];

                var accountBloc = IAccountBloc.of(context, listen: false);

                switch (tab) {
                  case AccountStatusesTab.withReplies:
                    return AccountStatusesWithRepliesCachedListBloc
                        .provideToContext(
                      context,
                      account: accountBloc.account,
                      child: StatusCachedPaginationBloc.provideToContext(
                        context,
                        child: StatusCachedPaginationListWithNewItemsBloc
                            .provideToContext(
                          context,
                          mergeNewItemsImmediately: true,
                          child: child,
                          mergeOwnStatusesImmediately: false,
                        ),
                      ),
                    );
                  case AccountStatusesTab.withoutReplies:
                    return AccountStatusesWithoutRepliesListBloc
                        .provideToContext(
                      context,
                      account: accountBloc.account,
                      child: StatusCachedPaginationBloc.provideToContext(
                        context,
                        child: StatusCachedPaginationListWithNewItemsBloc
                            .provideToContext(
                          context,
                          mergeNewItemsImmediately: true,
                          child: child,
                          mergeOwnStatusesImmediately: false,
                        ),
                      ),
                    );
                    break;
                  case AccountStatusesTab.media:
                    return AccountStatusesMediaOnlyCachedListBloc
                        .provideToContext(
                      context,
                      account: accountBloc.account,
                      child: StatusCachedPaginationBloc.provideToContext(
                        context,
                        child: StatusCachedPaginationListWithNewItemsBloc
                            .provideToContext(
                          context,
                          mergeNewItemsImmediately: true,
                          child: child,
                          mergeOwnStatusesImmediately: false,
                        ),
                      ),
                    );
                    break;
                  case AccountStatusesTab.pinned:
                    return AccountStatusesPinnedOnlyNetworkOnlyListBloc
                        .provideToContext(
                      context,
                      account: accountBloc.account,
                      child: StatusNetworkOnlyPaginationBloc.provideToContext(
                        context,
                        child: DisposableProvider<
                            IPaginationListBloc<PaginationPage<IStatus>,
                                IStatus>>(
                          create: (context) => PaginationListBloc<
                              PaginationPage<IStatus>, IStatus>(
                            paginationBloc: Provider.of<
                                IPaginationBloc<PaginationPage<IStatus>,
                                    IStatus>>(context, listen: false),
                          ),
                          child: child,
                        ),
                      ),
                    );
                    break;
                  default:
                    throw "Invalid tab $tab";
                }
              },
            ),
            tabBodyContentBuilder: (BuildContext context, int index) {
              var tab = _tabs[index];

              switch (tab) {
                case AccountStatusesTab.withReplies:
                case AccountStatusesTab.withoutReplies:
                case AccountStatusesTab.pinned:
                  return Container(
                    color: Colors.white,
                    child: CollapsibleOwnerWidget(
                      child: AccountStatusesTimelineWidget(),
                    ),
                  );
                  break;
                case AccountStatusesTab.media:
                  return Container(
                    color: Colors.white,
                    child: AccountStatusesMediaWidget(),
                  );
                  break;
                default:
                  throw "Invalid tab $tab";
              }
            },
            tabBodyOverlayBuilder: (BuildContext context, int index) {
              var tab = _tabs[index];

              switch (tab) {
                case AccountStatusesTab.withReplies:
                case AccountStatusesTab.withoutReplies:
                case AccountStatusesTab.media:
                  return StatusListTapToLoadOverlayWidget();
                  break;
                case AccountStatusesTab.pinned:
                  return SizedBox.shrink();
                  break;
                default:
                  throw "Invalid tab $tab";
              }
            },
            tabBarViewContainerBuilder: null,
          ),
        ),
      ),
    );
  }

  Widget buildAccountChooserButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showMyAccountActionListBottomSheetDialog(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(child: buildCurrentInstanceNameWidget(context)),
          const FediSmallHorizontalSpacer(),
          const Icon(
            FediIcons.chevron_down,
            size: 18.0,
            color: FediColors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTabIndicatorWidget() => Padding(
        padding: const EdgeInsets.only(top: 3.0, right: FediSizes.bigPadding),
        child: AccountTabTextTabIndicatorItemWidget(
          tabController: tabController,
          accountTabs: _tabs,
        ),
      );

  Widget buildCurrentInstanceNameWidget(BuildContext context) {
    var currentInstanceBloc =
        ICurrentAuthInstanceBloc.of(context, listen: false);

    return AutoSizeText(
      currentInstanceBloc.currentInstance.userAtHost,
      minFontSize: FediTextStyles.smallShortBoldWhite.fontSize,
      maxFontSize: FediTextStyles.subHeaderShortBoldWhite.fontSize,
      maxLines: 1,
      style: FediTextStyles.subHeaderShortBoldWhite,
    );
  }
}

void goToAccountDetailsPage(BuildContext context, IAccount account) {
  Navigator.push(
    context,
    createAccountDetailsPageRoute(account),
  );
}

MaterialPageRoute createAccountDetailsPageRoute(IAccount account) {
  return MaterialPageRoute(
      builder: (context) => DisposableProvider<IAccountDetailsBloc>(
            create: (context) => AccountDetailsBloc(),
            child: DisposableProvider<IAccountBloc>(
              create: (context) => AccountBloc.createFromContext(context,
                  isNeedWatchLocalRepositoryForUpdates: true,
                  account: account,
                  isNeedRefreshFromNetworkOnInit: false,
                  isNeedWatchWebSocketsEvents: false,
                  isNeedPreFetchRelationship: true),
              child: const AccountDetailsPage(),
            ),
          ));
}
