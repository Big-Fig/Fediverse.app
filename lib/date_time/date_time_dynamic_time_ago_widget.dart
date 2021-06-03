import 'dart:async';

import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

typedef DateTimeAgoTextBuilder = String Function(String timeAgoString);

const _customLocale = 'custom';

class DateTimeDynamicTimeAgoWidget extends StatefulWidget {
  final DateTime? dateTime;
  final TextStyle textStyle;
  final DateTimeAgoTextBuilder? customTextBuilder;

  DateTimeDynamicTimeAgoWidget({
    required this.dateTime,
    required this.textStyle,
    this.customTextBuilder,
  });

  @override
  _DateTimeDynamicTimeAgoWidgetState createState() =>
      _DateTimeDynamicTimeAgoWidgetState();
}

class _DateTimeDynamicTimeAgoWidgetState
    extends State<DateTimeDynamicTimeAgoWidget> {
  Timer? timer;
  bool disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ignore: no-magic-number
    final secondsInMinute = 60;
    var timeToFirstUpdate = secondsInMinute - widget.dateTime!.second;
    // synchronize redraw at 00 seconds for each minute
    Future.delayed(
      Duration(seconds: timeToFirstUpdate),
      () {
        if (!disposed) {
          timer = Timer.periodic(
            Duration(seconds: secondsInMinute),
            (_) {
              // redraw timeago each minute
              // todo: rework with stateless widget
              // ignore: no-empty-block
              setState(() {});
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages(
      _customLocale,
      _TimeagoLocalizationAdapter(
        S.of(context),
      ),
    );
    var timeAgoString = timeago.format(
      widget.dateTime!,
      locale: _customLocale,
      allowFromNow: true,
    );
    return Text(
      widget.customTextBuilder != null
          ? widget.customTextBuilder!(timeAgoString)
          : timeAgoString,
      style: widget.textStyle,
    );
  }
}

class _TimeagoLocalizationAdapter implements LookupMessages {
  final S s;

  _TimeagoLocalizationAdapter(this.s);

  @override
  String aDay(int hours) => s.timeago_aDay;

  @override
  String aboutAMinute(int minutes) => s.timeago_aboutAMinute;

  @override
  String aboutAMonth(int days) => s.timeago_aboutAMonth;

  @override
  String aboutAYear(int year) => s.timeago_aboutAYear;

  @override
  String aboutAnHour(int minutes) => s.timeago_aboutAnHour;

  @override
  String days(int days) => s.timeago_days(days);

  @override
  String hours(int hours) => s.timeago_hours(hours);

  @override
  String lessThanOneMinute(int seconds) => s.timeago_lessThanOneMinute;

  @override
  String minutes(int minutes) => s.timeago_minutes(minutes);

  @override
  String months(int months) => s.timeago_months(months);

  @override
  String years(int years) => s.timeago_years(years);

  @override
  String prefixAgo() => s.timeago_prefixAgo;

  @override
  String prefixFromNow() => s.timeago_prefixFromNow;

  @override
  String suffixAgo() => s.timeago_suffixAgo;

  @override
  String suffixFromNow() => s.timeago_suffixFromNow;

  @override
  String wordSeparator() => s.timeago_wordSeparator;
}
