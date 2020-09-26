import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_local_preferences_bloc.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabsBloc
    implements DisposableOwner, IAsyncInitLoadingBloc {
  List<Timeline> get tabs;

  static ITimelineTabsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineTabsBloc>(context, listen: listen);

  Timeline get selectedTab;

  Stream<Timeline> get selectedTabStream;

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(Timeline tab);

  void selectTab(Timeline tab);

  ITimelineSettingsLocalPreferencesBloc retrieveTimelineTabSettingsBloc(
      Timeline tab);
}
