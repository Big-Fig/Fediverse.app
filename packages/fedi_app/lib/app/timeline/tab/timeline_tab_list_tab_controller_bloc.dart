import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_list_bloc.dart';
import 'package:flutter/material.dart';

abstract class ITimelineListTabControllerBloc implements IDisposable {
  TabController get tabController;

  ITimelineTabListBloc get timelineTabListBloc;
}
