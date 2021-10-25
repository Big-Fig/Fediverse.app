import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_search_request_type_sealed.dart';

abstract class PleromaApiSearchRequestTypeMockHelper {
  static PleromaApiSearchRequestType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiSearchRequestType.values,
      );
}
