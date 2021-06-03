extension DateTimeExtension on DateTime {
  Duration get durationFromNow => difference(DateTime.now());

  Duration? calculateExpiresInDurationOrNull() {
    DateTime expiresAtDateTime = this;
    var now = DateTime.now();

    if (now.isAfter(expiresAtDateTime)) {
      var difference = now.difference(expiresAtDateTime);
      return difference.abs();
    } else {
      return null;
    }
  }
}
