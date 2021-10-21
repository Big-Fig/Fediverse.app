import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusVisibilityTitleWidget extends StatelessWidget {
  final UnifediApiVisibility visibility;
  final bool isPossibleToChangeVisibility;
  final bool isSelectedVisibility;

  const StatusVisibilityTitleWidget({
    Key? key,
    required this.visibility,
    required this.isPossibleToChangeVisibility,
    required this.isSelectedVisibility,
  }) : super(key: key);

  @override
  // ignore: avoid-returning-widgets
  Widget build(BuildContext context) => buildVisibilityTitle(
        context: context,
        visibility: visibility,
        isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        isSelectedVisibility: isSelectedVisibility,
      );

  static Text buildVisibilityTitle({
    required BuildContext context,
    required UnifediApiVisibility visibility,
    required bool isPossibleToChangeVisibility,
    required bool isSelectedVisibility,
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
    UnifediApiVisibility visibility,
  ) =>
      visibility.map(
        public: (_) => S.of(context).app_status_post_visibility_state_public,
        unlisted: (_) =>
            S.of(context).app_status_post_visibility_state_unlisted,
        direct: (_) => S.of(context).app_status_post_visibility_state_direct,
        private: (_) => S.of(context).app_status_post_visibility_state_private,
        list: (_) => S.of(context).app_status_post_visibility_state_list,
        local: (_) => S.of(context).app_status_post_visibility_state_local,
        unknown: (_) => throw UnimplementedError(),
      );
}
