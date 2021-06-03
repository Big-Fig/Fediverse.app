import 'package:fedi/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/material.dart';

abstract class ITimelineListTabControllerBloc implements IDisposable {
  TabController get tabController;

  ITimelineTabListBloc get timelineTabListBloc;
}
