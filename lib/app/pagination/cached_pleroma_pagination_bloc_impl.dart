import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/app/pagination/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/pagination/network/cached_network_pagination_bloc_impl.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class CachedPleromaPaginationBloc<TItem>
    extends CachedNetworkPaginationBloc<CachedNetworkPaginationPage<TItem>,
        TItem> implements ICachedPleromaPaginationBloc<TItem> {

  CachedPleromaPaginationBloc(
      {@required int itemsCountPerPage, @required int maximumCachedPagesCount})
      : super(
      maximumCachedPagesCount: maximumCachedPagesCount,
      itemsCountPerPage: itemsCountPerPage);

  IPleromaApi get pleromaApi;

  @override
  bool get isPossibleToLoadFromNetwork => pleromaApi.isApiReadyoUse;

  @override
  CachedNetworkPaginationPage<TItem> createPage(
      {@required int pageIndex,
      @required List<TItem> loadedItems,
      @required bool isActuallyRefreshed}) {
    return CachedNetworkPaginationPage(
        requestedLimitPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        values: loadedItems,
        isActuallyRefreshedFromRemote: isActuallyRefreshed);
  }
}
