import 'package:fedi/refactored/app/home/tab/notifications/notifications_home_tab_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class INotificationsHomeTabBloc extends Disposable {
  static INotificationsHomeTabBloc of(BuildContext context, {listen: true}) =>
      Provider.of<INotificationsHomeTabBloc>(context, listen: listen);

  NotificationTab get selectedTab;

  Stream<NotificationTab> get selectedTabStream;

//
//  IStatusPaginationListBloc retrieveNotificationTabPaginationListBloc(
//      NotificationTab tab);

  void selectTab(NotificationTab tab);
}
