class CustomDateUtils {
  static bool isToday(DateTime dateTime) {
    var now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day, 23, 59, 59);
    return dateTime.isAfter(today) && dateTime.isBefore(tomorrow);
  }

  static DateTime dayStartOf(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0, 0, 0);

  static DateTime minuteStartOf(DateTime dateTime) => DateTime(dateTime.year,
      dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, 0, 0, 0);

  static bool isSameDay(DateTime date1, DateTime date2) =>
      dayStartOf(date1).compareTo(dayStartOf(date2)) == 0;

  static bool isSameMinute(DateTime date1, DateTime date2) =>
      minuteStartOf(date1).compareTo(minuteStartOf(date2)) == 0;
}
