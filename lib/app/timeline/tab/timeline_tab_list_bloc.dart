import 'package:fedi/app/timeline/tab/timeline_tab_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabsListBloc
    implements DisposableOwner, IAsyncInitLoadingBloc {
  static ITimelineTabsListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineTabsListBloc>(context, listen: listen);

  List<ITimelineTabBloc> get tabBlocs;

  Stream<List<ITimelineTabBloc>> get tabBlocsStream;

  ITimelineTabBloc get selectedTabBloc;

  Stream<ITimelineTabBloc> get selectedTabBlocStream;

  void selectTab(ITimelineTabBloc tabBloc);
}
