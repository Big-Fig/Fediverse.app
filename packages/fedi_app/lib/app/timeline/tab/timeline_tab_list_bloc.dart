import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabListBloc
    implements DisposableOwner, IAsyncInitLoadingBloc {
  static ITimelineTabListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineTabListBloc>(context, listen: listen);

  List<ITimelineTabBloc> get timelineTabBlocs;

  ITimelineTabBloc get homeTimelineTabBloc;

  List<String> get timelineIds;

  ITimelineTabBloc get selectedTimelineTabBloc;

  Stream<ITimelineTabBloc> get selectedTimelineTabBlocStream;

  int get selectedTimelineTabBlocIndex;

  Stream<int> get selectedTimelineTabBlocIndexStream;

  void changeSelectedTimelineTabBloc(ITimelineTabBloc selectedTimelineTabBloc);

  void changeSelectedTimelineTabBlocIndex(int selectedTimelineTabBlocIndex);
}
