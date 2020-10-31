import 'package:fedi/app/ui/background/fedi_background_blur.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediBlurredOverlayWarningWidget extends StatelessWidget {
  final String descriptionText;
  final String buttonText;
  final VoidCallback buttonAction;

  FediBlurredOverlayWarningWidget({
    this.descriptionText,
    this.buttonText,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // nothing, just bloc behind clicks
      },
      child: ClipRect(
        child: FediBackgroundBlur(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (descriptionText != null) ...[
                Text(
                  descriptionText,
                  style: IFediUiTextTheme.of(context).bigTallDarkGrey,
                ),
                const FediBigVerticalSpacer(),
              ],
              if (buttonText != null && buttonAction != null)
                Padding(
                  padding: FediPadding.allSmallPadding,
                  child: FediPrimaryFilledTextButton(
                    buttonText,
                    enabledBorderColor: fediUiColorTheme.transparent,
                    disabledBorderColor: fediUiColorTheme.transparent,
                    expanded: false,
                    onPressed: buttonAction,
                  ),
                ),
            ],
          ),
          sigma: 6.0,
        ),
      ),
    );
  }
}
