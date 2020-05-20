import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

class NotificationPaginationListWithNewItemsBloc<
        TPage extends PaginationPage<INotification>>
    extends PaginationListWithNewItemsBloc<TPage, INotification> {
  final INotificationCachedListBloc cachedListService;

  NotificationPaginationListWithNewItemsBloc(
      {@required bool mergeNewItemsImmediately,
      @required this.cachedListService,
      @required IPaginationBloc<TPage, INotification> paginationBloc})
      : super(
            mergeNewItemsImmediately: mergeNewItemsImmediately,
            paginationBloc: paginationBloc);

  @override
  Stream<List<INotification>> watchItemsNewerThanItem(INotification item) {
    return cachedListService.watchLocalItemsNewerThanItem(item);
  }

  @override
  int compareItemsToSort(INotification a, INotification b) {
    if (a == null && b == null) {
      return 0;
    }

    if (a != null && b == null) {
      return -1;
    }
    if (a == null && b != null) {
      return 1;
    }
    return a.createdAt.compareTo(b.createdAt);
  }


  @override
  bool isItemsEqual(INotification a, INotification b) =>
      a.remoteId == b.remoteId;
}
