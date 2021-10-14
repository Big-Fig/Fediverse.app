import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediListTile extends StatelessWidget {
  final Widget child;
  final bool isFirstInList;
  final bool noPadding;

  final double oneSidePadding;

  const FediListTile({
    Key? key,
    required this.child,
    this.isFirstInList = false,
    this.noPadding = false,
    this.oneSidePadding = FediSizes.smallPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets edgeInsets;
    if (!noPadding) {
      if (isFirstInList) {
        edgeInsets = EdgeInsets.only(bottom: oneSidePadding);
      } else {
        edgeInsets = EdgeInsets.symmetric(vertical: oneSidePadding);
      }
    } else {
      edgeInsets = EdgeInsets.zero;
    }

    return Container(
      color: IFediUiColorTheme.of(context).offWhite,
      child: Padding(
        padding: edgeInsets,
        child: Container(
          decoration: BoxDecoration(
            color: IFediUiColorTheme.of(context).white,
            boxShadow: const [
              FediShadows.forListTile,
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
