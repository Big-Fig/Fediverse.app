import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/tab/notification_tab_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class INotificationTabsBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static INotificationTabsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationTabsBloc>(context, listen: listen);

  List<NotificationTab> get tabs;

  NotificationTab? get selectedTab;

  Stream<NotificationTab> get selectedTabStream;

  void selectTab(NotificationTab tab);

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<INotification>,
      INotification> retrieveTimelineTabPaginationListBloc(NotificationTab tab);
}
