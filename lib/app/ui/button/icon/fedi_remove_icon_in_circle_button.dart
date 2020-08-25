import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediRemoveIconInCircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  FediRemoveIconInCircleButton({
    @required this.onPressed,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: Container(
          width: size,
          height: size,
          color: FediColors.darkGrey.withOpacity(0.8),
          child: Icon(
            FediIcons.remove,
            color: FediColors.white,
            size: size * 0.6,
          ),
        ),
      ),
    );
  }
}
