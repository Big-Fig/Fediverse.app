import 'package:fedi/refactored/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class TimelineTabBloc extends DisposableOwner
    implements ITimelineTabBloc {
  final TimelineTab tab;
  IStatusCachedListBloc statusCachedListService;
  IStatusCachedPaginationBloc statusCachedPaginationBloc;
  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      paginationListWithNewItemsBloc;

  TimelineTabBloc({@required this.tab}) {
    statusCachedListService = createListService();
    addDisposable(disposable: statusCachedListService);

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: statusCachedListService);
    addDisposable(disposable: statusCachedPaginationBloc);

    paginationListWithNewItemsBloc =
        StatusPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>>(
          paginationBloc: statusCachedPaginationBloc,
            mergeNewItemsImmediately: false, statusCachedListService: statusCachedListService);
    addDisposable(disposable: paginationListWithNewItemsBloc);
  }

  IStatusCachedListBloc createListService();
}
