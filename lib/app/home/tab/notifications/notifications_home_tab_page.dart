import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc.dart';
import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_bloc_impl.dart';
import 'package:fedi/app/home/tab/notifications/drawer/notifications_home_tab_page_drawer_widget.dart';
import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/notification/notification_tabs_bloc_impl.dart';
import 'package:fedi/app/notification/notification_tabs_model.dart';
import 'package:fedi/app/notification/notification_tabs_widget.dart';
import 'package:fedi/app/push/subscription/push_subscription_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_transparent_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("notifications_home_tab_page.dart");

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class NotificationsHomeTabPage extends StatelessWidget {
  const NotificationsHomeTabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _logger.finest(() => "build");

    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.transparent,
      endDrawer: DisposableProvider<INotificationsHomeTabPageDrawerBloc>(
        create: (BuildContext context) => NotificationsHomeTabPageDrawerBloc(
            pushSettingsBloc: IPushSubscriptionBloc.of(context, listen: false)),
        child: const NotificationsHomeTabPageDrawerWidget(),
      ),
      body: DisposableProvider<INotificationTabsBloc>(
        create: (context) => NotificationsTabsBloc.createFromContext(context),
        child: Builder(
          builder: (context) {
            return NotificationTabsWidget(
              //          key: key,
              appBarActionWidgets: <Widget>[buildFilterActionButton()],
              startTab: NotificationTab.all,
              tabs: INotificationTabsBloc.of(context).tabs,
            );
          },
        ),
      ),
    );
  }

  Widget buildFilterActionButton() => FediIconInCircleTransparentButton(
        FediIcons.filter,
        onPressed: () {
          _drawerKey.currentState.openEndDrawer();
        },
      );
}
