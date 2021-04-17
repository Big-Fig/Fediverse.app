import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/app/timeline/tab/timeline_tab_list_tab_controller_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/material.dart';

class TimelineListTabControllerBloc extends DisposableOwner
    implements ITimelineListTabControllerBloc {
  @override
  late TabController tabController;

  @override
  final ITimelineTabListBloc timelineTabListBloc;

  List<ITimelineTabBloc> get timelineTabBlocs =>
      timelineTabListBloc.timelineTabBlocs;

  VoidCallback? tabControllerListener;

  TimelineListTabControllerBloc({
    required this.timelineTabListBloc,
    required TickerProvider vsync,
  }) {
    var initialIndex = timelineTabListBloc.selectedTimelineTabBlocIndex;

    tabController = TabController(
      length: timelineTabBlocs.length,
      vsync: vsync,
      initialIndex: initialIndex,
    );

    tabController.animateTo(initialIndex);

    tabControllerListener = () {
      var index = tabController.index;
      var timelineTabBloc = timelineTabBlocs[index];

      timelineTabListBloc.changeSelectedTimelineTabBloc(timelineTabBloc);
    };

    tabController.addListener(tabControllerListener!);

    addDisposable(custom: () {
      if (tabControllerListener != null) {
        tabController.removeListener(tabControllerListener!);
      }
    });
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineListTabControllerBloc &&
          runtimeType == other.runtimeType &&
          tabController == other.tabController &&
          timelineTabListBloc == other.timelineTabListBloc &&
          tabControllerListener == other.tabControllerListener;

  @override
  int get hashCode =>
      tabController.hashCode ^
      timelineTabListBloc.hashCode ^
      tabControllerListener.hashCode;

  @override
  String toString() => 'TimelineListTabControllerBloc{'
      'tabController: $tabController, '
      'timelineTabListBloc: $timelineTabListBloc, '
      'tabControllerListener: $tabControllerListener'
      '}';

}
