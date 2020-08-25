import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc.dart';
import 'package:fedi/app/status/scheduled/pagination/cached/scheduled_status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_bloc_proxy_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ScheduledStatusCachedPaginationBloc
    extends CachedPleromaPaginationBloc<IScheduledStatus>
    implements IScheduledStatusCachedPaginationBloc {
  final IScheduledStatusCachedListBloc scheduledStatusListService;

  ScheduledStatusCachedPaginationBloc(
      {@required this.scheduledStatusListService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => scheduledStatusListService.pleromaApi;

  @override
  Future<List<IScheduledStatus>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IScheduledStatus> olderPage,
          @required CachedPaginationPage<IScheduledStatus> newerPage}) =>
      scheduledStatusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IScheduledStatus> olderPage,
      @required CachedPaginationPage<IScheduledStatus> newerPage}) async {
    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return scheduledStatusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static ScheduledStatusCachedPaginationBloc createFromContext(
          BuildContext context,
          {int itemsCountPerPage = 20,
          int maximumCachedPagesCount}) =>
      ScheduledStatusCachedPaginationBloc(
          scheduledStatusListService:
              Provider.of<IScheduledStatusCachedListBloc>(context,
                  listen: false),
          itemsCountPerPage: itemsCountPerPage,
          maximumCachedPagesCount: maximumCachedPagesCount);

  static Widget provideToContext(BuildContext context,
      {int itemsCountPerPage = 20,
      int maximumCachedPagesCount,
      @required Widget child}) {
    return DisposableProvider<
        ICachedPaginationBloc<CachedPaginationPage<IScheduledStatus>,
            IScheduledStatus>>(
      create: (context) =>
          ScheduledStatusCachedPaginationBloc.createFromContext(
        context,
        itemsCountPerPage: itemsCountPerPage,
        maximumCachedPagesCount: maximumCachedPagesCount,
      ),
      child: CachedPaginationBlocProxyProvider<
          CachedPaginationPage<IScheduledStatus>,
          IScheduledStatus>(child: child),
    );
  }
}
