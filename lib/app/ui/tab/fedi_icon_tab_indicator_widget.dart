import 'package:fedi/app/ui/tab/fedi_icon_tab_indicator_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToIconMapper = IconData Function<T>(BuildContext context, T tab);

class FediIconTabIndicatorWidget<T> extends StatelessWidget {
  final List<T> tabs;
  final TabController tabController;
  final TabToIconMapper tabToIconMapper;

  FediIconTabIndicatorWidget({
    @required this.tabs,
    @required this.tabController,
    @required this.tabToIconMapper,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: tabs.asMap().entries.map((entry) {
          var index = entry.key;
          var tab = entry.value;
          var isLast = index == tabs.length - 1;

          return Padding(
            padding: EdgeInsets.only(right: isLast ? 0.0 : 8.0),
            child: FediIconTabIndicatorItemWidget(
              index: index,
              tabController: tabController,
              iconData: tabToIconMapper(context, tab),
            ),
          );
        }).toList(),
      );
}
