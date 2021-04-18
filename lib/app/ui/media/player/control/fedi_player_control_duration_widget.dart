import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final secondsFormat = NumberFormat("00");

class FediPlayerControlDurationWidget extends StatelessWidget {
  const FediPlayerControlDurationWidget();

  @override
  Widget build(BuildContext context) {
    var duration = Provider.of<Duration?>(context);
    int totalMinutes;
    var durationExist = duration != null;
    if (durationExist) {
      totalMinutes = duration!.inMinutes +
          duration.inHours * Duration.secondsPerMinute +
          duration.inDays * Duration.hoursPerDay * Duration.secondsPerMinute;
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
