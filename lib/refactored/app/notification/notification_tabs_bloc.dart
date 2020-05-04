import 'package:fedi/refactored/app/notification/notification_tabs_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class INotificationsTabsBloc extends Disposable {
  static INotificationsTabsBloc of(BuildContext context, {listen: true}) =>
      Provider.of<INotificationsTabsBloc>(context, listen: listen);

  List<NotificationTab> get tabs;

  NotificationTab get selectedTab;

  Stream<NotificationTab> get selectedTabStream;

  void selectTab(NotificationTab tab);
}
