import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediFormHeaderWidget extends StatelessWidget {
  final bool isNeedAddDivider;
  final String text;

  const FediFormHeaderWidget({
    Key? key,
    required this.text,
    required this.isNeedAddDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FediSmallVerticalSpacer(),
          Text(
            text,
            style: IFediUiTextTheme.of(context).bigTallBoldDarkGrey,
          ),
          const FediSmallVerticalSpacer(),
          if (isNeedAddDivider) const FediUltraLightGreyDivider(),
          if (isNeedAddDivider) const FediSmallVerticalSpacer(),
        ],
      );
}
