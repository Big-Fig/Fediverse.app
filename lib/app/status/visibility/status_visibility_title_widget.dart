import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusVisibilityTitleWidget extends StatelessWidget {
  final PleromaVisibility visibility;
  final bool isPossibleToChangeVisibility;
  final bool isSelectedVisibility;

  StatusVisibilityTitleWidget({
    @required this.visibility,
    @required this.isPossibleToChangeVisibility,
    @required this.isSelectedVisibility,
  });

  @override
  Widget build(BuildContext context) => buildVisibilityTitle(
        context: context,
        visibility: visibility,
        isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        isSelectedVisibility: isSelectedVisibility,
      );

  static Text buildVisibilityTitle({
    @required BuildContext context,
    @required PleromaVisibility visibility,
    @required isPossibleToChangeVisibility,
    @required isSelectedVisibility,
  }) =>
      Text(mapVisibilityToTitle(context, visibility),
          style: TextStyle(
              color: calculateVisibilityColor(
                  isSelectedVisibility, isPossibleToChangeVisibility)));

  static String mapVisibilityToTitle(
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
}
