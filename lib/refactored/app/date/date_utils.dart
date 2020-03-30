class DateUtils {
  static bool isToday(DateTime dateTime) {
    var now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return dateTime.isAfter(today) && dateTime.isBefore(tomorrow);
  }

  static DateTime dayStartOf(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);
}
