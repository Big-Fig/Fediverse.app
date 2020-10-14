import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

typedef DateTimeAgoTextBuilder = String Function(String timeAgoString);

class DateTimeDynamicTimeAgoWidget extends StatefulWidget {
  final DateTime dateTime;
  final TextStyle textStyle;
  final DateTimeAgoTextBuilder customTextBuilder;

  DateTimeDynamicTimeAgoWidget({
    @required this.dateTime,
    @required this.textStyle,
    this.customTextBuilder,
  });

  @override
  _DateTimeDynamicTimeAgoWidgetState createState() =>
      _DateTimeDynamicTimeAgoWidgetState();
}

class _DateTimeDynamicTimeAgoWidgetState
    extends State<DateTimeDynamicTimeAgoWidget> {
  Timer timer;
  bool disposed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var timeToFirstUpdate = 60 - widget.dateTime.second;
    // synchronize redraw at 00 seconds for each minute
    Future.delayed(Duration(seconds: timeToFirstUpdate), () {
      if (!disposed) {
        timer = Timer.periodic(Duration(minutes: 1), (_) {
          // redraw timeago each minute
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // todo: localize
    var timeAgoString = timeago.format(widget.dateTime, locale: 'en_short');
    return Text(
      widget.customTextBuilder != null
          ? widget.customTextBuilder(timeAgoString)
          : timeAgoString,
      style: widget.textStyle,
    );
  }
}
