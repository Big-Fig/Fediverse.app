extension DurationExtension on Duration {
  int get totalSeconds =>
      (inMilliseconds / Duration.microsecondsPerMillisecond).floor();
}

extension IntDurationExtension on int {
  Duration toDuration() => Duration(seconds: this);
}
