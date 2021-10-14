import 'package:fedi/app/ui/background/fedi_background_blur.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediBlurredOverlayWarningWidget extends StatelessWidget {
  final String? descriptionText;
  final String? buttonText;
  final VoidCallback? buttonAction;
  final double sigma;
  final Color? replaceBlurWithColor;

  const FediBlurredOverlayWarningWidget({
    Key? key,
    this.descriptionText,
    this.buttonText,
    this.buttonAction,
    // ignore: no-magic-number
    this.sigma = 6.0,
    this.replaceBlurWithColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    var child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (descriptionText != null) ...[
          Text(
            descriptionText!,
            style: IFediUiTextTheme.of(context).bigTallDarkGrey,
          ),
          const FediBigVerticalSpacer(),
        ],
        if (buttonText != null && buttonAction != null)
          Padding(
            padding: FediPadding.allSmallPadding,
            child: FediPrimaryFilledTextButtonWithBorder(
              buttonText!,
              limitMinWidth: true,
              expanded: false,
              enabledBorderColor: fediUiColorTheme.transparent,
              // ignore: no-equal-arguments
              disabledBorderColor: fediUiColorTheme.transparent,
              onPressed: buttonAction,
            ),
          ),
      ],
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        buttonAction?.call();
      },
      child: ClipRect(
        child: replaceBlurWithColor != null
            ? Container(
                color: replaceBlurWithColor,
                child: child,
              )
            : FediBackgroundBlur(
                // ignore: no-magic-number
                sigma: sigma,
                child: child,
              ),
      ),
    );
  }
}
