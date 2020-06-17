import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabsBloc extends DisposableOwner {

  List<TimelineTab> get tabs;

  static ITimelineTabsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineTabsBloc>(context, listen: listen);

  TimelineTab get selectedTab;

  Stream<TimelineTab> get selectedTabStream;

  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelineTab tab);

  void selectTab(TimelineTab tab);
}
