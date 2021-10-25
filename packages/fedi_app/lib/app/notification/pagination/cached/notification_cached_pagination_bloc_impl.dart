import 'package:collection/collection.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/app/notification/pagination/cached/notification_cached_pagination_bloc.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class NotificationCachedPaginationBloc
    extends CachedUnifediPaginationBloc<INotification>
    implements INotificationCachedPaginationBloc {
  final INotificationCachedListBloc notificationListService;

  NotificationCachedPaginationBloc({
    required this.notificationListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => notificationListService.unifediApi;

  @override
  Future<List<INotification>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<INotification>? olderPage,
    required CachedPaginationPage<INotification>? newerPage,
  }) =>
      notificationListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.firstOrNull,
        olderThan: newerPage?.items.lastOrNull,
      );

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<INotification>? olderPage,
    required CachedPaginationPage<INotification>? newerPage,
  }) async {
    assert(
      !(pageIndex > 0 && olderPage == null && newerPage == null),
      'cant refresh not first page without actual items bounds',
    );

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
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
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
  }) =>
      DisposableProvider<
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
