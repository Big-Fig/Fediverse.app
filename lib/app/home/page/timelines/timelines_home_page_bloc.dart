import 'package:fedi/app/home/page/timelines/timelines_home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ITimelinesHomePageBloc {
  static ITimelinesHomePageBloc of(BuildContext context, {listen: true}) =>
      Provider.of<ITimelinesHomePageBloc>(context, listen: listen);

  List<TimelinesHomePageTab> get tabs;

  TimelinesHomePageTab get selectedTab;

  Stream<TimelinesHomePageTab> get selectedTabStream;

  TabController get tabsController;

  void selectTab(int index);
}
