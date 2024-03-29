import 'package:fedi_app/app/ui/button/text/with_border/fedi_blurred_text_button_with_border.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi_app/app/ui/tab/indicator/item/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi_app/app/ui/tab/indicator/text/fedi_text_tab_indicator_widget.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTextTabIndicatorItemWidget<T> extends StatelessWidget {
  final bool isTransparent;
  final TabToTextMapper<T?> tabToTextMapper;
  final FediTabStyle style;

  const FediTextTabIndicatorItemWidget({
    Key? key,
    required this.isTransparent,
    required this.tabToTextMapper,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case FediTabStyle.bubble:
        return _FediTextTabIndicatorItemWidgetBubbleStyle(
          isTransparent: isTransparent,
          tabToTextMapper: tabToTextMapper,
        );

      case FediTabStyle.underline:
        return _FediTextTabIndicatorItemWidgetUnderlineStyle(
          isTransparent: isTransparent,
          tabToTextMapper: tabToTextMapper,
        );
    }
  }
}

class _FediTextTabIndicatorItemWidgetBubbleStyle<T> extends StatelessWidget {
  final bool isTransparent;
  final TabToTextMapper<T?> tabToTextMapper;

  const _FediTextTabIndicatorItemWidgetBubbleStyle({
    Key? key,
    required this.isTransparent,
    required this.tabToTextMapper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorItemBloc = IFediTabIndicatorItemBloc.of<T>(context);
    // ignore: no-magic-number
    const fontSize = 16.0;
    // ignore: no-magic-number
    const lineHeight = 1.5;

    return StreamBuilder<bool>(
      stream: fediTabIndicatorItemBloc.isSelectedStream,
      initialData: fediTabIndicatorItemBloc.isSelected,
      builder: (context, snapshot) {
        var isSelected = snapshot.data!;

        Widget text;

        var label = tabToTextMapper(context, fediTabIndicatorItemBloc.item);

        if (isSelected) {
          return FediPrimaryFilledTextButtonWithBorder(
            label,
            onPressed: () {
              fediTabIndicatorItemBloc.select();
            },
            textStyle:
                IFediUiTextTheme.of(context).mediumShortBoldWhite.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      height: lineHeight,
                    ),
            expanded: false,
            enabledBackgroundColor:
                // ignore: no-magic-number
                IFediUiColorTheme.of(context).primary.withOpacity(0.8),
          );
        } else {
          var fontWeight = FontWeight.normal;
          if (isTransparent) {
            text = FediBlurredTextButtonWithBorder(
              label,
              onPressed: () {
                fediTabIndicatorItemBloc.select();
              },
              textStyle:
                  IFediUiTextTheme.of(context).mediumShortBoldWhite.copyWith(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        height: lineHeight,
                      ),
              expanded: false,
            );
          } else {
            text = FediTransparentTextButtonWithBorder(
              label,
              onPressed: () {
                fediTabIndicatorItemBloc.select();
              },
              textStyle: IFediUiTextTheme.of(context)
                  .mediumShortBoldMediumGrey
                  .copyWith(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    height: lineHeight,
                  ),
              color: IFediUiColorTheme.of(context).mediumGrey,
              expanded: false,
            );
          }
        }

        return text;
      },
    );
  }
}

class _FediTextTabIndicatorItemWidgetUnderlineStyle<T> extends StatelessWidget {
  final bool isTransparent;
  final TabToTextMapper<T?> tabToTextMapper;

  const _FediTextTabIndicatorItemWidgetUnderlineStyle({
    Key? key,
    required this.isTransparent,
    required this.tabToTextMapper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorItemBloc = IFediTabIndicatorItemBloc.of<T>(context);
    var label = tabToTextMapper(context, fediTabIndicatorItemBloc.item);

    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: fediUiColorTheme.ultraLightGrey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: FediSizes.smallPadding,
          horizontal: FediSizes.bigPadding,
        ),
        child: Text(
          label,
          style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
        ),
      ),
    );
  }
}
