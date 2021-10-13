import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediEmptyWidget extends StatelessWidget {
  final String title;
  final String? subTitle;

  const FediEmptyWidget({
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return Padding(
      // ignore: no-magic-number
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: fediUiTextTheme.giantTitleShortBoldDarkGrey,
          ),
          if (subTitle != null) const FediSmallVerticalSpacer(),
          if (subTitle != null)
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: fediUiTextTheme.bigTallDarkGrey,
            ),
        ],
      ),
    );
  }
}
