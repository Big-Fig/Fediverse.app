import 'package:fedi/refactored/app/home/tab/timelines/timelines_home_tab_model.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomeTabBloc extends Disposable {
  static ITimelinesHomeTabBloc of(BuildContext context, {listen: true}) =>
      Provider.of<ITimelinesHomeTabBloc>(context, listen: listen);

  TimelineTab get selectedTab;

  Stream<TimelineTab> get selectedTabStream;

  IStatusPaginationListBloc retrieveTimelineTabPaginationListBloc(
      TimelineTab tab);

  void selectTab(TimelineTab tab);
}
