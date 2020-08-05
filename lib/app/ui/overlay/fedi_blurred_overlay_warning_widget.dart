import 'package:fedi/app/ui/background/fedi_background_blur.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediBlurredOverlayWarningWidget extends StatelessWidget {
  final String descriptionText;
  final String buttonText;
  final Widget child;
  final VoidCallback buttonAction;

  FediBlurredOverlayWarningWidget({
    @required this.descriptionText,
    @required this.buttonText,
    @required this.buttonAction,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => ConstrainedBox(

    constraints: BoxConstraints(minHeight: 100),
    child: Stack(
          children: <Widget>[
            child,
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: GestureDetector(
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
                        Text(
                          descriptionText,
                          style: FediTextStyles.bigTallDarkGrey,
                        ),
                        FediBigVerticalSpacer(),
                        FediPrimaryFilledTextButton(
                          buttonText,
                          enabledBorderColor: Colors.transparent,
                          disabledBorderColor: Colors.transparent,
                          expanded: false,
                          onPressed: buttonAction,
                        ),
                      ],
                    ),
                    sigma: 6.0,
                  ),
                ),
              ),
            ),
          ],
        ),
  );
}
