extension DurationExtension on Duration {
  int get totalSeconds =>
      (inMilliseconds / Duration.microsecondsPerMillisecond).floor();
}
