// ignore_for_file: no-magic-number
import '../primitive_type/primitive_type_mock_helper.dart';

class DurationMockHelper {
  static Duration generate({
    required String seed,
  }) =>
      Duration(
        seconds: IntMockHelper.generate(
          seed: seed,
          max: 60,
        ),
      );
}
