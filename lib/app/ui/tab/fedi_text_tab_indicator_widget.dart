import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToTextMapper<T> = String Function(BuildContext context, T tab);

class FediTextTabIndicatorWidget<T> extends StatelessWidget {
  final List<T> tabs;
  final TabController tabController;
  final TabToTextMapper<T> tabToTextMapper;
  final bool isTransparent;

  FediTextTabIndicatorWidget({
    @required this.tabs,
    @required this.tabController,
    @required this.tabToTextMapper,
    @required this.isTransparent,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
      indicator: FediTabIndicator(
        indicatorHeight: 36.0,
        indicatorColor: FediColors.primaryColor,
        padding: EdgeInsets.zero,
        insets: EdgeInsets.zero,
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
      tabs: tabs.asMap().entries.map((entry) {
        var index = entry.key;
        var tab = entry.value;

        return FediTextTabIndicatorItemWidget(
          index: index,
          tabController: tabController,
          label: tabToTextMapper(context, tab),
          isTransparent: isTransparent,
        );
      }).toList(),
      controller: tabController,
    );
  }
}
