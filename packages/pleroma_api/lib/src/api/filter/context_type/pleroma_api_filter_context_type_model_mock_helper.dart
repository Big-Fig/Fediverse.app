import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'pleroma_api_filter_context_type_model.dart';

abstract class PleromaApiFilterContextTypeMockHelper {
  static PleromaApiFilterContextType generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: PleromaApiFilterContextType.values,
      );
}
