import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

final secondsFormat = NumberFormat("00");

class FediPlayerControlDurationWidget extends StatelessWidget {
  final Duration duration;

  FediPlayerControlDurationWidget({
    @required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    int totalMinutes;
    var durationExist = duration != null;
    if (durationExist) {
      totalMinutes = duration.inMinutes +
          duration.inHours * 60 +
          duration.inDays * 24 * 60;
    } else {
      totalMinutes = 0;
    }
    var seconds = duration?.inSeconds ?? 0;
    return Text(
      "$totalMinutes:${secondsFormat.format(seconds)}",
      style: durationExist
          ? IFediUiTextTheme.of(context).smallShortBoldWhite
          : IFediUiTextTheme.of(context).smallShortBoldGrey,
    );
  }
}
