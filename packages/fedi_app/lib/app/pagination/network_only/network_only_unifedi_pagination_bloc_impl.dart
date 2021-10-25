import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:fedi_app/pagination/network_only/network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class NetworkOnlyUnifediPaginationBloc<TItem>
    extends NetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem>
    implements INetworkOnlyUnifediPaginationBloc<TItem> {
  final IConnectionService connectionService;
  NetworkOnlyUnifediPaginationBloc({
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
