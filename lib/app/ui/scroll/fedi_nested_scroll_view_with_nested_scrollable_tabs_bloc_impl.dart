import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc_impl.dart';
import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_with_nested_scrollable_tabs_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/tab_controller.dart';
import 'package:nested_scroll_controller/nested_scroll_controller.dart';

class FediNestedScrollViewWithNestedScrollableTabsBloc
    extends FediNestedScrollViewBloc
    implements IFediNestedScrollViewWithNestedScrollableTabsBloc {
  @override
  TabController tabController;
  FediNestedScrollViewWithNestedScrollableTabsBloc({
    @required this.tabController,
    NestedScrollController scrollController,
  }) : super(scrollController: scrollController);
}
