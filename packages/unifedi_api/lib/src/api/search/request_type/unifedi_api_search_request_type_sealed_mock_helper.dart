import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_search_request_type_sealed.dart';

abstract class UnifediApiSearchRequestTypeMockHelper {
  static UnifediApiSearchRequestType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiSearchRequestType.values,
      );
}
