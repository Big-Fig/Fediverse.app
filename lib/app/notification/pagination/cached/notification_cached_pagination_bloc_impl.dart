import 'package:collection/collection.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/notification/pagination/cached/notification_cached_pagination_bloc.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationCachedPaginationBloc
    extends CachedPleromaPaginationBloc<INotification>
    implements INotificationCachedPaginationBloc {
  final INotificationCachedListBloc notificationListService;

  NotificationCachedPaginationBloc({
    required this.notificationListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IPleromaApi get pleromaApi => notificationListService.pleromaApi;

  @override
  Future<List<INotification>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<INotification>? olderPage,
    required CachedPaginationPage<INotification>? newerPage,
  }) {

    return notificationListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.firstOrNull,
        olderThan: newerPage?.items.lastOrNull,
      );
  }

  @override
  Future refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<INotification>? olderPage,
    required CachedPaginationPage<INotification>? newerPage,
  }) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return notificationListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.firstOrNull,
      olderThan: newerPage?.items.lastOrNull,
    );
  }

  static NotificationCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      NotificationCachedPaginationBloc(
        notificationListService:
            Provider.of<INotificationCachedListBloc>(context, listen: false),
        paginationSettingsBloc: IPaginationSettingsBloc.of(
          context,
          listen: false,
        ),
        maximumCachedPagesCount: maximumCachedPagesCount,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    int? maximumCachedPagesCount,
  }) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<INotification>,
            INotification>>(
      create: (context) => NotificationCachedPaginationBloc.createFromContext(
        context,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<INotification>, INotification>(child: child),
    );
  }
}
