extension DateTimeExtension on DateTime {
  Duration get durationFromNow => difference(DateTime.now());
}
