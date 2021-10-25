import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_field_model_impl.dart';

class UnifediApiFieldMockHelper {
  static UnifediApiField generate({
    required String seed,
  }) =>
      UnifediApiField(
        name: seed + 'name',
        value: seed + 'value',
        // ignore: no-magic-number
        verifiedAt: DateTimeMockHelper.generate(seed: seed + 'verifiedAt'),
      );
}
