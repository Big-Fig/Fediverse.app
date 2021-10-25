import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc_proxy_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger =
    Logger('notification_cached_pagination_list_with_new_items_bloc_impl.dart');

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
  Stream<List<INotification>> watchItemsNewerThanItem(INotification? item) {
    _logger.finest(() => 'watchItemsNewerThanItem $item');

    return cachedListBloc.watchLocalItemsNewerThanItem(item);
  }

  static Widget
      provideToContext<TPage extends CachedPaginationPage<INotification>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
    required Widget child,
  }) =>
          DisposableProvider<
              ICachedPaginationListWithNewItemsBloc<TPage, INotification>>(
            create: (context) =>
                NotificationCachedPaginationListWithNewItemsBloc
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

  static NotificationCachedPaginationListWithNewItemsBloc<TPage>
      createFromContext<TPage extends CachedPaginationPage<INotification>>(
    BuildContext context, {
    required bool mergeNewItemsImmediately,
  }) =>
          NotificationCachedPaginationListWithNewItemsBloc<TPage>(
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
