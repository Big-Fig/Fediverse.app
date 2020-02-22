import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/app/pagination/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/timeline_pagination_bloc.dart';
import 'package:fedi/app/timeline/timeline_service.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/cupertino.dart';

class TimelinePaginationBloc extends CachedPleromaPaginationBloc<IStatus>
    implements ITimelinePaginationBloc {
  final ITimelineService timelineService;

  TimelinePaginationBloc(
      {
        @required this.timelineService,
        @required int itemsCountPerPage, @required int maximumCachedPagesCount})
      : super(
      maximumCachedPagesCount: maximumCachedPagesCount,
      itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => timelineService.pleromaApi;

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IStatus> previousPage,
      @required CachedNetworkPaginationPage<IStatus> nextPage}) {
    return timelineService.loadLocalItems(
      limit: itemsCountPerPage,
      newerThanStatus: previousPage?.items?.last,
      olderThanStatus: nextPage?.items?.first,
    );
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedNetworkPaginationPage<IStatus> previousPage,
      @required CachedNetworkPaginationPage<IStatus> nextPage}) async{

    await timelineService.refresh();

    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && previousPage == null && nextPage == null));

    return timelineService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThanStatus: previousPage?.items?.last,
      olderThanStatus: nextPage?.items?.first,
    );
  }
}
