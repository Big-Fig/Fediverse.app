import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_bloc_impl.dart';
import 'package:fedi_app/pagination/cached/cached_pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class CachedUnifediPaginationBloc<TItem>
    extends CachedPaginationBloc<CachedPaginationPage<TItem>, TItem>
    implements ICachedUnifediPaginationBloc<TItem> {
  final IConnectionService connectionService;
  CachedUnifediPaginationBloc({
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
    required this.connectionService,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  IUnifediApiService get unifediApi;

  @override
  bool get isPossibleToLoadFromNetwork => connectionService.isConnected;

  @override
  CachedPaginationPage<TItem> createPage({
    required int pageIndex,
    required List<TItem> loadedItems,
    required bool isActuallyRefreshed,
  }) =>
      CachedPaginationPage(
        requestedLimitPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        values: loadedItems,
        isActuallyRefreshedFromRemote: isActuallyRefreshed,
      );
}
