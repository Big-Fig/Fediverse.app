import 'package:flutter/widgets.dart';

class DurationDateTime {
  final Duration duration;
  final DateTime dateTime;

  DurationDateTime({
    @required this.duration,
    @required this.dateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationDateTime &&
          runtimeType == other.runtimeType &&
          duration == other.duration &&
          dateTime == other.dateTime;

  @override
  int get hashCode => duration.hashCode ^ dateTime.hashCode;

  @override
  String toString() {
    return 'DurationDateTime{duration: $duration, dateTime: $dateTime}';
  }

}
