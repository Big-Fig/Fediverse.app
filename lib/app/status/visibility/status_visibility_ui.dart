import 'dart:ui';

import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/widgets.dart';

Color calculateVisibilityColor({
  required BuildContext context,
  required bool isSelectedVisibility,
  required bool isPossibleToChangeVisibility,
}) {
  return isSelectedVisibility
      ? IFediUiColorTheme.of(context).primary
      : isPossibleToChangeVisibility
          ? IFediUiColorTheme.of(context).darkGrey
          : IFediUiColorTheme.of(context).lightGrey;
}
