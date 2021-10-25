import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusCachedPaginationBloc extends CachedUnifediPaginationBloc<IStatus>
    implements IStatusCachedPaginationBloc {
  final IStatusCachedListBloc statusListService;

  StatusCachedPaginationBloc({
    required this.statusListService,
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required IConnectionService connectionService,
  }) : super(
          connectionService: connectionService,
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  @override
  IUnifediApiService get unifediApi => statusListService.unifediApi;

  @override
  Future<List<IStatus>> loadLocalItems({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IStatus>? olderPage,
    required CachedPaginationPage<IStatus>? newerPage,
  }) =>
      statusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items.first,
        olderThan: newerPage?.items.last,
      );

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required CachedPaginationPage<IStatus>? olderPage,
    required CachedPaginationPage<IStatus>? newerPage,
  }) async {
    assert(
      !(pageIndex > 0 && olderPage == null && newerPage == null),
      'cant refresh not first page without actual items bounds',
    );

    return statusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items.first,
      olderThan: newerPage?.items.last,
    );
  }

  static StatusCachedPaginationBloc createFromContext(
    BuildContext context, {
    int? maximumCachedPagesCount,
  }) =>
      StatusCachedPaginationBloc(
        connectionService: Provider.of<IConnectionService>(
          context,
          listen: false,
        ),
        statusListService: Provider.of<IStatusCachedListBloc>(
          context,
          listen: false,
        ),
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
      DisposableProvider<IStatusCachedPaginationBloc>(
        create: (context) => StatusCachedPaginationBloc.createFromContext(
          context,
          maximumCachedPagesCount: maximumCachedPagesCount,
        ),
        child: StatusCachedPaginationBlocProxyProvider(
          child: child,
        ),
      );
}
