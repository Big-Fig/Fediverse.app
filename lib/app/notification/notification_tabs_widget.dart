import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_model.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_widget.dart';
import 'package:fedi/app/notification/pagination/list/notification_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/home/fedi_home_tab_container_widget.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_container_with_overlay_widget.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc.dart';
import 'package:fedi/ui/scroll_direction_detector_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("notification_tabs_widget.dart");

class NotificationTabsWidget extends StatelessWidget {
  final List<Widget> appBarActionWidgets;

  const NotificationTabsWidget(
      {@required Key key, @required this.appBarActionWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var notificationsTabsBloc =
        INotificationsTabsBloc.of(context, listen: false);

    var tabs = notificationsTabsBloc.tabs;

    return DefaultTabController(
        length: tabs.length,
        initialIndex: tabs.indexOf(notificationsTabsBloc.selectedTab),
        child: FediHomeTabContainer(
          topHeaderHeightInSafeArea:
              FediSizes.headerImageSingleRowSafeAreaHeight,
          topBar: buildTabBar(context, tabs, notificationsTabsBloc),
          body: buildBodyWidget(context),
        ));
  }

  Widget buildTabBar(BuildContext context, List<NotificationTab> tabs,
          INotificationsTabsBloc notificationsTabsBloc) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...tabs.map((tab) => FediIconTab(mapTabToIconData(context, tab),
              index: tabs.indexOf(tab))),
          ...appBarActionWidgets
        ],
      );

  IconData mapTabToIconData(BuildContext context, NotificationTab tab) {
    switch (tab) {
      case NotificationTab.all:
        return FediIcons.notification;
        break;
      case NotificationTab.mentions:
        return FediIcons.chat;
        break;
      case NotificationTab.reblogs:
        return FediIcons.reply;
        break;
      case NotificationTab.favourites:
        return FediIcons.heart;
        break;
      case NotificationTab.follows:
        return FediIcons.add_user;
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildBodyWidget(BuildContext context) {
    var notificationsTabsBloc =
        INotificationsTabsBloc.of(context, listen: false);
    _logger.finest(() => "buildBodyWidget");

    var tabs = notificationsTabsBloc.tabs;

    return TabBarView(
        children: List<Widget>.generate(
      tabs.length,
      (int index) {
        var tab = tabs[index];

        return buildTabBody(context, tab, notificationsTabsBloc);
      },
    ));
  }

  Widget buildTabBody(BuildContext context, NotificationTab tab,
      INotificationsTabsBloc notificationsTabsBloc) {
    List<PleromaNotificationType> excludeTypes = mapTabToExcludeTypes(tab);

    return DisposableProvider<IScrollDirectionDetector>(
      create: (context) {
        var scrollController = ScrollController();
        var scrollDirectionDetector =
            ScrollDirectionDetector(scrollController: scrollController);
        scrollDirectionDetector.addDisposable(
            scrollController: scrollController);
        return scrollDirectionDetector;
      },
      child: DisposableProvider<INotificationCachedListBloc>(
        create: (context) => NotificationCachedListBloc.createFromContext(
            context,
            excludeTypes: excludeTypes),
        child: DisposableProvider<
            IPaginationBloc<PaginationPage<INotification>, INotification>>(
          create: (context) =>
              NotificationCachedPaginationBloc.createFromContext(context),
          child: DisposableProvider<
              IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                  INotification>>(
            create: (context) => NotificationPaginationListWithNewItemsBloc(
                mergeNewItemsImmediately: false,
                paginationBloc: Provider.of(context, listen: false),
                cachedListService:
                    INotificationCachedListBloc.of(context, listen: false)),
            child: ProxyProvider<
                IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                    INotification>,
                IPaginationListBloc<PaginationPage<INotification>,
                    INotification>>(
              update: (context, value, previous) => value,
              child: ProxyProvider<
                  IPaginationListWithNewItemsBloc<PaginationPage<INotification>,
                      INotification>,
                  IPaginationListWithNewItemsBloc>(
                update: (context, value, previous) => value,
                child: PaginationListWithNewItemsContainerWithOverlayWidget(
                  textBuilder: (context, updateItemsCount) => plural(
                      "app.notification.list.new_items.action"
                      ".tap_to_load_new",
                      updateItemsCount),
                  child: DisposableProvider<ICollapsibleBloc>(
                    create: (context) =>
                        CollapsibleBloc.createFromContext(context),
                    child: Stack(
                      children: <Widget>[
                        Builder(
                            builder: (context) =>
                                NotificationPaginationListWidget(
                                  needWatchLocalRepositoryForUpdates: true,
                                  scrollController:
                                      IScrollDirectionDetector.of(context)
                                          .scrollController,
                                  key: PageStorageKey("${tab.toString()}"),
                                )),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ToggleCollapsibleOverlayWidget(),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<PleromaNotificationType> mapTabToExcludeTypes(NotificationTab tab) {
    List<PleromaNotificationType> excludeTypes;

    switch (tab) {
      case NotificationTab.all:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExclude([PleromaNotificationType.pleromaChatMention]);
        break;
      case NotificationTab.mentions:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.mention]);
        break;
      case NotificationTab.reblogs:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.reblog]);
        break;
      case NotificationTab.favourites:
        excludeTypes = pleromaNotificationTypeValues
            .valuesWithExcept([PleromaNotificationType.favourite]);
        break;
      case NotificationTab.follows:
        excludeTypes = pleromaNotificationTypeValues.valuesWithExcept([
          PleromaNotificationType.follow,
          PleromaNotificationType.followRequest,
        ]);
        break;
    }
    return excludeTypes;
  }
}
