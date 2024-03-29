import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class FediStatisticItemWidget extends StatelessWidget {
  final String label;
  final String valueString;
  final Color color;

  const FediStatisticItemWidget({
    Key? key,
    required this.label,
    required this.valueString,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valueString,
          style: fediUiTextTheme.bigShortBoldDarkGrey.copyWith(
            color: color,
          ),
        ),
        Text(
          label,
          style: fediUiTextTheme.mediumTallDarkGrey.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
