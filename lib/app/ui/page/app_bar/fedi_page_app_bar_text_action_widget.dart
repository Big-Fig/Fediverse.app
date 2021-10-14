import 'package:fedi/app/ui/button/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPageAppBarTextActionWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  const FediPageAppBarTextActionWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: FediTextButton(
          text: text,
          onPressed: onPressed,
          color: color,
          padding: const EdgeInsets.only(
            right: FediSizes.bigPadding,
          ),
        ),
      );
}
