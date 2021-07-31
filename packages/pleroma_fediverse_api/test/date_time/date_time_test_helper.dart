// ignore_for_file: no-magic-number
class DateTimeTestHelper {
  static DateTime createTestDateTime({required String seed}) =>
      DateTime(1900 + seed.hashCode % 100);
}
