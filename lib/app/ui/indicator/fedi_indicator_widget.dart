import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _size = 12.0;

class FediIndicatorWidget extends StatelessWidget {
  final bool active;

  const FediIndicatorWidget({required this.active});

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Container(
      width: _size,
      height: _size,
      margin: EdgeInsets.symmetric(
        vertical: FediSizes.mediumPadding,
        // ignore: no-magic-number
        horizontal: 2.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
        border: Border.all(
          // ignore: no-magic-number
          width: 1.0,
          color: fediUiColorTheme.white,
        ),
      ),
    );
  }
}
