import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/fedi_icon_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_bloc_impl.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fedi_tab_indicator_item_bloc.dart';

typedef TabToIconMapper<T> = IconData Function(BuildContext context, T tab);

class FediIconTabIndicatorWidget<T> extends StatelessWidget {
  final TabToIconMapper<T?> tabToIconMapper;
  final bool expand;
  final CustomTabBuilder<T>? customTabBuilder;

  FediIconTabIndicatorWidget({
    required this.expand,
    required this.tabToIconMapper,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorBloc =
        IFediTabIndicatorBloc.of<T>(context, listen: false);

    var borderHeight = 2.0;

    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: FediPadding.horizontalSmallPadding,
      indicator: FediTabIndicator(
        indicatorHeight: FediSizes.tabIndicatorIconHeight - borderHeight,
        indicatorRadius: (FediSizes.iconButtonHeight + borderHeight) / 2,
        // indicatorHeight: FediSizes.tabIndicatorIconHeight,
        indicatorColor: IFediUiColorTheme.of(context).primary,
        padding: EdgeInsets.only(top: borderHeight),
        insets: EdgeInsets.zero,
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
      tabs: fediTabIndicatorBloc.items.asMap().entries.map(
        (entry) {
          var index = entry.key;
          var tab = entry.value;

          Widget tabWidget = DisposableProxyProvider<IFediTabIndicatorBloc<T>,
              IFediTabIndicatorItemBloc<T>>(
            update: (context, value, previous) => FediTabIndicatorItemBloc<T>(
              fediTabIndicatorBloc: value,
              index: index,
              item: tab,
            ),
            child: FediIconTabIndicatorItemWidget(
              tabToIconMapper: tabToIconMapper,
            ),
          );

          if (customTabBuilder != null) {
            tabWidget = customTabBuilder!(context, tabWidget, tab);
          }
          return tabWidget;
        },
      ).toList(),
      controller: fediTabIndicatorBloc.tabController,
    );
  }
}
