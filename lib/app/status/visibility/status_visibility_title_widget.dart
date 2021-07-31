import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusVisibilityTitleWidget extends StatelessWidget {
  final PleromaApiVisibility visibility;
  final bool isPossibleToChangeVisibility;
  final bool isSelectedVisibility;

  StatusVisibilityTitleWidget({
    required this.visibility,
    required this.isPossibleToChangeVisibility,
    required this.isSelectedVisibility,
  });

  @override
  Widget build(BuildContext context) => buildVisibilityTitle(
        context: context,
        visibility: visibility,
        isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        isSelectedVisibility: isSelectedVisibility,
      );

  static Text buildVisibilityTitle({
    required BuildContext context,
    required PleromaApiVisibility visibility,
    required isPossibleToChangeVisibility,
    required isSelectedVisibility,
  }) =>
      Text(
        mapVisibilityToTitle(context, visibility),
        style: IFediUiTextTheme.of(context).mediumShortDarkGrey.copyWith(
              color: calculateVisibilityColor(
                context: context,
                isSelectedVisibility: isSelectedVisibility,
                isPossibleToChangeVisibility: isPossibleToChangeVisibility,
              ),
            ),
      );

  static String mapVisibilityToTitle(
    BuildContext context,
    PleromaApiVisibility visibility,
  ) {
    switch (visibility) {
      case PleromaApiVisibility.public:
        return S.of(context).app_status_post_visibility_state_public;
      case PleromaApiVisibility.unlisted:
        return S.of(context).app_status_post_visibility_state_unlisted;

      case PleromaApiVisibility.local:
        return S.of(context).app_status_post_visibility_state_local;

      case PleromaApiVisibility.direct:
        return S.of(context).app_status_post_visibility_state_direct;

      case PleromaApiVisibility.list:
        return S.of(context).app_status_post_visibility_state_list;

      case PleromaApiVisibility.private:
        return S.of(context).app_status_post_visibility_state_private;
    }
  }
}
