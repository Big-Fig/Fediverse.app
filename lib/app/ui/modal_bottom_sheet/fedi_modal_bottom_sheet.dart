import 'dart:core';

import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

void showFediModalBottomSheetDialog({
  @required BuildContext context,
  @required Widget child,
}) {
  var fediUiColorTheme = IFediUiColorTheme.of(context);
  showModalBottomSheet(
      context: context,
      backgroundColor: fediUiColorTheme.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) => ClipRRect(
            borderRadius: FediBorderRadius.topOnlyBigBorderRadius,
            child: Container(
              color: fediUiColorTheme.white,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
              ),
              child: Padding(
                padding: FediPadding.verticalBigPadding,
                child: child,
              ),
            ),
          ));
}
