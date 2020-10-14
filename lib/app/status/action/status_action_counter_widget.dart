import 'package:fedi/app/ui/fedi_text_styles.dart';
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
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 10),
            child: Text(
              value == 0 ? "" : value.toString(),
              style: FediTextStyles.smallShortDarkGrey,
            ),
          ),
        ),
      );
}
