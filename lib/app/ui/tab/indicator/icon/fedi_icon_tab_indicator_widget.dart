import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi/app/ui/tab/indicator/icon/fedi_icon_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc_impl.dart';
import 'package:fedi/app/ui/tab/indicator/style/bubble/fedi_tab_bubble_style_indicator.dart';
import 'package:fedi/app/ui/tab/indicator/style/underline/fedi_tab_underline_style_indicator.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToIconMapper<T> = IconData Function(BuildContext context, T tab);

class FediIconTabIndicatorWidget<T> extends StatelessWidget {
  final TabToIconMapper<T?> tabToIconMapper;
  final bool expand;
  final CustomTabBuilder<T>? customTabBuilder;
  final FediTabStyle style;

  const FediIconTabIndicatorWidget({
    required this.expand,
    required this.tabToIconMapper,
    required this.style,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorBloc =
        IFediTabIndicatorBloc.of<T>(context, listen: false);

    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: FediPadding.horizontalSmallPadding,
      indicator: buildFediTabIndicator(
        context,
      ),
      tabs: fediTabIndicatorBloc.items.asMap().entries.map(
        (entry) {
          var index = entry.key;
          var tab = entry.value as T;

          Widget tabWidget = DisposableProxyProvider<IFediTabIndicatorBloc<T>,
              IFediTabIndicatorItemBloc<T>>(
            update: (context, value, previous) => FediTabIndicatorItemBloc<T>(
              fediTabIndicatorBloc: value,
              index: index,
              item: tab,
            ),
            child: FediIconTabIndicatorItemWidget(
              tabToIconMapper: tabToIconMapper,
              style: style,
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

  Decoration buildFediTabIndicator(BuildContext context) {
    switch (style) {
      case FediTabStyle.bubble:
        // ignore: no-magic-number
        const borderHeight = 2.0;
        return FediTabBubbleStyleIndicator(
          indicatorHeight: FediSizes.tabIndicatorIconHeight - borderHeight,
          // ignore: no-magic-number
          indicatorRadius: (FediSizes.iconButtonHeight + borderHeight) / 2,
          // indicatorHeight: FediSizes.tabIndicatorIconHeight,
          indicatorColor: IFediUiColorTheme.of(context).primary,
          padding: const EdgeInsets.only(top: borderHeight),
          insets: EdgeInsets.zero,
          tabBarIndicatorSize: TabBarIndicatorSize.label,
        );
      case FediTabStyle.underline:
        return FediTabUnderlineStyleIndicator(
          indicatorColor: IFediUiColorTheme.of(context).primary,
        );
    }
  }
}
