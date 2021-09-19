abstract class FakeIdHelper {
  static String generateUniqueId() =>
      '${DateTime.now().millisecondsSinceEpoch}';
}