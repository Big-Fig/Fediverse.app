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
  Widget build(BuildContext context) => Row(
        children: tabs.asMap().entries.map((entry) {
          var index = entry.key;
          var tab = entry.value;
          var isLast = index == tabs.length - 1;
          return Padding(
            padding: EdgeInsets.only(right: isLast ? 0.0 : 16.0),
            child: FediTextTabIndicatorItemWidget(
              index: index,
              tabController: tabController,
              label: tabToTextMapper(context, tab),
              isTransparent: isTransparent,
            ),
          );
        }).toList(),
      );
}
