import '../primitive_type/primitive_type_mock_helper.dart';

class EnumMockHelper {
  static T generate<T>({
    required String seed,
    required List<T> values,
  }) =>
      values[IntMockHelper.generate(
        seed: seed,
        max: values.length,
      )];
}
