import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediListTile extends StatelessWidget {
  final Widget child;
  final bool isFirstInList;
  final bool noPadding;

  FediListTile({
    @required this.child,
    this.isFirstInList = false,
    this.noPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    var edgeInsets;
    if (!noPadding) {
      if (isFirstInList) {
        edgeInsets = EdgeInsets.only(bottom: 8.0);
      } else {
        edgeInsets = EdgeInsets.symmetric(vertical: 8.0);
      }
    } else {
      edgeInsets = EdgeInsets.all(0.0);
    }

    return Padding(
      padding: edgeInsets,
      child: Container(
          decoration: BoxDecoration(
            color: FediColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 3,
                blurRadius: 7,
              )
            ],
          ),
          child: child),
    );
  }
}
