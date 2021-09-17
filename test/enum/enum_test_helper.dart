class EnumMockHelper {
  static T createTestEnum<T>({
    required String seed,
    required List<T> values,
  }) =>
      values[seed.hashCode % values.length];
}
