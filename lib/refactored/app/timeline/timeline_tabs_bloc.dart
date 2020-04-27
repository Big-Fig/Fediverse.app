import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/tab/timeline_tab_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineTabsBloc extends Disposable {
  List<TimelineTab> get tabs;


  static ITimelineTabsBloc of(BuildContext context, {listen: true}) =>
      Provider.of<ITimelineTabsBloc>(context, listen: listen);

  TimelineTab get selectedTab;

  Stream<TimelineTab> get selectedTabStream;

  IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>
      retrieveTimelineTabPaginationListBloc(TimelineTab tab);

  void selectTab(TimelineTab tab);

}
