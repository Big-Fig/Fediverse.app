import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/app/pagination/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/list/status_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/status_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/cupertino.dart';

class StatusPaginationBloc extends CachedPleromaPaginationBloc<IStatus>
    implements IStatusPaginationBloc {
  final IStatusListService statusListService;

  StatusPaginationBloc(
      {@required this.statusListService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => statusListService.pleromaApi;

  @override
  Future<List<IStatus>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedNetworkPaginationPage<IStatus> olderPage,
          @required CachedNetworkPaginationPage<IStatus> newerPage}) =>
      statusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThanStatus: olderPage?.items?.first,
        olderThanStatus: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IStatus> olderPage,
      @required CachedNetworkPaginationPage<IStatus> newerPage}) async {
    await statusListService.preRefreshAllAction();

    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return statusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThanStatus: olderPage?.items?.first,
      olderThanStatus: newerPage?.items?.last,
    );
  }
}
