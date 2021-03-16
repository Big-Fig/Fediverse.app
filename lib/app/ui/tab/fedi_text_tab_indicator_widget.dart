import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_bloc.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_bloc_impl.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_widget.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_item_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef TabToTextMapper<T> = String? Function(BuildContext context, T tab);

class FediTextTabIndicatorWidget<T> extends StatelessWidget {
  final TabToTextMapper<T?> tabToTextMapper;
  final bool isTransparent;

  final CustomTabBuilder<T>? customTabBuilder;

  FediTextTabIndicatorWidget({
    required this.tabToTextMapper,
    required this.isTransparent,
    this.customTabBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var borderHeight = 2.0;

    var fediTabIndicatorBloc =
        IFediTabIndicatorBloc.of<T>(context);
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: FediPadding.horizontalSmallPadding,
      indicator: FediTabIndicator(
        indicatorHeight: FediSizes.tabIndicatorTextHeight - borderHeight,
        indicatorRadius: (FediSizes.textButtonHeight + borderHeight) / 2,
        indicatorColor: IFediUiColorTheme.of(context).primary,
        padding: EdgeInsets.only(top: borderHeight),
        insets: EdgeInsets.zero,
        tabBarIndicatorSize: TabBarIndicatorSize.label,
      ),
      tabs: [
        ...fediTabIndicatorBloc.items.asMap().entries.map(
          (entry) {
            var index = entry.key;
            var tab = entry.value;

            Widget tabWidget = DisposableProxyProvider<IFediTabIndicatorBloc<T>,
                IFediTabIndicatorItemBloc<T?>>(
              // create: (BuildContext context) =>
              update: (context, value, previous) => FediTabIndicatorItemBloc<T?>(
                fediTabIndicatorBloc: value,
                index: index,
                item: tab,
              ),
              child: FediTextTabIndicatorItemWidget(
                isTransparent: isTransparent,
                tabToTextMapper: tabToTextMapper,
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
}
