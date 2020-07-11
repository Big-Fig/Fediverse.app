import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusActionCounterWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final int value;

  StatusActionCounterWidget({
    @required this.onPressed,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 4.0,
        ),
        child: Text(
          value.toString(),
          style: TextStyle(
            fontSize: 12,
            color: FediColors.darkGrey,
          ),
        ),
      ),
    );
}
