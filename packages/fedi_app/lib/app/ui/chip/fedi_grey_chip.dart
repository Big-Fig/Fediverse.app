import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

class FediGreyChip extends StatelessWidget {
  final String label;

  const FediGreyChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Chip(
        label: Text(
          label,
          style: IFediUiTextTheme.of(context).smallShortWhite,
        ),
        backgroundColor: IFediUiColorTheme.of(context).grey,
      );
}
