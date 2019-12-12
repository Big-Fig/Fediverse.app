import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

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
        child: Text(Jiffy(widget.dateTime).fromNow()),
      ),
    );
  }
}
