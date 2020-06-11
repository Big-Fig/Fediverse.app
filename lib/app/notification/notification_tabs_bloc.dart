import 'package:fedi/app/notification/notification_tabs_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class INotificationTabsBloc extends Disposable {
  static INotificationTabsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationTabsBloc>(context, listen: listen);

  List<NotificationTab> get tabs;

  NotificationTab get selectedTab;

  Stream<NotificationTab> get selectedTabStream;

  void selectTab(NotificationTab tab);
}
