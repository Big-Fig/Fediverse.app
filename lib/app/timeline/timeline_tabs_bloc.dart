import 'package:fedi/app/home/tab/timelines/item/timelines_home_tab_item_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabsBloc
    implements DisposableOwner, IAsyncInitLoadingBloc {
  List<TimelinesHomeTabItem> get tabs;

  static ITimelineTabsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineTabsBloc>(context, listen: listen);

  TimelinesHomeTabItem get selectedTab;

  Stream<TimelinesHomeTabItem> get selectedTabStream;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelinesHomeTabItem tab);

  void selectTab(TimelinesHomeTabItem tab);

  ITimelineSettingsLocalPreferencesBloc retrieveTimelineTabSettingsBloc(
      TimelinesHomeTabItem tab);
}
