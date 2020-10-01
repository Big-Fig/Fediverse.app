import 'package:fedi/app/ui/button/text/fedi_blurred_text_button.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/tab/fedi_tab_indicator_item_bloc.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTextTabIndicatorItemWidget<T> extends StatelessWidget {
  final bool isTransparent;
  final TabToTextMapper<T> tabToTextMapper;

  const FediTextTabIndicatorItemWidget({
    @required this.isTransparent,
    @required this.tabToTextMapper,
  });

  @override
  Widget build(BuildContext context) {
    var fediTabIndicatorItemBloc =
        IFediTabIndicatorItemBloc.of<T>(context, listen: false);
    var onPressed = () {
      fediTabIndicatorItemBloc.select();
    };

    var fontSize = 16.0;
    var lineHeight = 1.5;

    return StreamBuilder<bool>(
        stream: fediTabIndicatorItemBloc.isSelectedStream,
        initialData: fediTabIndicatorItemBloc.isSelected,
        builder: (context, snapshot) {
          var isSelected = snapshot.data;

          Widget text;

          var label = tabToTextMapper(context, fediTabIndicatorItemBloc.item);
          if (isSelected) {
            return FediPrimaryFilledTextButton(
              label,
              onPressed: onPressed,
              textStyle: FediPrimaryFilledTextButton.defaultTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                height: lineHeight,
              ),
              enabledBackgroundColor: FediColors.primaryColor.withOpacity(0.8),
            );
          } else {
            var fontWeight = FontWeight.normal;
            if (isTransparent) {
              text = FediBlurredTextButton(
                label,
                onPressed: onPressed,
                textStyle: FediBlurredTextButton.defaultTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                ),
              );
            } else {
              text = FediTransparentTextButton(
                label,
                onPressed: onPressed,
                textStyle: FediTransparentTextButton.defaultTextStyle.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  height: lineHeight,
                ),
                color: FediColors.mediumGrey,
              );
            }
          }

          return text;
        });
  }
}
