import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTabTextTabIndicatorItemWidget extends StatelessWidget {
  final List<NotificationTab> notificationTabs;
  final TabController tabController;

  NotificationTabTextTabIndicatorItemWidget({
    @required this.notificationTabs,
    @required this.tabController,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: FediSizes.bigPadding),
        child: FediIconTabIndicatorWidget(
          tabController: tabController,
          tabs: notificationTabs,
          tabToIconMapper: (BuildContext context, NotificationTab tab) =>
              mapTabToIconData(context, tab),
          expand: true,
        ),
      );

  static IconData mapTabToIconData(BuildContext context, NotificationTab tab) {
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
}
