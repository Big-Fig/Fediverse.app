import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/notification/notification_tabs_bloc.dart';
import 'package:fedi_app/app/notification/tab/notification_tab_model.dart';
import 'package:fedi_app/app/pagination/cached/cached_pagination_list_with_new_items_unread_badge_bloc_impl.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_bloc.dart';
import 'package:fedi_app/app/ui/badge/bool/fedi_bool_badge_widget.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc_impl.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi_app/app/ui/tab/indicator/icon/fedi_icon_tab_indicator_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class NotificationTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<NotificationTab> notificationTabs;
  final TabController tabController;

  const NotificationTabTextTabIndicatorItemWidget({
    Key? key,
    required this.notificationTabs,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: FediSizes.bigPadding),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;

            return FediFadeShaderMask(
              fadingPercent: fadingPercent,
              fadingColor: IFediUiColorTheme.of(context).darkGrey,
              child: DisposableProvider<IFediTabIndicatorBloc<NotificationTab>>(
                create: (context) => FediTabIndicatorBloc<NotificationTab>(
                  tabController: tabController,
                  items: notificationTabs,
                ),
                child: const _NotificationTabTextTabIndicatorItemBodyWidget(),
              ),
            );
          },
        ),
      );
}

class _NotificationTabTextTabIndicatorItemBodyWidget extends StatelessWidget {
  const _NotificationTabTextTabIndicatorItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconTabIndicatorWidget(
        style: FediTabStyle.bubble,
        customTabBuilder:
            (BuildContext context, Widget child, NotificationTab tab) {
          var notificationTabsBloc = INotificationTabsBloc.of(
            context,
            listen: false,
          );

          var paginationListBloc =
              notificationTabsBloc.retrieveTimelineTabPaginationListBloc(tab);

          return Provider<ICachedPaginationListWithNewItemsBloc>.value(
            value: paginationListBloc,
            child: DisposableProxyProvider<
                ICachedPaginationListWithNewItemsBloc, IFediBoolBadgeBloc>(
              update: (context, cachedPaginationListWithNewItemsBloc, _) =>
                  CachedPaginationListWithNewItemsUnreadBadgeBloc(
                cachedPaginationListWithNewItemsBloc:
                    cachedPaginationListWithNewItemsBloc,
              ),
              child: FediBoolBadgeWidget(
                child: child,
              ),
            ),
          );
        },
        tabToIconMapper: (BuildContext context, NotificationTab? tab) =>
            mapTabToIconData(context, tab!),
        expand: true,
      );
}

IconData mapTabToIconData(BuildContext context, NotificationTab tab) {
  switch (tab) {
    case NotificationTab.all:
      return FediIcons.notification;
    case NotificationTab.mentions:
      return FediIcons.chat;
    case NotificationTab.reblogs:
      return FediIcons.reply;
    case NotificationTab.favourites:
      return FediIcons.heart;
    case NotificationTab.follows:
      return FediIcons.add_user;
  }
}
