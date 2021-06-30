import 'package:fedi/app/notification/list/notification_list_item_widget.dart';
import 'package:fedi/app/notification/notification_bloc.dart';
import 'package:fedi/app/notification/notification_bloc_impl.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPaginationListWidget
    extends FediPaginationListWidget<INotification> {
  final bool needWatchLocalRepositoryForUpdates;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const NotificationPaginationListWidget({
    Key? key,
    required this.needWatchLocalRepositoryForUpdates,
    ScrollController? scrollController,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          scrollController: scrollController,
        );

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<INotification> items,
    required Widget? header,
    required Widget? footer,
  }) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        keyboardDismissBehavior: keyboardDismissBehavior,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) {
          return Provider<INotification>.value(
            value: items[index],
            child: DisposableProxyProvider<INotification, INotificationBloc>(
              update: (context, notification, oldValue) =>
                  NotificationBloc.createFromContext(
                context,
                notification,
                isNeedWatchLocalRepositoryForUpdates:
                    needWatchLocalRepositoryForUpdates,
              ),
              child: Column(
                children: <Widget>[
                  const NotificationListItemWidget(),
                  const FediUltraLightGreyDivider(),
                ],
              ),
            ),
          );
        },
      );

  @override
  IPaginationListBloc<PaginationPage<INotification>, INotification>
      retrievePaginationListBloc(BuildContext context, {required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<CachedPaginationPage<INotification>,
            INotification>>(context, listen: listen);

    return paginationListBloc;
  }
}
