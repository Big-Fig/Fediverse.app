import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/home/tab/home_tab_header_bar_widget.dart';
import 'package:fedi/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:fedi/app/notification/list/notification_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_bloc_impl.dart';
import 'package:fedi/app/notification/notification_tabs_bloc_loading_widget.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/app/notification/tab/notification_tab_icon_tab_indicator_item_widget.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/push/settings/edit/instance/edit_instance_push_settings_dialog.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/dialog/actions/fedi_actions_dialog.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_widget.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:fedi/provider/tab_controller_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

const _notificationTabs = [
  NotificationTab.all,
  NotificationTab.mentions,
  NotificationTab.reblogs,
  NotificationTab.favourites,
  NotificationTab.follows,
];

var _logger = Logger('notifications_home_tab_page.dart');

class NotificationsHomeTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      DisposableProvider<INotificationTabsBloc>(
        create: (context) => NotificationsTabsBloc.createFromContext(context),
        child: NotificationTabsBlocLoadingWidget(
          child: TabControllerProvider(
            tabControllerCreator:
                (BuildContext context, TickerProvider tickerProvider) =>
                    TabController(
              vsync: tickerProvider,
              length: _notificationTabs.length,
            ),
            child: const _NotificationsHomeTabPageBody(),
          ),
        ),
      );
}

class _NotificationsHomeTabPageBody extends StatefulWidget {
  const _NotificationsHomeTabPageBody({Key? key}) : super(key: key);

  @override
  _NotificationsHomeTabPageBodyState createState() =>
      _NotificationsHomeTabPageBodyState();
}

