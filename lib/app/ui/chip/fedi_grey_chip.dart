import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';

class FediGreyChip extends StatelessWidget {
  final String label;

  FediGreyChip({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) => Chip(
      label: Text(
        label,
        style: FediTextStyles.smallShortWhite,
      ),
      backgroundColor: FediColors.grey,
    );
}
