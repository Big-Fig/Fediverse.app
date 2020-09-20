import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class TimelineTabBloc extends DisposableOwner
    implements ITimelineTabBloc {
  final TimelineTab tab;
  IStatusCachedListBloc statusCachedListService;
  IStatusCachedPaginationBloc statusCachedPaginationBloc;
  final ITimelineSettingsLocalPreferencesBloc timelineLocalPreferencesBloc;

  @override
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      paginationListWithNewItemsBloc;

  TimelineTabBloc(
      {@required this.tab, @required this.timelineLocalPreferencesBloc}) {
    statusCachedListService = createListService();
    addDisposable(disposable: statusCachedListService);

    statusCachedPaginationBloc = StatusCachedPaginationBloc(
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        statusListService: statusCachedListService);
    addDisposable(disposable: statusCachedPaginationBloc);

    paginationListWithNewItemsBloc = StatusCachedPaginationListWithNewItemsBloc<
            CachedPaginationPage<IStatus>>(
        paginationBloc: statusCachedPaginationBloc,
        mergeNewItemsImmediately: false,
        statusCachedListBloc: statusCachedListService);
    addDisposable(disposable: paginationListWithNewItemsBloc);

    // skip first value to avoid duplicated update on first build
    var initValueSkipped = false;
    addDisposable(
        streamSubscription: timelineLocalPreferencesBloc.stream
            .distinct()
            .listen((newPreferences) {
      if (!initValueSkipped) {
        paginationListWithNewItemsBloc.refreshWithController();
      } else {
        initValueSkipped = true;
      }
    }));
  }

  IStatusCachedListBloc createListService();
}
