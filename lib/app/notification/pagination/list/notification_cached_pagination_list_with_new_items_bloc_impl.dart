import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NotificationCachedPaginationListWithNewItemsBloc<
        TPage extends CachedPaginationPage<INotification>>
    extends CachedPaginationListWithNewItemsBloc<TPage, INotification> {
  final INotificationCachedListBloc cachedListBloc;

  NotificationCachedPaginationListWithNewItemsBloc({
    required bool mergeNewItemsImmediately,
    required this.cachedListBloc,
    required ICachedPaginationBloc<TPage, INotification> cachedPaginationBloc,
  }) : super(
          mergeNewItemsImmediately: mergeNewItemsImmediately,
          paginationBloc: cachedPaginationBloc,
        );

  @override
  Stream<List<INotification>> watchItemsNewerThanItem(INotification item) =>
      cachedListBloc.watchLocalItemsNewerThanItem(item);

  @override
  int compareItemsToSort(INotification? a, INotification? b) {
    if (a == null && b == null) {
      return 0;
    } else if (a != null && b == null) {
      return 1;
    } else if (a == null && b != null) {
      return -1;
    } else {
      return a!.createdAt.compareTo(b!.createdAt);
    }
  }

  @override
  bool isItemsEqual(INotification a, INotification b) =>
      a.remoteId == b.remoteId;

  static Widget
      provideToContext<TPage extends CachedPaginationPage<INotification>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required Widget child,
  }) {
    return DisposableProvider<
        ICachedPaginationListWithNewItemsBloc<TPage, INotification>>(
      create: (context) => NotificationCachedPaginationListWithNewItemsBloc
          .createFromContext<TPage>(
        context,
        mergeNewItemsImmediately: mergeNewItemsImmediately,
      ),
      child: ProxyProvider<
          ICachedPaginationListWithNewItemsBloc<TPage, INotification>,
          ICachedPaginationListWithNewItemsBloc>(
        update: (context, value, previous) => value,
        child: CachedPaginationListWithNewItemsBlocProxyProvider<TPage,
            INotification>(child: child),
      ),
    );
  }

  static NotificationCachedPaginationListWithNewItemsBloc<TPage>
      createFromContext<TPage extends CachedPaginationPage<INotification>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
  }) {
    return NotificationCachedPaginationListWithNewItemsBloc<TPage>(
      mergeNewItemsImmediately: mergeNewItemsImmediately,
      cachedPaginationBloc:
          Provider.of<ICachedPaginationBloc<TPage, INotification>>(
        context,
        listen: false,
      ),
      cachedListBloc: INotificationCachedListBloc.of(
        context,
        listen: false,
      ),
    );
  }
}
