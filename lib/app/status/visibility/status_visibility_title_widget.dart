import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
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
          style: IFediUiTextTheme.of(context).mediumShortDarkGrey.copyWith(
                color: calculateVisibilityColor(
                  context: context,
                  isSelectedVisibility: isSelectedVisibility,
                  isPossibleToChangeVisibility: isPossibleToChangeVisibility,
                ),
              ));

  static String mapVisibilityToTitle(
      BuildContext context, PleromaVisibility visibility) {
    switch (visibility) {
      case PleromaVisibility.public:
        return S.of(context).app_status_post_visibility_state_public;
        break;
      case PleromaVisibility.unlisted:
        return S.of(context).app_status_post_visibility_state_unlisted;
        break;
      case PleromaVisibility.local:
        return S.of(context).app_status_post_visibility_state_local;
        break;
      case PleromaVisibility.direct:
        return S.of(context).app_status_post_visibility_state_direct;
        break;
      case PleromaVisibility.list:
        return S.of(context).app_status_post_visibility_state_list;
        break;
      case PleromaVisibility.private:
        return S.of(context).app_status_post_visibility_state_private;
        break;
    }
    throw "Not supported visibility $visibility";
  }
}
