import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFediNestedScrollViewWithNestedScrollableTabsBloc
    extends IFediNestedScrollViewBloc {
  TabController get tabController;

  static IFediNestedScrollViewWithNestedScrollableTabsBloc of(
          BuildContext context,
          {bool listen = true}) =>
      Provider.of<IFediNestedScrollViewWithNestedScrollableTabsBloc>(context,
          listen: listen);
}
