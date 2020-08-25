import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';

Color calculateVisibilityColor(
    isSelectedVisibility, isPossibleToChangeVisibility) {
  return isSelectedVisibility
      ? FediColors.primaryColor
      : isPossibleToChangeVisibility
      ? FediColors.darkGrey
      : FediColors.lightGrey;
}
