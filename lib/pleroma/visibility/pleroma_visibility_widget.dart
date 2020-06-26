
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Icon buildVisibilityIcon(
    {@required BuildContext context,
      @required PleromaVisibility visibility,
      @required isPossibleToChangeVisibility,
      @required isSelectedVisibility}) =>
    Icon(mapVisibilityToIconData(visibility),
        color: calculateVisibilityColor(
            isSelectedVisibility, isPossibleToChangeVisibility));

IconData mapVisibilityToIconData(PleromaVisibility visibility) {
  switch (visibility) {
    case PleromaVisibility.PUBLIC:
      return FediIcons.world;
      break;
    case PleromaVisibility.UNLISTED:
      return Icons.lock_open;
      break;
    case PleromaVisibility.DIRECT:
      return Icons.message;
      break;
    case PleromaVisibility.LIST:
      return Icons.list;
      break;
    case PleromaVisibility.PRIVATE:
      return Icons.lock;
      break;
  }
  throw "Not supported visibility $visibility";
}

Text buildVisibilityTitle({
  @required BuildContext context,
  @required PleromaVisibility visibility,
  @required isPossibleToChangeVisibility,
  @required isSelectedVisibility,
}) =>
    Text(mapVisibilityToTitle(context, visibility),
        style: TextStyle(
            color: calculateVisibilityColor(
                isSelectedVisibility, isPossibleToChangeVisibility)));

Color calculateVisibilityColor(
    isSelectedVisibility, isPossibleToChangeVisibility) {
  return isSelectedVisibility
      ? FediColors.primaryColor
      : isPossibleToChangeVisibility
      ? FediColors.darkGrey
      : FediColors.lightGrey;
}

String mapVisibilityToTitle(
    BuildContext context, PleromaVisibility visibility) {
  switch (visibility) {
    case PleromaVisibility.PUBLIC:
      return tr("app.status.post.visibility.state"
          ".public");
      break;
    case PleromaVisibility.UNLISTED:
      return tr("app.status.post.visibility.state.unlisted");
      break;
    case PleromaVisibility.DIRECT:
      return tr("app.status.post.visibility.state.direct");
      break;
    case PleromaVisibility.LIST:
      return tr("app.status.post.visibility.state.list");
      break;
    case PleromaVisibility.PRIVATE:
      return tr("app.status.post.visibility.state.private");
      break;
  }
  throw "Not supported visibility $visibility";
}