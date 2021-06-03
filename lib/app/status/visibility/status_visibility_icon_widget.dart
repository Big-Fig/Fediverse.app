import 'package:fedi/app/status/visibility/status_visibility_ui.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusVisibilityIconWidget extends StatelessWidget {
  final PleromaApiVisibility visibility;
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
    required PleromaApiVisibility visibility,
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

  static IconData mapVisibilityToIconData(PleromaApiVisibility visibility) {
    switch (visibility) {
      case PleromaApiVisibility.public:
        return FediIcons.world;
      case PleromaApiVisibility.local:
        return FediIcons.instance;
      case PleromaApiVisibility.unlisted:
        return FediIcons.unlisted;
      case PleromaApiVisibility.direct:
        return FediIcons.message;
      case PleromaApiVisibility.list:
        return FediIcons.lists;
      case PleromaApiVisibility.private:
        return FediIcons.private;
    }
  }
}
