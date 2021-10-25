// ignore_for_file: no-magic-number
import '../primitive_type/primitive_type_mock_helper.dart';

class DateTimeMockHelper {
  static DateTime generate({
    required String seed,
  }) =>
      DateTime(
        1900 +
            IntMockHelper.generate(
              seed: seed,
              max: 30,
            ),
      );
}
