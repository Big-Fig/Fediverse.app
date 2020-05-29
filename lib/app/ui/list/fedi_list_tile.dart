import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediListTile extends StatelessWidget {
  final Widget child;
  final bool isFirstInList;
  final bool noPadding;

  final oneSidePadding;

  const FediListTile({
    @required this.child,
    this.isFirstInList = false,
    this.noPadding = false,
    this.oneSidePadding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    var edgeInsets;
    if (!noPadding) {
      if (isFirstInList) {
        edgeInsets = EdgeInsets.only(bottom: oneSidePadding);
      } else {
        edgeInsets = EdgeInsets.symmetric(vertical: oneSidePadding);
      }
    } else {
      edgeInsets = EdgeInsets.all(0.0);
    }

    return Padding(
      padding: edgeInsets,
      child: Container(
          decoration: BoxDecoration(
            color: FediColors.white,
            boxShadow: [FediShadows.forListTile],
          ),
          child: child),
    );
  }
}
