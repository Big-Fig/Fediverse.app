import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/material.dart';

class FediNestedScrollViewWithNestedScrollableTabsBloc
    extends FediNestedScrollViewBloc
    implements IFediNestedScrollViewWithNestedScrollableTabsBloc {
  @override
  TabController tabController;

  FediNestedScrollViewWithNestedScrollableTabsBloc({
    required this.tabController,
    required INestedScrollControllerBloc nestedScrollControllerBloc,
  }) : super(nestedScrollControllerBloc: nestedScrollControllerBloc);
}
