import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_impl.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class CachedPleromaPaginationBloc<TItem>
    extends CachedPaginationBloc<CachedPaginationPage<TItem>, TItem>
    implements ICachedPleromaPaginationBloc<TItem> {
  CachedPleromaPaginationBloc({
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  IPleromaApi get pleromaApi;

  @override
  bool get isPossibleToLoadFromNetwork => pleromaApi.isApiReadyToUse;

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
