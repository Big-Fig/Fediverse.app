// ignore_for_file: no-magic-number
class DurationTestHelper {
  static Duration createTestDuration({required String seed}) =>
      Duration(seconds: seed.hashCode % 60);

  static int createTestDurationSeconds({required String seed}) =>
      Duration(seconds: seed.hashCode % 60).inSeconds;
}
