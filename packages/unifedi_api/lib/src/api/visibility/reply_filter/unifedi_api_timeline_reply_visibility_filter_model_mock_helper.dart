import 'package:fediverse_api/fediverse_api_mock_helper.dart';
import 'unifedi_api_timeline_reply_visibility_filter_model.dart';

abstract class UnifediApiReplyVisibilityFilterMockHelper {
  static UnifediApiReplyVisibilityFilter generate({
    required String seed,
  }) =>
      EnumMockHelper.generate(
        seed: seed,
        values: UnifediApiReplyVisibilityFilter.values,
      );
}
