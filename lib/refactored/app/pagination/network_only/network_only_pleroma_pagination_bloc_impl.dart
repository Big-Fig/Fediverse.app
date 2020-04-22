import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/refactored/pagination/network_only/network_only_pagination_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';

abstract class NetworkOnlyPleromaPaginationBloc<TItem>
    extends NetworkOnlyPaginationBloc<PaginationPage<TItem>, TItem>
    implements INetworkOnlyPleromaPaginationBloc<TItem> {
  NetworkOnlyPleromaPaginationBloc(
      {@required int itemsCountPerPage, @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  IPleromaApi get pleromaApi;

  @override
  bool get isPossibleToLoadFromNetwork => pleromaApi.isApiReadyToUse;

  @override
  PaginationPage<TItem> createPage(
          {@required int pageIndex,
          @required List<TItem> loadedItems,
          @required int itemsCountPerPage}) =>
      PaginationPage(
        requestedLimitPerPage: itemsCountPerPage,
        pageIndex: pageIndex,
        items: loadedItems,
      );
}
