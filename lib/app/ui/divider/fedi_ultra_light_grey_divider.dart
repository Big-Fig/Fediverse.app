import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediUltraLightGreyDivider extends StatelessWidget {
  final double height;

  const FediUltraLightGreyDivider({this.height = 1});

  @override
  Widget build(BuildContext context) => Container(
      height: height,
      width: double.infinity,
      color: IFediUiColorTheme.of(
        context,
        listen: true,
      ).ultraLightGrey);
}
