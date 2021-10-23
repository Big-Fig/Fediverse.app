import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusVisibilityIconWidget extends StatelessWidget {
  final UnifediApiVisibility visibility;
  final bool isPossibleToChangeVisibility;
  final bool isSelectedVisibility;

  const StatusVisibilityIconWidget({
    Key? key,
    required this.visibility,
    required this.isPossibleToChangeVisibility,
    required this.isSelectedVisibility,
  }) : super(key: key);

  @override
  // ignore: avoid-returning-widgets
  Widget build(BuildContext context) => buildVisibilityIcon(
        context: context,
        visibility: visibility,
        isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        isSelectedVisibility: isSelectedVisibility,
      );

  static Icon buildVisibilityIcon({
    required BuildContext context,
    required UnifediApiVisibility visibility,
    required bool isPossibleToChangeVisibility,
    required bool isSelectedVisibility,
  }) =>
      Icon(
        mapVisibilityToIconData(visibility),
        color: calculateVisibilityColor(
          context: context,
          isSelectedVisibility: isSelectedVisibility,
          isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        ),
      );

  static IconData mapVisibilityToIconData(UnifediApiVisibility visibility) =>
      visibility.map(
        public: (_) => FediIcons.world,
        unlisted: (_) => FediIcons.unlisted,
        direct: (_) => FediIcons.message,
        private: (_) => FediIcons.private,
        list: (_) => FediIcons.lists,
        local: (_) => FediIcons.instance,
        unknown: (_) => FediIcons.warning,
      );
}
