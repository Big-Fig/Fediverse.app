import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pagination/network_only/network_only_pagination_bloc_impl.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';

abstract class NetworkOnlyPleromaPaginationBloc<TItem>
    extends NetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem>
    implements INetworkOnlyPleromaPaginationBloc<TItem> {
  NetworkOnlyPleromaPaginationBloc({
    required int maximumCachedPagesCount,
    required IPaginationSettingsBloc paginationSettingsBloc,
  }) : super(
          maximumCachedPagesCount: maximumCachedPagesCount,
          paginationSettingsBloc: paginationSettingsBloc,
        );

  IPleromaApi get pleromaApi;

  @override
  bool get isPossibleToLoadFromNetwork => pleromaApi.isApiReadyToUse;

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
