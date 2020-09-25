import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToTextMapper<T> = String Function(BuildContext context, T tab);

class FediTextTabIndicatorWidget<T> extends StatelessWidget {
  final List<T> tabs;
  final TabController tabController;
  final TabToTextMapper<T> tabToTextMapper;
  final bool isTransparent;

  final CustomTabBuilder<T> customTabBuilder;

  FediTextTabIndicatorWidget({
    @required this.tabs,
    @required this.tabController,
    @required this.tabToTextMapper,
    @required this.isTransparent,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var borderHeight = 2.0;
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: FediPadding.horizontalSmallPadding,
      indicator: FediTabIndicator(
        indicatorHeight: FediSizes.tabIndicatorTextHeight - borderHeight,
        indicatorRadius: (FediSizes.textButtonHeight + borderHeight) / 2,
        indicatorColor: FediColors.primaryColor,
        padding: EdgeInsets.only(top: borderHeight),
        insets: EdgeInsets.zero,
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
      tabs: [
        ...tabs.asMap().entries.map(
          (entry) {
            var index = entry.key;
            var tab = entry.value;

            Widget tabWidget = FediTextTabIndicatorItemWidget(
              index: index,
              tabController: tabController,
              label: tabToTextMapper(context, tab),
              isTransparent: isTransparent,
            );

            if (customTabBuilder != null) {
              tabWidget = customTabBuilder(context, tabWidget, tab);
            }
            return tabWidget;
          },
        ),
      ],
      controller: tabController,
    );
  }
}
