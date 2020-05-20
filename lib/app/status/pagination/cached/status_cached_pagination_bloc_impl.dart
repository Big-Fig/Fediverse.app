import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusCachedPaginationBloc extends CachedPleromaPaginationBloc<IStatus>
    implements IStatusCachedPaginationBloc {
  final IStatusCachedListBloc statusListService;

  StatusCachedPaginationBloc(
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
          @required CachedPaginationPage<IStatus> olderPage,
          @required CachedPaginationPage<IStatus> newerPage}) =>
      statusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IStatus> olderPage,
      @required CachedPaginationPage<IStatus> newerPage}) async {

    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return statusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static StatusCachedPaginationBloc createFromContext(BuildContext context,
          {int itemsCountPerPage = 20, int maximumCachedPagesCount}) =>
      StatusCachedPaginationBloc(
          statusListService:
              Provider.of<IStatusCachedListBloc>(context, listen: false),
          itemsCountPerPage: itemsCountPerPage,
          maximumCachedPagesCount: maximumCachedPagesCount);
}
