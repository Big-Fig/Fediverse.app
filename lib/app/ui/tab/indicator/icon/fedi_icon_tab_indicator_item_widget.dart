import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi/app/ui/tab/indicator/icon/fedi_icon_tab_indicator_widget.dart';
import 'package:fedi/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediIconTabIndicatorItemWidget<T> extends StatelessWidget {
  final TabToIconMapper<T?> tabToIconMapper;
  final FediTabStyle style;

  const FediIconTabIndicatorItemWidget({
    required this.tabToIconMapper,
    required this.style,
  }) : assert(style == FediTabStyle.bubble, 'Only bubble supported for now');

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorItemBloc =
        IFediTabIndicatorItemBloc.of<T>(context, listen: false);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var onPressed = () {
      fediTabIndicatorItemBloc.select();
    };

    return StreamBuilder<bool>(
      stream: fediTabIndicatorItemBloc.isSelectedStream,
      initialData: fediTabIndicatorItemBloc.isSelected,
      builder: (context, snapshot) {
        var isSelected = snapshot.data!;

        Widget button;
        var iconData = tabToIconMapper(context, fediTabIndicatorItemBloc.item);
        if (isSelected) {
          button = FediIconInCircleFilledButton(
            iconData,
            onPressed: onPressed,
            enabledBackgroundColor: fediUiColorTheme.transparent,
          );
        } else {
          button = FediIconInCircleBlurredButton(
            iconData,
            onPressed: onPressed,
          );
        }

        return button;
      },
    );
  }
}
