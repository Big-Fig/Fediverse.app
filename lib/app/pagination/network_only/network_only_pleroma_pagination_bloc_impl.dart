import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class NetworkOnlyPleromaPaginationBloc<TItem>
    extends NetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem>
    implements INetworkOnlyPleromaPaginationBloc<TItem> {
  NetworkOnlyPleromaPaginationBloc({
    required IPaginationSettingsBloc paginationSettingsBloc,
    required int? maximumCachedPagesCount,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  IUnifediApiService get unifediApi;

  @override
  bool get isPossibleToLoadFromNetwork => unifediApi.isApiReadyToUse;

  @override
  PaginationPage<TItem> createPage({
    required int pageIndex,
    required List<TItem> loadedItems,
    required int? itemsCountPerPage,
  }) =>
      PaginationPage(
        requestedLimitPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        items: loadedItems,
      );
}
