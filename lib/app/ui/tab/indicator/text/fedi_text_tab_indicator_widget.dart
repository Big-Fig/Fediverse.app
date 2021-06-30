import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc_impl.dart';
import 'package:fedi/app/ui/tab/indicator/style/bubble/fedi_tab_bubble_style_indicator.dart';
import 'package:fedi/app/ui/tab/indicator/style/underline/fedi_tab_underline_style_indicator.dart';
import 'package:fedi/app/ui/tab/indicator/text/fedi_text_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToTextMapper<T> = String Function(BuildContext context, T tab);

class FediTextTabIndicatorWidget<T> extends StatelessWidget {
  final TabToTextMapper<T?> tabToTextMapper;
  final bool isTransparent;

  final CustomTabBuilder<T>? customTabBuilder;

  final FediTabStyle style;

  FediTextTabIndicatorWidget({
    required this.tabToTextMapper,
    required this.isTransparent,
    required this.style,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorBloc = IFediTabIndicatorBloc.of<T>(context);
    EdgeInsets labelPadding;
    switch (style) {
      case FediTabStyle.bubble:
        labelPadding = FediPadding.horizontalSmallPadding;
        break;
      case FediTabStyle.underline:
        labelPadding = EdgeInsets.zero;
        break;
    }

    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: labelPadding,
      indicator: buildFediTabIndicator(context),
      tabs: [
        ...fediTabIndicatorBloc.items.asMap().entries.map(
          (entry) {
            var index = entry.key;
            var tab = entry.value;

            Widget tabWidget = DisposableProxyProvider<
                IFediTabIndicatorBloc<T>, IFediTabIndicatorItemBloc<T>>(
              // create: (BuildContext context) =>
              update: (context, value, previous) =>
                  FediTabIndicatorItemBloc<T>(
                fediTabIndicatorBloc: value,
                index: index,
                item: tab,
              ),
              child: FediTextTabIndicatorItemWidget(
                isTransparent: isTransparent,
                tabToTextMapper: tabToTextMapper,
                style: style,
              ),
            );

            if (customTabBuilder != null) {
              tabWidget = customTabBuilder!(context, tabWidget, tab);
            }

            return tabWidget;
          },
        ),
      ],
      controller: fediTabIndicatorBloc.tabController,
    );
  }

  Decoration buildFediTabIndicator(BuildContext context) {
    switch (style) {
      case FediTabStyle.bubble:
        const borderHeight = 2.0;
        return FediTabBubbleStyleIndicator(
          indicatorHeight: FediSizes.tabIndicatorTextHeight - borderHeight,
          // ignore: no-magic-number
          indicatorRadius: (FediSizes.textButtonHeight + borderHeight) / 2,
          indicatorColor: IFediUiColorTheme.of(context).primary,
          padding: EdgeInsets.only(top: borderHeight),
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
