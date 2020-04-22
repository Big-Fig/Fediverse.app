import 'package:fedi/refactored/app/notification/list/notification_list_item_widget.dart';
import 'package:fedi/refactored/app/notification/notification_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_bloc_impl.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/app/notification/pagination/list/notification_pagination_list_base_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPaginationListWidget
    extends NotificationPaginationListBaseWidget {
  final bool needWatchLocalRepositoryForUpdates;
  NotificationPaginationListWidget(
      {@required Key key, @required this.needWatchLocalRepositoryForUpdates})
      : super(key: key);

  @override
  ScrollView buildItemsCollectionView(
          {@required BuildContext context,
          @required List<INotification> items,
          @required Widget header,
          @required Widget footer}) =>
      PaginationListWidget.buildItemsListView(
          context: context,
          items: items,
          header: header,
          footer: footer,
          itemBuilder: (context, index) => Provider<INotification>.value(
                value: items[index],
                child:
                    DisposableProxyProvider<INotification, INotificationBloc>(
                        update: (context, notification, oldValue) =>
                            NotificationBloc.createFromContext(
                                context, notification,
                                needWatchLocalRepositoryForUpdates:
                                    needWatchLocalRepositoryForUpdates),
                        child: NotificationListItemWidget()),
              ));
}
