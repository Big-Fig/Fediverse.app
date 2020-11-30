import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:flutter/material.dart';

class TimelineTabBlocsList {
  final TabController tabController;
  final List<ITimelineTabBloc> timelineTabBlocs;

  ITimelineTabBloc get selectedTimelineTabBloc =>
      timelineTabBlocs[tabController.index];

  TimelineTabBlocsList({
    @required this.tabController,
    @required this.timelineTabBlocs,
  });

  @override
  String toString() {
    return 'TimelineTabBlocsList{tabController: $tabController,'
        ' timelineTabBlocs: $timelineTabBlocs}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineTabBlocsList &&
          runtimeType == other.runtimeType &&
          timelineTabBlocs == other.timelineTabBlocs;

  @override
  int get hashCode => timelineTabBlocs.hashCode;
}
