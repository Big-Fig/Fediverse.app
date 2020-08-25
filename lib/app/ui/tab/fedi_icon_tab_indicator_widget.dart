import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToIconMapper<T> = IconData Function(BuildContext context, T tab);

class FediIconTabIndicatorWidget<T> extends StatelessWidget {
  final List<T> tabs;
  final TabController tabController;
  final TabToIconMapper<T> tabToIconMapper;
  final bool expand;
  final CustomTabBuilder<T> customTabBuilder;

  FediIconTabIndicatorWidget({
    @required this.expand,
    @required this.tabs,
    @required this.tabController,
    @required this.tabToIconMapper,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) => TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: FediPadding.horizontalSmallPadding,
        indicator: FediTabIndicator(
          indicatorHeight: FediSizes.tabIndicatorIconHeight,
          indicatorColor: FediColors.primaryColor,
          padding: EdgeInsets.zero,
          insets: EdgeInsets.zero,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
        ),
        tabs: tabs.asMap().entries.map((entry) {
          var index = entry.key;
          var tab = entry.value;

          Widget tabWidget = FediIconTabIndicatorItemWidget(
            index: index,
            tabController: tabController,
            iconData: tabToIconMapper(context, tab),
          );

          if (customTabBuilder != null) {
            tabWidget = customTabBuilder(context, tabWidget, tab);
          }
          return tabWidget;
        }).toList(),
        controller: tabController,
      );
}
