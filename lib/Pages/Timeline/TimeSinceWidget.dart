import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeSinceWidget extends StatefulWidget {
  final DateTime dateTime;

  TimeSinceWidget(this.dateTime);
  @override
  State<StatefulWidget> createState() {
    return _TimeSinceWidget();
  }
}

class _TimeSinceWidget extends State<TimeSinceWidget> {
  String timeSinceString;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(timeago.format(widget.dateTime, locale: 'en_short')),
      ),
    );
  }
}
