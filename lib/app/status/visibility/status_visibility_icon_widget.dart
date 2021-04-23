import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusVisibilityIconWidget extends StatelessWidget {
  final PleromaVisibility visibility;
  final bool isPossibleToChangeVisibility;
  final bool isSelectedVisibility;

  StatusVisibilityIconWidget({
    required this.visibility,
    required this.isPossibleToChangeVisibility,
    required this.isSelectedVisibility,
  });

  @override
  Widget build(BuildContext context) => buildVisibilityIcon(
        context: context,
        visibility: visibility,
        isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        isSelectedVisibility: isSelectedVisibility,
      );

  static Icon buildVisibilityIcon({
    required BuildContext context,
    required PleromaVisibility visibility,
    required isPossibleToChangeVisibility,
    required isSelectedVisibility,
  }) =>
      Icon(
        mapVisibilityToIconData(visibility),
        color: calculateVisibilityColor(
          context: context,
          isSelectedVisibility: isSelectedVisibility,
          isPossibleToChangeVisibility: isPossibleToChangeVisibility,
        ),
      );

  static IconData mapVisibilityToIconData(PleromaVisibility visibility) {
    switch (visibility) {
      case PleromaVisibility.public:
        return FediIcons.world;
      case PleromaVisibility.local:
        return FediIcons.instance;
      case PleromaVisibility.unlisted:
        return FediIcons.unlisted;
      case PleromaVisibility.direct:
        return FediIcons.message;
      case PleromaVisibility.list:
        return FediIcons.lists;
      case PleromaVisibility.private:
        return FediIcons.private;
    }
  }
}
