import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_field_model_impl.dart';

class PleromaApiFieldMockHelper {
  static PleromaApiField generate({
    required String seed,
  }) =>
      PleromaApiField(
        name: seed + 'name',
        value: seed + 'value',
        // ignore: no-magic-number
        verifiedAt: DateTimeMockHelper.generate(seed: seed + 'verifiedAt'),
      );
}