class _NotificationsHomeTabPageBodyState
    extends State<_NotificationsHomeTabPageBody> {
  IDisposable? disposable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var tabController = Provider.of<TabController>(context, listen: false);
    var listener = () {
      var tab = _notificationTabs[tabController.index];
      var notificationTabsBloc =
          INotificationTabsBloc.of(context, listen: false);
      var paginationListBloc =
          notificationTabsBloc.retrieveTimelineTabPaginationListBloc(tab);
      if (paginationListBloc.unmergedNewItemsCount > 0) {
        paginationListBloc.mergeNewItems();
      }
      notificationTabsBloc.selectTab(tab);
    };
    tabController.addListener(listener);

    disposable = CustomDisposable(() {
      tabController.removeListener(listener);
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposable?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var notificationsHomeTabBloc = INotificationsHomeTabBloc.of(context);
    var tabController = Provider.of<TabController>(context);

    return Scaffold(
      backgroundColor: fediUiColorTheme.transparent,
      body:
          DisposableProvider<IFediNestedScrollViewWithNestedScrollableTabsBloc>(
        create: (context) => FediNestedScrollViewWithNestedScrollableTabsBloc(
          nestedScrollControllerBloc:
              notificationsHomeTabBloc.nestedScrollControllerBloc,
          tabController: tabController,
        ),
        child: FediNestedScrollViewWithNestedScrollableTabsWidget(
          onLongScrollUpTopOverlayWidget: null,
          topSliverWidgets: const [
            _NotificationsHomeTabPageBodyHeaderWidget(),
          ],
          topSliverScrollOffsetToShowWhiteStatusBar: null,
          tabKeyPrefix: 'NotificationTab',
          tabBodyProviderBuilder:
              (BuildContext context, int index, Widget child) {
            var tab = _notificationTabs[index];

            return _buildTabBodyProvider(context, tab, child);
          },
          tabBodyContentBuilder: (BuildContext context, int index) =>
              FediDarkStatusBarStyleArea(
            child: const NotificationPaginationListWidget(
              needWatchLocalRepositoryForUpdates: true,
            ),
          ),
          tabBodyOverlayBuilder: (BuildContext context, int index) =>
              const NotificationListTapToLoadOverlayWidget(),
          tabBarViewContainerBuilder: (BuildContext context, Widget child) =>
              ClipRRect(
            borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
            child: Container(
              color: IFediUiColorTheme.of(context).white,
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBodyProvider(
    BuildContext context,
    NotificationTab tab,
    Widget child,
  ) {
    _logger.finest(() => '_buildTabBodyProvider tab $tab');

    var timelineTabPaginationListBloc =
        INotificationTabsBloc.of(context, listen: false)
            .retrieveTimelineTabPaginationListBloc(tab);

    return Provider<
        ICachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<INotification>, INotification>>.value(
      value: timelineTabPaginationListBloc,
      child: ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<
              CachedPaginationPage<INotification>, INotification>,
          ICachedPaginationListWithNewItemsBloc>(
        update: (context, value, previous) => value,
        child: CachedPaginationListWithNewItemsBlocProxyProvider<
            CachedPaginationPage<INotification>, INotification>(child: child),
      ),
    );
  }
}

class _NotificationsHomeTabPageBodyHeaderWidget extends StatelessWidget {
  const _NotificationsHomeTabPageBodyHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabController = Provider.of<TabController>(context);

    return FediTabMainHeaderBarWidget(
      leadingWidgets: null,
      content: NotificationTabTextTabIndicatorItemWidget(
        tabController: tabController,
        notificationTabs: _notificationTabs,
      ),
      endingWidgets: const [
        _NotificationsHomeTabPageBodyHeaderMenuButtonWidget(),
      ],
    );
  }
}

class _NotificationsHomeTabPageBodyHeaderMenuButtonWidget
    extends StatelessWidget {
  const _NotificationsHomeTabPageBodyHeaderMenuButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationsHomeTabBloc = INotificationsHomeTabBloc.of(context);

    var configService = IConfigService.of(context);

    return FediIconInCircleBlurredButton(
      FediIcons.menu_vertical,
      onPressed: () {
        FediActionsDialog(
          title: S.of(context).app_notification_all_dialog_title,
          actions: [
            if (configService.pushFcmEnabled)
              _buildPushNotificationsAction(context),
            buildDismissAllAction(context, notificationsHomeTabBloc),
            buildMarkAllAsReadAction(context, notificationsHomeTabBloc),
          ],
        ).show<void>(context);
      },
    );
  }

  DialogAction buildMarkAllAsReadAction(
    BuildContext context,
    INotificationsHomeTabBloc notificationsHomeTabBloc,
  ) =>
      DialogAction(
        label: S.of(context).app_notification_all_dialog_action_markAllAsRead,
        icon: FediIcons.check,
        onAction: (contextDialog) async {
          Navigator.of(contextDialog).pop();

          Future.delayed(
            // ignore: no-magic-number
            Duration(milliseconds: 100),
            () async {
              await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context,
                asyncCode: () async {
                  await notificationsHomeTabBloc.markAllAsRead();
                },
              );
            },
          );
        },
      );

  DialogAction buildDismissAllAction(
    BuildContext context,
    INotificationsHomeTabBloc notificationsHomeTabBloc,
  ) =>
      DialogAction(
        label: S.of(context).app_notification_all_dialog_action_dismissAll,
        icon: FediIcons.delete,
        onAction: (contextDialog) async {
          Navigator.of(contextDialog).pop();

          Future.delayed(
            // todo: refactor
            // ignore: no-magic-number
            Duration(milliseconds: 100),
            () async {
              await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
                context: context,
                asyncCode: () async {
                  await notificationsHomeTabBloc.dismissAll();
                },
              );
            },
          );
        },
      );

  DialogAction _buildPushNotificationsAction(BuildContext context) =>
      DialogAction(
        label:
            S.of(context).app_notification_all_dialog_action_pushNotifications,
        icon: FediIcons.filter,
        onAction: (context) async {
          Navigator.of(context).pop();
          showEditInstancePushSettingsDialog(
            context: context,
          );
        },
      );
}
