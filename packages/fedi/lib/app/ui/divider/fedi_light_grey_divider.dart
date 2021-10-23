import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediLightGreyDivider extends StatelessWidget {
  const FediLightGreyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        width: double.infinity,
        color: IFediUiColorTheme.of(context).lightGrey,
      );
}
